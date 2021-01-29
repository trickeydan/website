---
title: "Dodgy Netgear Switches"
date: 2021-01-01
tags:
  - networking
  - ipv6
---

Finding a decent network switch these days is something that is a little more difficult than it should be in today's world. There tends to be a massive void between unmanaged super cheap switches, and twenty grand enterprise grade switches with 18,000 features that I'll never use.

My main switch for the last couple of years is a Cisco 3750G, that whilst sounding similar to a jet engine, is quite capable of doing what I need it to do. It is very much designed for use in a rack though, and is both too large and too power-hungry to place in every room in my house. My housemate also disapproves of this idea, although has succumbed to the idea of a rack in the kitchen. Apparently using ex-datacentre Mac Mini's with multiple USB ethernet adapters is preferable.

Netgear sell a range of "smart" switches, mostly of which are just based on Broadcom FASTPATH switch chips and don't really do anything particularly fancy. I bought one a couple of years ago and was thoroughly disappointed by the Web UI, so just used it as a dumb unmanaged switch to accommpany my Cisco.

Turns out that these switches do have a "Cisco-style" command line interface, although it is a bit more *raw* than the SSH terminal that I'm used to.

Models that this definitely works on:

- GS110TP
- GS108Tv2

### Getting a shell.

Turns out that we can just telnet to these switches on port `60000`

```
$ telnet 192.0.2.3 60000
Trying 192.0.2.3...
Connected to 192.0.2.3.
Escape character is '^]'.

(Broadcom FASTPATH Switching) 
Applying Interface configuration, please wait ...
```

Doesn't look particularly interesting? Well it's actually a login shell. Username is `admin` and the default password is `password`, although it may be different if you have previously changed it in the Web UI.

To do anything interesting, we need to run `enable`. It will prompt for another password, which you can just press enter to get past.

```
Applying Interface configuration, please wait ...admin
Password:********
(Broadcom FASTPATH Switching) >enable
Password:

(Broadcom FASTPATH Switching) #

```

### Useful Commands

- `show run` - Display the current configuration
- `show vlan brief` - Display configured VLANs
- `show mac-addr-table` - Display MAC addresses of connected devices
- `show version` - Display switch info. It is worth updating to the latest firmware

### Configuring Ports

The CLI here behaves quite similarly to an IOS interface.

- Enter configuration mode: `config` (not `config t`)
- Select a port to configure: `interface 0/1`

Note: You should always configure a `vlan participation exclude` to *explicitly* exclude VLANs from a port if that VLAN has **ever** been included on that port in the past.

**Native VLAN**

Setting a port to do untagged frames on VLAN 400

```
interface 0/1
description 'VLAN 400'
vlan pvid 400
vlan ingressfilter
vlan participation exclude 1
vlan participation include 400
```

**Tagged VLANs**

Setting a port to do tagged frames on VLAN 400 and VLAN 430

```
interface 0/2
description 'VLAN 400 and VLAN 430'
vlan acceptframe vlanonly
vlan ingressfilter
vlan participation exclude 1
vlan participation include 400,430
vlan tagging 400,430
```

### Extras

IPv6 SLAAC addressing: `network ipv6 address autoconfig`

Management VLAN (Make sure to change the IP address too): `network mgmt_vlan 500` 


### Caveats

Whilst making the switch usable, this CLI interface definitely isn't what this switch was designed for, and thus there are a few things to bear in mind when using it.

- Using any of the SSH related features **will crash** the switch. Even listing the settings for SSH. I suspect this is due to memory limitations, so you'll have to deal with telnet.
- Make sure you firewall off the telnet as much as possible. It's not encrypted and is just ancient
- VLAN filtering on interfaces is a bit dodgy. Make sure to set `vlan ingressfilter` to make sure that frames with an unknown VLAN ID are dropped.
- Only one telnet session at a time