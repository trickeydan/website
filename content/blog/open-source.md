---
title: The Open Source Atmosphere
date: 2019-02-26
---

Open Source software is certainly an interesting movement that has been taking over the industry more and more in recent years. I, for one, am a huge fan of open source. It seems that the large technology companies are acclined to agree with me in more recent years, IBM bought out Red Hat last October, giving them an instant industry leadership in the cloud computing sector. Around the same time, Microsoft also bought out GitHub, a move which many of my fellow open source developers saw as certain death for their favourite code hosting and collaboration platform. My friend Alex's [opinion][al] from the time is great example of how many of us felt about it. We had seen Microsoft consume many other companies that were once great and crush them into little more than a footnote.

However it seems that these moves are symptomatic of a changing industry, where open source is a benefit to companies, rather than a chain around their ankle. The traditional model of selling proprietary software at a cost to the consumer is no longer the only option. An interesting example of this that I have come across recently is [Mattermost][mattermost], a self-hosted messaging platform that poses as a competitor to Slack. They have open source versions of almost all of their software, and actively encourage that you compile and distribute your own slightly modified versions. At [Questioneer][q], we are using Mattermost to communicate more effectively and it works so much better than Slack (and has a more visibly please logo since Slack changed theirs). The ability to customise the server to your requirements, audit and fix bugs as you please is really quite comforting when confidential information is being discussed. The question remains "How will Mattermost ever make a profit?", to which they have adopted a model which is becoming ever more popular. The base software that they provide is free, open source and released under the MIT licence. However if you wish to make use of some of their more advanced features, you do need to pay and upgrade to the Enterprise version. Of course, there is nothing stopping a keen developer from implementing these features themselves and maintaining a fork containing them for free. The result of pushing these changes upstream is certainly an interesting question and I guess that we will see what happens in the long run.

Whilst Mattermost is an up and coming example of how open source software is capable of creating a profitable[^1] company, there are examples of software projects that have had a company sitting behind them for years. For example, CentOS is the community project that is very closely linked and developed alongside Red Hat Enterprise Linux. Red Hat releases a slightly different version of the OS that they then offer support contracts on and guarentee stability of the system, making it ideal for critical systems and production deployment. [OPNSense][opn], [PFSense][pf] and [Proxmox][pxmx] all operate models where the entirety of their source code is open, but they offer paid support contracts in order to satisfy management in enterprise. In the case of Proxmox, they also offer access to an Enterprise repository that has more support and up to date packages, but it is completely usage without it.

The future of open source software excites me a lot and some of the innovations that are now coming out of Foundations, rather than corporations would probably come as a [surprise][dpdk] to someone who hadn't really looked. Whilst I would love to open source the code for my company, it simply doesn't work with our revenue model at this time. However, we are working to be able to open source some of the components of our technology, hopefully helping people everywhere to work together for the good of us all.

[al]: https://lockwood.me/blog/on-the-acquisition-of-github/
[mattermost]: https://mattermost.com/
[q]: https://questioneer.co.uk
[j5]: https://github.com/j5api/j5
[centos]: https://www.centos.org/
[opn]: https://opnsense.org/
[pf]: https://www.pfsense.org/
[pxmx]: https://www.proxmox.com/en/i
[dpdk]: https://www.dpdk.org/wp-content/uploads/sites/35/2017/09/DPDK-Userspace2017-Day2-9-pfSense.pdf

[^1]: Mattermost is a startup. I doubt that they're currently making a profit.
