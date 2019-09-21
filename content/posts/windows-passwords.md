---
title: How Windows stores passwords
date: 2019-09-21
---

I spent a large amount of my summer this year working on a project related to passwords in Microsoft Windows. Despite not really liking Windows, and not wanting anything to do with it before, I have since come to appreciate, its.. ahem.. interesting ways of doing things.

There are a number of common pentesting tools that can be used to extract password hashes from Windows, such as `DCSync`, `Mimikatz` and `impacket-secretsdump`. However it is not discussed that often about where these tools actually get the passwords from. 

So, where actually **are** the passwords stored in Windows? For this article, I'll be talking in the context of a Windows Domain, and where the passwords are stored on the Domain Controller, but it is quite similar on machines which aren't joined to a domain also. In short, there is a file at `%SYSTEMROOT%\NTDS\ntds.dit` (usually `C:\Windows\NTDS\ntds.dit`) containing the data for a JET database. Microsoft JET (Joint Engine Technology) is a database (like MySQL or PostgreSQL) from 1992. It was originally designed for use in a variety of tools and was widely used in Microsoft Access and Visual Basic. These days, it is combined with the Extensible Storage Engine (ESE), which makes improvements on consistency and makes some progress on recovery in the event of a crash. This is used for other modern tools too, such as Microsoft Exchange, BranchCache and Windows Desktop Search(Probably not Cortana though).

Windows has two main hashes that are used: LM (Lan Manager) hashes (very old), and NTHashes (slightly less old, not to be confused with NTLM or NetNTLM[^1]).

[^1]: NTHashes are often referred to as NTLM hashes. This is not the case, and this confusion can lead to a misunderstanding over what the differences are. NTLM (or actually Net-NTLM) is a group of Challenge-Response protocols that are used for remote authentication in Windows systems. The NTHash (and sometimes LM) is used to calculate the response to the challenge, as well as to verify it. It is still useful to capture the NTLM response, as we can bruteforce this to find the hash and perform further attacks. 
