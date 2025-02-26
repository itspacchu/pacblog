---
title: "Kuber-oopsie"
date: 2025-02-24T00:00:00Z
draft: false
cover:
  image: https://github.com/itspacchu/static_dump/assets/37984032/e55bf6d1-bd4c-476b-966b-6ec3d46237ed
---


> Just got off a meeting at 1:30 am after a massive cluster outage on our onpremises clusters ... Sigh! 
> What happened! I don't know..I really don't know (well sorta?), We had a long..Seriously long 9 hour meetings where all that happened was discussions and discussions!

## Eh?

Hyderabad hosted its Python Conference and we were meeting up nearby with friends. Coworker was tasked with upgrading the onprem kubernetes cluster from 1.26 -> 1.27 using predetermined steps.


#TODO

### Why?

- Calico got deleted?
- Ingress controller was deleted? Reinstalled?
- Cilium was upgraded to unsupported k8s version?
- Firewall was tampered with?
- CoreDNS was reinstalled?

### Fixes

- Reinstated Calico as primary cni
- Removed Incompatible Cilium
- Firewall..Ohboi this caused another issue

### After Quakes

- Firewall reinstating caused SSH lockout!!!
- Nodes were restarted and unapplied configs borked networking on cluster
- Nothing was working..N O T H I N G!

- Fresh cluster install
- Unneeded meetings 8..9..10Hours long
- Tired 2AM Fixes peaceful

### What happened?
## What..
# what..

