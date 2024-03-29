---
title: "Homelab"
date: 2024-03-23T13:26:33Z
draft: false
cover:
  image: https://github.com/itspacchu/static_dump/assets/37984032/e55bf6d1-bd4c-476b-966b-6ec3d46237ed
---

Greetings paclings,

I have been homelabbing since a very long time, ever since I got my `Raspberry Pi 2`.

> 2017 - Oldest photo I've gotten of my Pi 2
![firstpi](https://github.com/itspacchu/static_dump/assets/37984032/13097803-a7d4-48a6-9309-63799f505cee)



It ran the default rasbian (not even minimal version [2017]) all stared off with a basic SAMBA server installation for a spare HDD I have lying around and then found out about more and more amazing self hosted tools.

Then we found out about `Oracle Free Tier` which gave us access to a beefy 1 x `4 Core, 24G, Ampere Arm CPU` , 2 x `1 Core, 1G, AMD EPYC CPU` instance, with a combined Storage of roughly 150G. This is what we've been using for the past 4 years whilst having a local backup to Local Pi. 
> I know this isn't considered homelab anymore cause it's using cloud but well I'd consider it as Selfhosting journey.

I have been updating the setup from a lone Raspberry pi 2 since that time.

> 2021 - New PIs join the family
![RPI3 time](https://github.com/itspacchu/static_dump/assets/37984032/73e70f9f-884c-4803-a586-3f9608eaf5c6)

> 2022 - Its taking shape (I know its a bad idea to put there)
![New more pis](https://github.com/itspacchu/static_dump/assets/37984032/96429f43-2b23-4ae2-a253-e2f2559747ec)


## Homelab Infrastructure

Currently I am running a 2x Raspberry Pi 4 , 1x Raspberry Pi 3 Cluster using [K3s](https://k3s.io/).

> from k3s.io

```K3s is a highly available, certified Kubernetes distribution designed for production workloads in unattended, resource-constrained, remote locations or inside IoT appliances.```

Since Raspberry Pi's are resouce contrained I decided to go with `k3s` instead of something more traditional like `kubeadm`, Well there is very minimal differences between both which aren't really affecting me. k3s also comes with preconfigured Ingress and LoadBalancer `Traefik` which I have disabled. The default storageClass which was pretty handy setting up Samba.

Here is small simplified overview graph of the homelab setup I have.

![Homelab](https://github.com/itspacchu/static_dump/assets/37984032/6001670d-a193-40c3-b43e-101928ee85c8)

## What I have on my homelab

Few things I always tend to have:

- #### Needs
    - ##### SAMBA/NFS server:
        This is the main storage solution I've gotten for storing everything basically. It now consists of 1TB SSD + 1TB HDD + 128G SSD (Boot Drive)
    - ##### [Pi-hole](https://pi-hole.net/)
        Pi-hole is a Network wide adblocker which works by filtering out DNS requests which belong to known ad providers, This is basically my internal DNS server as well which routes to various things internally.

        ```sh
        pacchu@homelab ~> k get deploy -n pihole
        NAME     READY   UP-TO-DATE   AVAILABLE   AGE
        pihole   1/1     1            1           7d

        ```

        This is mainly used for local devices to use it as DNS instead of network wide adblocking due to an issue with my OpenWRT Router configuration.

    - ##### Portainer
        Portainer is something [@leojfrancis](https://github.com/leojfrancis) introduced me to, This is basically a web UI for docker, kubernetes and bunch of other things. Primarily being used for Kubernetes and Immich Docker server (5 nodes free limit).
    - ##### VSCode Dev Server
        I Used to use VS Code dev server to centralize all my projects while programming, As I tend to jump between my PC and laptop (and um.. why not)
        ![watch lol](https://github.com/itspacchu/static_dump/assets/37984032/48cfb243-41cc-4f5f-bac4-ebcc46bdd910)
        I now have removed this as Remote Codespaces Extensions provides and much more seamless experience.

    - ##### ~~Gitea~~
        I used to use a internal git server which manages config files before pushing changes to github, But later realised using Github + Gitlab would be a better choice.
        
    - ##### ~~Nextcloud~~
        This was the time Google photos decided to go from fully free to all android devices to a paid service which ties to Google free 15G Limit, I was testing out various photo backup solutions and Nextcloud was one of them.
    - ##### [Immich](https://immich.app/)
        Immich is a faily new addition to my homelab as it has recently gotten traction on r/Selfhosted Subreddit. A Google photos self hosted alternative, Pretty impressive project by the folks developing Immich. Thank you for bringing this amazing project.
        This has been my secondary backup solution for all the photos including my parent's photos.
        ![immich logo](https://immich.app/img/immich-logo-stacked-dark.svg)

- Additional
    - ##### Minecraft Server
        I Absolutely love playing minecraft and It has been my goto game to have fun with friends, This is hosted for us all to play and have fun.
        - [mc.prashantnook.in:25565](mc.prashantnook.in:25565)

        ![roobling](https://github.com/itspacchu/static_dump/assets/37984032/1f0602c1-550f-4a4c-8ae4-9d02d74bae43)

        Feel free to join in and explore the server, Its on version 1.19.2
    - ##### This Blog (https://prashantnook.in) ![](https://github.com/itspacchu/pacblog/actions/workflows/runner.yaml/badge.svg)
        ```bash
            pacchu@homelab ~> k get deploy -n blog
            NAME      READY   UP-TO-DATE   AVAILABLE   AGE
            pacblog   1/1     1            1           3d23h
            ---
        ```
    - #### Grafana, Prometheus
        Monitoring stuff which I will be messing around for metrics
- Development
    - #### MangaToKindle Bot 
        This is a side project which lets me send manga/webtoons to my kindle in a kindle supported format. This uses Kubernetes api to automatically create jobs to convert manga.
        ![manga2kindlebot](https://github.com/itspacchu/static_dump/assets/37984032/7a6efb53-953a-41f1-83ef-0d4d96ca1052)
    - #### PacGo Bot ![](https://github.com/itspacchu/pacgobot/actions/workflows/docker-image.yml/badge.svg)
        This is a rewrite of pacchubot which was written back in 2020 in golang.

... and couple of Torrent Downloaders which will download to my Storage (Where this website's CDN is hosted to)


There were alot of endpoints to prashantnook.in which were migrated when oracle cloud account was suspended.

- https://portainer.prashantnook.in
- https://nginx.prashantnook.in
- https://*.iiit.prashantnook.in

Some infrastructure of IIIT were hosted on the endpoints which are now taken down. (Why did I put infra from IIIT on my servers? Restrictions .. alot of network proxy blocking firewalls.)

Yeah for now these are all the things I have migrated off from Oracle cloud to my little onprem server. Currently webui tools like portainer, grafana and other metrics are only hosted internally.

I would probably update my blog if any new things I might add to this so...

![image](https://github.com/itspacchu/static_dump/assets/37984032/6263c3a5-5376-42b7-934d-c341e9b5557d)


PS I was listening to this song while writing this :D~

<iframe style="border-radius:12px" src="https://open.spotify.com/embed/track/6b8W8vWuMJTo2UAj9LJiaA?si=3bc312d6a4404f75?utm_source=generator&theme=0" width="100%" height="152" frameBorder="0" allowfullscreen="" allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture" loading="lazy"></iframe>
