---
title: Unifi Controller on Debian Buster
date: 2020-09-27
---

Ubiquiti make a line of networking equipment, popular among homelab and home networking people, called [UniFi][unifi]. I've had a couple of their UAP-AC-Pro access points for a about 2 years now, and they're absolutely excellent. Probably overkill for my three bedroom house, but I've yet to come across anything to beat them. You can find them at decent prices on eBay too, if you're willing to wait around for a while and buy them without the PoE injectors (mine cost about £45 each, brand new, vs. £148 RRP on Amazon at the time of writing).

One of my favourite things about these APs is that the controller does not necessarily have to run all of the time when the APs are on. Of course, if you don't have the controller on, you do lose out of some of the statistics if you aren't collecting them over SNMP. In my opinion, this makes the UniFi Cloud Key, a complete waste of money; especially when you compare the cost to a Raspberry Pi.

This is a guide to installing UniFi Controller on Debian Buster, which is something I've found myself doing alarmingly regularly recently, and making the same mistakes each time.

## Preparation

I'm performing this install in an LXD container, running Debian 10 (Buster) with two network interfaces: one on my management LAN, and the other on my services LAN. The management LAN is where the APs live, and is entirely isolated from the Internet.

## Dependencies

- `gnupg2` - Required for `apt-key` to handle PGP keys.
- `multiarch-lib` Required by libssl

## Add Package repos

We need to add a couple of extra package repos.

### UniFi

Ubiquiti operate a Debian repo for their software, albeit only for Stretch. We'll use it anyway, it's up to date if you ignore the dependencies.

```
# echo 'deb https://www.ui.com/downloads/unifi/debian stable ubiquiti' | sudo tee /etc/apt/sources.list.d/100-ubnt-unifi.list
# wget -O /etc/apt/trusted.gpg.d/unifi-repo.gpg https://dl.ui.com/unifi/unifi-repo.gpg
```

### MongoDB

MongoDB is not available in Debian 10. We also need an old version of it.

```
# wget -qO - https://www.mongodb.org/static/pgp/server-3.4.asc |  apt-key add -
# echo "deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/3.4 main" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list
```

We also need an ancient version of LibSSL. **Don't expose this box to the web with old SSL libraries!**

```
# wget http://security.debian.org/debian-security/pool/updates/main/o/openssl/libssl1.0.0_1.0.1t-1+deb8u12_amd64.deb
# dpkg -i libssl1.0.0_1.0.1t-1+deb8u12_amd64.deb
```

## Java 11 Hack

The UniFi package expects to be running under Java 8. We can trick it into running under Java 11.

```
# echo 'JAVA_HOME="$( readlink -f "$( which java )" | sed "s:bin/.*$::" )"' | sudo tee /etc/default/unifi
# ln -s /usr/lib/jvm/java-11-openjdk-amd64/lib/ /usr/lib/jvm/java-11-openjdk-amd64/lib/amd64
```

## Installing UniFi

First, let's get the package listing for those repos.

```
# apt update
```

Now we can actually install!

```
# apt install unifi
```

[unifi]: https://unifi-network.ui.com/
