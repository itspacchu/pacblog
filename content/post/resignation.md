---
title: "Rant + Resignation"
date: 2025-03-24T00:00:00Z
draft: true
---

- I feel like this is a valuable lesson for me to have an audit for all the work you're doing, and how managerial changes the work culture entirely.

- I still have respect for my previous 2 managers who mentored me throught, I learnt alot of things from them.

- Realised how technically illiterate people can adversely hamper progress for alot of things.

I am not personally attacking anyone in this rant, just letting my throughts go wild and express them out in words, Please don't take this as ill intent against anyone.


## Feb 2025

### 25th Feb 2025

> Just got off a meeting at 1:30 am after a massive cluster outage on our onpremises clusters ... Sigh! 
> What happened! I don't know..I really don't know (well sorta?), We had a long..Seriously long 9 hour meetings where all that happened was why,why..... and why!

#### Eh?

Hyderabad hosted its Python Conference which I went to attend on a Sunday!

Coworker was tasked with upgrading the onprem kubernetes cluster from 1.26 -> 1.27 using predetermined steps. Things that happened in meanwhile...

- Calico cni got deleted?
- Ingress controller was deleted? Reinstalled?
- Cilium was upgraded to version that is unsupported by existing k8s version!
- Firewall was disabled!
- CoreDNS was reinstalled.

#### Fixes

- Reinstated Calico as primary cni
- Removed Incompatible Cilium
- Firewall..Oh boi this caused another issue

#### After Quakes

- Firewall reinstating caused SSH lockout!!!
- Nodes were restarted and unapplied configs borked networking on cluster
- Someone tampered with fstab leading to unmounted drives and DB failing.. notifications.. alarms.. alerts everywhere!
- Nothing was working..N O T H I N G!

- Fresh cluster install
- Unneeded meetings 8..9..10 Hours long

Eventually I was seriously pissed tired and sleepy and straight up told my manager I was tired, while being told how production is important... Startup culture is like this  (My brain at this point gave up)

After the call I gave one last attempt at fixing it peacefully without being on call... The peacefulness helped.

---

## October 2024

I was experimenting with a network sharing tool on my personal raspberry pi, due to some clipboard issue (probably) I had accidentally pasted `docker tag external/registry gitlab.com/itspacchu...` in work ssh terminal instead of my own ssh terminal.. this was in *October 2024*.

> Docker tag will fail if image doesn't exist!

---

## March 2025

I was told about I was responsible for installing XMRig (Crypto??) on Work machines. 

#### 15th March 2025 @ 6:42 AM

I checked grafana and saw a peak around the time.. I checked this after I woke up

![xmrig](https://github.com/user-attachments/assets/7f7ff948-e4c0-4a7b-9c24-c675d621d404)

I was in Mumbai having a vacation with my friends since I had too many Paid Leaves which will be Expired at end of that month.

![hotel?](https://github.com/user-attachments/assets/2328f6d5-b985-464d-a3cd-21427bb353d0)


#### March 18th 

- Had a meeting with Manager and Vice President regarding the `Oct 2024` "docker tag" command and they've stated network sharing tool is a malware which I have **installed?**, which caused a breach _( Fine yes, me running that command is a breach of contract since I ran it on the company infra, That is a mistake on my end )_.

- I got locked out of my AWS account without any warning and my ssh keys revoked from server while I was working on an issue.

#### March 19th 

- I got a call from HR ... I put in my resignation, after all this blame game.

...

> Becareful out there folks!