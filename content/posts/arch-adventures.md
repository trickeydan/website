---
title: Adventures under the Arch
date: 2018-11-01
---

## The Dark Ages

I distinctly remember when the first major update for Windows 10 was released. I was somewhat excited, all of the bugginess and things that were initially wrong were going to be fixed! I was quite wrong. By the end of that day, I had switched to Linux. Admittedly, the reason that my disk was corrupted by the Windows update was partially my fault; I had a setup that would have been considered somewhat unusual for the usual Windows user. Yet, I still firmly believe that Microsoft should actually tell their support staff that reinstalling an encrypted system does tend to lose data.

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

In conclusion, this was simulaneously a good and absolutely awful .

## Ansible + Arch

![](https://imgs.xkcd.com/comics/cautionary.png)

[^1]: I use `vim` :P

[minty]: https://linuxmint.com/
[ubuntu]: https://www.ubuntu.com/
[i3wm]: https://i3wm.org/
[rofi]: https://github.com/DaveDavenport/rofi
