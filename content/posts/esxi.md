+++
date = "2018-01-04"
title = "Server Blog 1: Setting up ESXi and pfSense"
+++

This is the first in a series of blogs where I will be detailing instructions for how I setup my servers.

I recently hired a dedicated server from [Oneprovider](https://oneprovider.com/), which is essentially a resold Dedibox from [Online.net](https://www.online.net/en). I have had the opportunity to play around with it a bit and get used to the platform. Now it is time to setup my new computer network using this. I will be talking about this in detail in later posts, but this post is about setting up ESXi and pfSense for routing.

## Why ESXi?

I know that many people will criticise me for this choice of hypervisor, as many non-proprietary alternatives do exist, such as KVM. However, during my testing, this was the easiest to configure and has a graphical interface which is ideal for a novice.

## Setting up ESXi

I have to admit here that I feel like I cheated, Online.net has a one click install option for ESXi and this is the only way to install operating systems that they support. There are other ways using IPMI, but I nearly bricked my system using this as I didn't know how to use it properly.

Anyway, ESXi is installed on my server after setup. We need to upload iso files for operating systems to the filestore. In my case, I uploaded pfSense (for routing), Ubuntu Server (for services) and Ubuntu desktop (for debugging the network).

I started looking into networking and quickly realised that it would be very painful to pass the IP address through to the router. This would also prevent access to the hypervisor's web interface if the router failed. Thus I opted to pay extra for a second IP address to give to my router.

## Setting up the networking.

Firstly, we need to create a new vSwitch for the LAN side of our router. Next, create a port group for the new vSwitch. I have named both my switch and port group 'Core' as this will be important for later development of the network. We also need to go into the WAN switch (named vSwitch0, not very easy to change this so I just left it), create a WAN Port Group and enable promiscuous mode. This will allow our second IP address to be passed through to our router VM.

![](https://images2.imgbox.com/34/39/XyCCUOqN_o.png)

## Creating the router VM

We need to create a virtual machine for the router. I always name my machine after the FQDN of the machine for easy identification later. As pfSense is based on FreeBSD, we need to set the Guest OS to FreeBSD (64-bit).
I selected the default datastore and the following settings:

- 2 vCPU
- 2048MB RAM
- 8GB Disk
- Two network adapters, one on each vSwitch
- CDROM Drive with the pfSense ISO loaded

![Router Config](https://images2.imgbox.com/8d/2c/MQbmLl36_o.png)

Before we click next, navigate to the IP Management on the Oneprovider control panel and generate a MAC address for your failover IP.

![](https://images2.imgbox.com/fc/2a/V8ji7Dla_o.png)
![](https://images2.imgbox.com/a7/a9/63riIDth_o.png)

Boot the machine, accept the terms of service and select install. The default options should be fine for most circumstances. After the setup, the machine will reboot.

## Configuring the router

We now need to tell pfSense which interface is the LAN and which interface is the WAN network. After the router has rebooted, select option 1 to configure interfaces. The MAC addresses of the two virtual adapters will be displayed. Press n to setup VLANs later, I will write up on VLANs later.
Compare the MAC address of the WAN interface to the adapter in the vSwitch and then enter the interface names as appropiate. pfSense will now reconfigure the adapters and will show an IP that we can access the web interface over.

## Accessing the Web Configurator

The IP that pfSense will give you is almost certainly a local 192.168.1.1, which cannot be accessed from the public internet. My solution to this is to create a temporary VM on the LAN network until we get network connectivity and a port open.
I have uploaded a Ubuntu Desktop Live Image to do this, create a VM for it and boot, ensuring it is connected to the LAN network. As we are deleting this machine later, I gave it lots of RAM to speed up this process.

Ubuntu should connect to the network automatically and get both a v4 and v6 address by DHCP.

![](https://images2.imgbox.com/95/a3/2OpU7k3c_o.png)

We can now access the WebConfigurator by loading the router IP in the web browser. Ignore the certificate warning and use the default credentials. Username and password are "admin" and "pfsense" respectively.

## Getting Connectivity

Start the wizard, most fields are pretty self-explanatory. I used the Google Public DNS servers 8.8.8.8, 8.8.4.4.
When you get to the WAN Configuration, enter the following:

- Selected Type: static
- MAC Address: The address we get from OneProvider
- IP Address: Your Failover IP
- Subnet Mask: 24
- Default Gateway: If your IP is a.b.c.d, put a.b.c.1

You can leave the LAN Configuration as it is if you like, but I'm changing mine to:

]
- IP Address: 10.1.0.1
- Subnet Mask: 24

You can now finish the wizard and reload the settings. If you change the IP address, you will need to navigate to the new address in your browser. You may also need to turn on and off networking on Ubuntu.

## Finishing Up

The Ubuntu VM should now be able to access the public internet.

To finish up, I'm going to open a port on the firewall so that I can access the router externally.
Go to Firewall - NAT and click Add.

Select the Destination Port as HTTPS and enter the router IP for Redirect IP.

Save and reload. You should be able to access the configurator publically now.

We can now delete the Ubuntu VM, it's no longer needed.

Up next, I will be getting IPv6 connectivity to my v4*only network.
