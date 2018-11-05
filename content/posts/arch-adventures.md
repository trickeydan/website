---
title: Adventures under the Arch
date: 2018-11-05
---

## The Dark Ages

I distinctly remember when the first major update for Windows 10 was released. I was somewhat excited, all of the bugginess and things that were initially wrong were going to be fixed! I was quite wrong. By the end of that day, I had switched to Linux. Admittedly, the reason that my disk was corrupted by the Windows update was partially my fault; I had a setup that would have been considered somewhat unusual for the usual Windows user. Yet, I still firmly believe that Microsoft should actually tell their support staff that reinstalling an encrypted system does tend to lose data.


{{< figure src="/img/posts/arch-adventures/windows.png" attr="Matthew Inman" attrlink="http://theoatmeal.com/blog/fix_computer" >}}

## Cinnamon Challenge

I had been dabbling in Linux before Windows pulled the trigger on my disk, and had become somewhat fond of Linux Mint. More specifically, I liked the familiar desktop interface, it seemed similar to Windows, with a lovely '95-like start menu and some pretty colours. I even recall installing a 'Windows 10' theme on there. I was clearly suffering from withdrawal symptoms. To make things worse, I hadn't actually installed Linux Mint. I had installed Ubuntu and then install the Cinnamon desktop interface over the top of it. I have no idea why I did this when I think back to it. It makes very little sense to me and can only conclude that somebody had advised me to do it.

This setup was riddled with problems, mainly due to Cinnamon and Unity conflicting and doing their absolute best to not work with each other.

## Garden GNOMEs

Canonical suffered a divine intervention, and dropped Unity. I decided to give GNOME 3 a go.

It was terrible. I don't like GNOME.

## ~~Intel Core~~ i3

Whilst suffering the terrible RAM shortages that one tends to whilst using GNOME, I was persuaded by one of my friends who uses [i3wm][i3wm] to give it a try. I installed it pretty easily on my Ubuntu install using `apt` and was using it within minutes. The sheer lack of bloat is likely to be the reason that I still use it to this very day. I guess that, combined with the ability to choose exactly what you wanted, from different colours, to different bars, to different menu launchers. I personally would highly recommend [rofi][rofi] as a menu launcher, the fuzzy search functionality is excellent. 

There are a couple of tiny things that bug me about i3wm, such as the absolutely featureless default bar. However, I do significantly prefer this to the bloat that is generally referred to as Polybar.

## Portable Server

As one would expect with an operating system that is aimed at consumers, Ubuntu comes with many default tools that I would argue are unnecessary, such as GNOME, systemd and nano[^1]. I thus decided to find something more lightweight and for reasons that make no sense to me anymore, and against the recommendation of my peers, I decided to install Ubuntu Server on my laptop.

It was beautiful. Lightweight. Fast.

Then networking broke. Thanks `netplan`. Even Ansible couldn't save me.

In conclusion, this was simulaneously a good and absolutely awful decision. Good because I learnt how to build a desktop environment from X packages, terrible because nothing worked.

## Ansible + Arch

Some time ago the existence of [Ansible][ansible] was mentioned to me, and foolishly I dismissed it as being yet another overtly enterprise configuration tool, much like [Puppet][puppet]. I was only partially wrong. One of my friends used Puppet[^2] to manage the configuration of packages on his Antergos install. I had always considered this to be a somewhat bloated setup, as the Puppet agent is required on the system.

As I was looking for a minimal operating system, [Arch Linux][arch] is an obvious choice, being slightly infamous for being difficult to install, difficult to configure and unstable. I won't deny these claims. However, I do wish to point out how it is the most flexible operating system that I have made use of ever. The documentation is excellent, given that you have the time to read many pages on the wiki. I have encountered some stability issues, mainly due to the rolling release nature of the operating system inevitably installing buggy packages. Yet, I am happy to sacrifice this, for the disadvantages are outweighed.

Due to the virtually limitless ways that one can configure Arch and my slight fear of having no functional laptop, I also wrote an arch install script. This essentially means that, along with my Ansible playbooks and encryption keys, my entire config can be procedurally recreated. I really like this, as it means that when I next need to reinstall, or change computer, I can install it exactly as I like in less than an hour, all whilst doing something else.

{{< figure src="/img/posts/arch-adventures/xkcd.png" attr="XKCD 456" attrlink="https://xkcd.com/456/" >}}

[^1]: I use `vim` :P
[^2]: At the time he did. I showed him Ansible and he migrated pretty quickly.

[minty]: https://linuxmint.com/
[ubuntu]: https://www.ubuntu.com/
[i3wm]: https://i3wm.org/
[rofi]: https://github.com/DaveDavenport/rofi
[ansible]: https://www.ansible.com/
[puppet]: https://puppet.com/
[arch]: https://www.archlinux.org/
