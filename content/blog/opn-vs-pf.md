---
title: OPN vs. PF
date: 2018-07-06
---

There are many articles on the internet that compare PFSense, with it's popular fork OPNSense. I realise that by writing about it I am likely to be repeating other people's points, so I am going to take a slightly different approach. This article is not trying to persuade you to use any particular system for your firewall, be that OPNSense, PFSense, some Cisco thing or even iptables. Instead, I am going to talk about why I use what I use.

## What is \*Sense?

I suppose you could say that they are all forks. Yet not in the cutlery sense. OPNSense is a fork of PFSense, and PFSense is itself a fork of m0n0wall. I'm not particularly familiar with m0n0wall, so won't be talking about it in depth. Essentially, both of these are BSD based *operating systems*, that act as an all-in-one firewall/router/combo. I don't like describing them *both* as operating systems though, as OPNSense is certainly not an operating system. It is just a set of packages that can be installed on top of any standard FreeBSD install. Whereas PFSense has made modifications to the underlying system, so has to be installed from an image. Practically though, both are installed from an image.

## Support

Both distributions take the same development model. They are both open source, developed by a company, and offer paid support options. The main difference that I found between them in terms of support is that OPNSense has much better official documentation that PFSense. Prior to OPNSense, PFSense only had rather lacking support on it's wiki pages, but is now developing a "Read The Docs" style website like OPN has. However, this is still rather lacking in detail compared to OPN. I find that the section of "How To" guides is particularly good, especially if you  are not that familiar with networking.

## API

For me, having an API is an essential part of any piece of modern software. Yet, the development team behind PFSense seems to be making little to no effort in this direction. As OPN slowly moves features in the Web GUI over to the underlying MVC framework that they are using, they are implementing an API for every function. It is very much built into the underlying fabric of the system, rather than being hacked on tip of an existing system.

Having an API on your router may not seem like something that you would want, but it is actually incredibly useful. For example, my friend [Andy](https://github.com/adimote) created a thing called "Who's in the House?". This looks at the MAC addresses of the devices on the WiFi network to work out which people are present in the house. An API on your router makes obtaining this information trivial, as you can simply request the ARP table (or NDP table) from the router.

## Development Ideology

As there always is (and always will be) with different development teams, different opinions lead to different choices made when creating the software. An example of this is the difference in the LDAP integration, where I personally side with the choice of the PFSense developers. When a user logs into PFSense, if they are in LDAP / AD, they are authenticated with the groups they are in. However, in OPNSense, LDAP / AD is *only* used to authenticate the passwords. In fact, unless you import the user, they are in fact unable to login! This is frustrating as there has to be a manual step to give a user access, rather than simply from their security groups.

## Does it really matter?

If you look on Reddit, it isn't hard to find people having a very heated discussion about these two router systems. Honestly though, there isn't a huge amount of difference in the core featureset. They are both firewalls, both routers, both can act as VPN servers, etc. To me, it comes down to personal preference, and I currently lie in the OPNSense camp. This initially was because my router box doesn't support the Intel New AES Instruction Set, and this is required for PFSense 2.5. This is really crazy as a large number of people, run these systems on a cheap celeron based system. Some would say that this is the developers being greedy, after more profit from their system sales. I just wanted security updates. I have since realised that I prefer the UI of OPNSense though, but this isn't really a critical feature to me. OPNSense is making a real effort to bring the system into the future, by slowly transitioning to an MVC framework, whilst PFSense are not.

I would like to see a SAML authentication method introduced in the future as this is much nicer than using LDAP to authenticate users. Well, by nicer I mean more secure. At some point I may find time to develop such a feature, where I would do it for OPNSense.
