---
title: "Homelab Antics 1: Routers"
date: 2021-01-29
draft: yes
---

I've run a "homelab" for a few years now, which is pretty much a pile of computers burning electricity and usually not working. It's fun though, and I've learnt a lot about networking and Linux, which is always nice. This blog series will involve me writing up various bits, and replaces the hotch-potch of mostly incorrect content I had before.

There will be a significant focus on IPv6 in this series as most of my network is IPv6-only these days in an attempt to make it a bit more simple.

Up first, building routers.

**Note to the reader: I have changed this article significantly since it was first written in an attempt to make it a bit more useful.**

## Intro: What even is a router?

To most, a router is that magic box supplied by your ISP that emits the sacred WiFi signal that the world has become so dependent on. For most, that works well enough, a single LAN behind a box that does everything.

To network engineers, a router is a (magic) box that pushes packets in different directions. They are often combined with firewalls because it tends to make everyone's life much easier if they can't be hacked as easily.

In the usual case, the *different directions* are network interfaces. 

## How does the router know where to send the packets?


## Linux Routers

Linux can be used as a router, which is what I do these days. Specifically, I run Debian.

### Setting up some interfaces

Routers exist to move packets between different networks, which are in my example different subnets on different interfaces of the same router.

#### Physical Interfaces


#### VLANs

### Pushing the packets around

```bash
# sysctl -w net.ipv4.ip_forward=1
# sysctl -w net.ipv6.conf.all.forwarding=1
```

These settings can be made persistent by editing `/etc/sysctl.conf`.

Linux will now send packets in the right directions according to the kernel's routing table.

```
default via fe80::dda6:32ff:feb8:8314 dev eth0.600 proto ra metric 256 pref medium
2a02:390:867f:1f66::/64 dev eth0.466 proto kernel metric 256 pref medium
2a02:390:867f:1f67::/64 dev eth0.467 proto kernel metric 256 pref medium
```

## Appendix A: PF/OPNSense

I've been a user of both PFSense and OPNSense in the past, and yes I'll agree that they probably do function pretty well as a router/firewall combo that allows you to turn on various plugins and look at it all through a fancy Web UI.

There comes a point when it gets a bit annoying though:

- Why is the firewall interface so weird?
- Can I run a VPN that isn't OpenVPN?
- How do I even BSD?

In my opinion, PF/OPNSense are good for turnkey solutions to quickly build a router, but are not great for learning the nitty-gritty bits of networking, or for building anything complex.