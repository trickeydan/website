---
title: "Homelab Antics 1: Networking"
date: 2021-01-29
toc: true
tags:
  - homelab
  - networking
  - ipv6
---

I've run a "homelab" for a few years now, which is pretty much a pile of computers burning electricity and usually not working. It's fun though, and I've learnt a lot about networking and Linux, which is always nice. This blog series will involve me writing up various bits, and replaces the hotch-potch of mostly incorrect content I had before.

There will be a significant focus on IPv6 in this series as most of my network is IPv6-only.

This post focuses on the underlying network concepts and fundamentals that are essential to understanding the content later in this blog series. This post will not get into the absolute technical nitty-gritty bits, as most of these could constitute entire blog series in their own right. Some details in this post may be updated in the future as I write new articles and refer back to the fundamentals in this post.

## IP Addresses

An IP address is the address of a computer[^unicast] on the Internet. There are two types of IP addresses: IPv6 and IPv4 (legacy).

### IPv4

IPv4 addresses are 32-bit addresses, usually represented in dotted decimal format: `203.0.113.3`. These are the addresses that are referred to when somebody says that the world is running out of IP addresses. IPv4 addresses are legacy and should only really be used for compatibility with networks that have yet to catch up.

### IPv6

IPv6 addresses are 128-bit addresses, written in hexadecimal:

- `2001:db8:bee5:bee3:4323:5463:5432:dfea:fea3`
- `2600::`
- `2a02:1098:43::1`

These addresses are plentiful, we can easily give a "public" IPv6 address to every device in the world many time over. This makes it super easy to create Internet connected devices at home.

## DNS

DNS (Domain Name System) is a global, distributed hierarchical database. Many people would describe it as a way to map domain names to IP addresses (e.g `www.example.org` -> `203.0.113.3`), but it actually does a lot more than that.

A *DNS Zone* is a portion of the DNS namespace that is managed by a specific organization or administrator. Usually this is a particular *domain* and all of the *subdomains* that exist under that domain. A subzone can also be delegated to another nameserver.

The *root zone* `.` is the zone from which all domains are eventually delegated.[^delegation] [^dot]

- `.` -> `io.` -> `trickey.io.`
- `.` -> `uk.` -> `co.uk.` -> `example.co.uk.` -> `bees.example.co.uk.`

There are two types of DNS servers:

- Recursive DNS Server (aka. resolver) - queries other DNS servers to find a result for a query
- Authoritative DNS Server (aka. nameserver) - answers queries for specific DNS zones only.

DNS is accessed using port 53 on UDP (and sometimes TCP too).

## Ethernet

Ethernet is more than just a cable / connector. It's actually both an electrical standard (IEEE 802.3ab) and a protocol (IEEE 802.3) for connecting hosts on a LAN (Local Area Network).

Every host on a network has a 48-bit *MAC Address*, usually assigned by the manufacturer at the factory. Ethernet frames can be sent between hosts on the same network segment using the MAC address. Network segments can be connected using a *network switch*.

IP traffic is sent over Ethernet, using ARP and NDP to map IP addresses to the MAC address of the host.

Ethernet will be covered in more detail in the next post, which will focus on network switches.

[^delegation]: The root zone only contains records to delegrated Top Level Domains (TLDs) to other nameservers. e.g `.com`, `.uk`, `.net`
[^dot]: The root zone is represented by `.`, and technically all other domains end with a `.`, e.g `trickey.io.`. This is usually omitted for simplicity, but you should still be able to reach websites with the `.` at the [end of the domain name](https://trickey.io.)
[^unicast]: It can also be the address of multiple computers, see multicast, anycast and broadcast addressing.