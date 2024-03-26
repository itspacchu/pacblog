---
title: "Homelab"
date: 2024-03-23T13:26:33Z
draft: false
---

Greetings paclings,

I have been homelabbing since a very long time, ever since I got my `Raspberry Pi 2`.

It ran the default rasbian (not even minimal version [2017]) all stared off with a basic SAMBA server installation for a spare HDD I have lying around and then found out about more and more amazing self hosted tools.

Then we found out about `Oracle Free Tier` which gave us access to a beefy 1 x `4 Core, 24G, Ampere Arm CPU` , 2 x `1 Core, 1G, AMD EPYC CPU` instance, with a combined Storage of roughly 150G. This is what we've been using for the past 4 years whilst having a local backup to Local Pi. 
> I know this isn't considered homelab anymore cause it's using cloud but well I'd consider it as Selfhosting journey.

There was this little tool `docker` which was starting to gain popularity and slowly all the deployments were happening through containerization. Docker was installed in all these machines and most of the self hosted applications were moved from host to containers.

## What I have on my homelab

Few things I always tend to have:

- Needs
    - SAMBA/NFS server 
    - [Pi-hole](https://pi-hole.net/)
    - Portainer
    - ~~VSCode Dev Server~~
    - [~~Gitea~~](https://about.gitea.com/)
    - ~~Nextcloud~~
    - [Immich](https://immich.app/) 
- Additional
    - Minecraft Server
    - This Blog (https://prashantnook.in) ![](https://github.com/itspacchu/pacblog/actions/workflows/runner.yaml/badge.svg)
    - Grafana, Prometheus
- Development
    - MangaToKindle Bot 
    - PacGo Bot ![](https://github.com/itspacchu/pacgobot/actions/workflows/docker-image.yml/badge.svg)

... and couple of Torrent Downloaders which will download to my Storage (Where this website's CDN is hosted to)


## Infrastructure

Currently I am running a 2x Raspberry Pi 4 , 1x Raspberry Pi 3 Cluster using [K3s](https://k3s.io/).

> from k3s.io

```K3s is a highly available, certified Kubernetes distribution designed for production workloads in unattended, resource-constrained, remote locations or inside IoT appliances.```

Since Raspberry Pi's are resouce contrained I decided to go with `k3s` instead of something more traditional like `kubeadm`, Well there is very minimal differences between both which aren't really affecting me. k3s also comes with preconfigured Ingress and LoadBalancer `Traefik` which I have disabled. The default storageClass which was pretty handy setting up Samba.

Here is small simplified overview graph of the homelab setup I have.

![Homelab](https://github.com/itspacchu/static_dump/assets/37984032/6001670d-a193-40c3-b43e-101928ee85c8)



```sh
pacchu@homelab ~> k get deploy -n blog
NAME      READY   UP-TO-DATE   AVAILABLE   AGE
pacblog   1/1     1            1           3d23h
---
pacchu@homelab ~> k get deploy -n pihole
NAME     READY   UP-TO-DATE   AVAILABLE   AGE
pihole   1/1     1            1           7d

```

There were alot of endpoints to prashantnook.in which were migrated when oracle cloud account was suspended.

- https://portainer.prashantnook.in
- https://nginx.prashantnook.in

Some endpoints which are still available which run my Minecraft server are active (They are not hosted on raspberry Pis as they lack the compute needed)

- [mc.prashantnook.in:25565](mc.prashantnook.in:25565)

Feel free to join in and explore the server, Its on version 1.19.2

Some infrastructure of IIIT were hosted on the endpoints which are now taken down. (Why did I put infra from IIIT on my servers? Restrictions .. alot of network proxy blocking firewalls.)

Yeah for now these are all the things I have migrated off from Oracle cloud to my little onprem server. Currently webui tools like portainer, grafana and other metrics are only hosted internally.

I would probably update my blog if any new things I might add to this so...

![image](https://github.com/itspacchu/static_dump/assets/37984032/6263c3a5-5376-42b7-934d-c341e9b5557d)

PS I was listening to this song while writing this :D

<iframe style="border-radius:12px" src="https://open.spotify.com/embed/track/6b8W8vWuMJTo2UAj9LJiaA?si=3bc312d6a4404f75?utm_source=generator&theme=0" width="100%" height="152" frameBorder="0" allowfullscreen="" allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture" loading="lazy"></iframe>
