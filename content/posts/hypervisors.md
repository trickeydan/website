---
title: Hypervisors
date: 2018-07-03
---

If you have read my blog post about PFSense and ESXi, you will recall that, as evidenced by the title, I use VMware ESXi as my hypervisor. Back then, my reasons were primarily that it was easy to setup and just *worked*. Since then I used ESXi on my dedicated server that I hire and it has served all my needs. It does have it's issues though. As I setup my new home network, I have decided to write a comparison of two hypervisors that you will likely have heard of and a new contender to the field. I am going to reflect on my experiences with the three stacks as I make the decision for which one to use.

## VMware

The vSphere ecosystem is arguably the dominant hypervisor in use in both the enterprise and homelab space. I have previously used it on my dedicated server and I can honestly say that I didn't like it. However, disliking a piece of software isn't always a reason to not use it. Sometimes you just have to grit your teeth and bear with it.

### The Web Interface

I used ESXi without vSphere, so cannot comment on vSphere itself, but I still can't believe how awful this was for such a widely used product. It is slow, buggy and majorly lacking in features. About four times out of ten when trying to do a task on it, it would simply throw javascript errors and log me back out. This prevented me from doing what I wanted to do, and generally frustrated me and wasted my time. It's not just this though, small things were annoying too. Despite my best efforts, I could never install my own SSL certificate on it, or even create a user besides the default `root` user.

### Lack of Support

The title of this section could be said to be entirely false. I agree! VMware has excellent support, but only if you are an enterprise customer or have a significant quantity of money. The documentation online is somewhat lacking and very technical. As it seems to be primarily aimed at sysadmins who work in Windows environments, the documentation for linux is extremely poor.

A great example of this is when I attempted to install ESXi on my new server. I had a lot of issues creating a usb drive with the installer that would even boot, and this involved diving through mailing lists and fiddling with isolinux settings. Not exactly user friendly. I then found, after it booted that it refused to recognise the disks. VMware doesn't support older hardware and doesn't release drivers for most things. It seems to very much be aimed at the enterprise space.

### Expensive

A VMware licence is expensive. Very expensive. Fortunately I am able to get a free licence through my university, but this will not work for me once I graduate. Again, this looks like it's aimed at the enterprise space, very much a theme with VMware.

## Proxmox

Proxmox was originally recommended to me by my friend [Tim Stallard](https://timstallard.me.uk), as he uses it for his two VM hosts. I tried it before in January, but found it to be more painful than VMWare. This time, I have found the opposite. Proxmox is quick and easy to install, as it's based on Debian 9. The web interface isn't the prettiest, but is functional. Behind the scenes, KVM and LXC are in use, allowing you to run both full virtual machines and containers. The pve-docs which are included are a great resource for managing this system and made me aware that you can manage it entirely through the command line.

More advanced things will require fairly in depth linux knowledge, but this hasn't been an issue for me.

## Zetastack

Zetastack is the newcomer to the hypervisor arena, and initially I thought that it was an entirely new, somewhat promising looking piece of software. It looked as though it could be a real competitor to VMware and disrupt the market a little bit.

Once I started to install it on my host, I began to notice some issues. The installer bears a lot of resemblance to Proxmox's, albeit significantly slower. I also had issues setting up a software RAID, whereas in Proxmox's installer this was a single button click. After installation, it wasn't immediately clear how to access the system, and a quick search gave no help. As Zetastack is so new, there is a significant lack on information online. Eventually, I accessed the web interface on `https` port 443.

Upon loading the page, it asked for activation immediately.

{{< figure src="/img/posts/hypervisors/activation.png" width="50%" caption="The Activation Page">}}

This was a smooth, easy process, but it did take a while for the email to come through.

The Web GUI is HTML5 and lightning fast, even compared to Proxmox. It isn't particularly intuitive, but then no similar software is.

There is no easy guide to setting up a VM and I was surprised to find that storage wasn't configured already. Upon trying to do this, I encountered an error because it was trying to format my disks? It appears that it requires a separate disk for the Zetastack software, to where the VM data is stored.

{{< figure src="/img/posts/hypervisors/error.png" width="50%" caption="My disks were already in use.">}}

~~Zetastack appears to be a fork of Proxmox, with many of the GUI elements feeling familiar to me.~~ See update below. I think that it could be promising in the future, but requires more work before I would consider using it. I am excited to see a potential competitor to VMware and will be watching Zetastack with a close eye.

## Conclusion

After testing Zetastack, and failing to install ESXi, I have decided to use Proxmox for my hypervisor. It is fast, well supported and based off known-good technologies. It has some open source elements, which I always see as an advantage when choosing software.

I hope that I will find time to write about how I setup the network in my new house, which will be occuring over the next weeks. At the very least, I will post some photographs of my "HomeLab", as I have claimed the under-stairs cupboard for networking and computers only.

## Update: I was slightly wrong

When I initially posted this, I wrongly assumed that Zetastack was a fork of Proxmox. I have since been corrected by [Tim Stallard](https://timstallard.me.uk), who upon his investigations, found that it is a completely independant PHP wrapper around `libvirt`. It is not open source, the code is actually obfuscated! My other comments still stand though, but I am disappointed about the non-openness of it.
