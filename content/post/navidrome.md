---
title: "Navidrome"
date: 2025-06-28T20:07:09Z
draft: false
---

Greetings Tinkerers!

In the past couple of months I've been tinkering with some cool ways of modifying my homelab and writing k8s operators (work stuff!). 

Alright so ... as y'all know I am a huge music addict...

(cough!.)

![music-is-beautiful](https://www.tapmusic.net/collage.php?user=itspacchu&type=1month&size=3x3&caption=true&playcount=true)

... and my Spotify Premium membership just ended _( forgot to create a mandate ... I guess a good thing? )_, while looking to renew I was wondering why don't I just self host something which can replace spotify for me.

I had couple of requirements for me to consider something as a spotify replacement-

- Scrobble things to last.fm
- Now playing on my discord through rpc
- Able to add/remove songs easily along with multi device syncing.

Previously, I used to have a single SMB server and used Mixplorer to pull songs to all my devices but ... come on good UI is needed as well and Mixplorer isn't really a music player lol.

### Navidrome setup

![navi](https://www.myqnap.org/wp-content/uploads/logo-192x192-2.png)

On r/selfhosting, I've come across the very same thing I was looking for [_Navidrome_](https://www.navidrome.org/). 


> Navidrome can be used as a standalone server, that allows you to browse and listen to your music collection using a web browser.

> It can also work as a lightweight Subsonic-API compatible server, that can be used with any Subsonic compatible client.

Off I went into the [_Installation_](https://www.navidrome.org/docs/installation/), Got the arm64 for my raspberry pi cluster and got it running on my k8s setup, 

The provided [_docker-compose_](https://www.navidrome.org/docs/installation/docker/#using-docker-compose-) configuration was modified to a k8s-deployment manifest alongside creating a hostpath PersistantVolumes and PersistantVolumeClaims, since I had a dedicated SSD to store needed things

> Future TODO need to look at backup solutions now!

Now for exposing it publicly we got Cloudflare tunnels. I came across this amazing k8s controller [_STRRL/cloudflare-tunnel-ingress-controller_](https://github.com/STRRL/cloudflare-tunnel-ingress-controller) which lets you have cf-tunnels as Ingress class, This very blog is using cf-tunnels to be exposed to my domain _prashantnook.in_ 

```bash
pacchu@pacsrv:~$ kubectl get ing -n blog blog-via-cf-tunnel
NAME                 CLASS               HOSTS             ADDRESS                                                 PORTS   AGE
blog-via-cf-tunnel   cloudflare-tunnel   prashantnook.in   4f5a42b3-3ce7-4cdc-87c1-813b4e743fdb.cfargotunnel.com   80      35d
```

So yeah pretty handy instead of tinkering with nginx ingress controller and openvpn things that I've been doing previously.

> I'll attach the repo of all the manifest files and scripts later [here](https://github.com/itspacchu)

> [Check the bottom of the post for manifests.](/post/navidrome/#gists)

#### Navidrome UI

![image](https://github.com/user-attachments/assets/bb684d4b-fe7d-4367-b4a0-e41f2afe636d)

Its a pretty minimalistic UI which has all essential things needed, Alongside has its own authentication as well.

#### K8s

```bash
pacchu@pacsrv:~/navidrome$ kubectl get -f ./
NAME                                              READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/navicord-discord-rpc-deployment   1/1     1            1           15h

NAME                            CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                     STORAGECLASS   VOLUMEATTRIBUTESCLASS   REASON   AGE
persistentvolume/navidrome-pv   50Gi       RWO            Retain           Bound    navidrome/navidrome-pvc   manual         <unset>                          17d

NAME                                  STATUS   VOLUME         CAPACITY   ACCESS MODES   STORAGECLASS   VOLUMEATTRIBUTESCLASS   AGE
persistentvolumeclaim/navidrome-pvc   Bound    navidrome-pv   50Gi       RWO            manual         <unset>                 17d

NAME                        READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/navidrome   1/1     1            1           17d

NAME                TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)    AGE
service/navidrome   ClusterIP   10.43.57.30   <none>        4533/TCP   17d

NAME                                            CLASS               HOSTS                       ADDRESS                                                 PORTS   AGE
ingress.networking.k8s.io/navidrome-cf-tunnel   cloudflare-tunnel   navidrome.prashantnook.in   ***   80      17d
```



### Clients!

Now for Clients, I've decided to go with just the web application for my desktop since its pretty slick and lightweight to be run, While for android there are many cool ones but I am using [Tempo@fdroid](https://f-droid.org/packages/com.cappielloantonio.notquitemy.tempo/)

##### Android

![image](https://github.com/user-attachments/assets/a9020396-ba5d-4d16-825f-7a048e231130)


---

Now that I have basic ecosystem setup now have to get some content into it. I have had attached a 256G SSD to my PI dedicated for music and video storage.

### Spotify <-> Navidrome migrations

Now for the important things ... how do I bring my spotify songs into navidrome, I have over 1600+ Songs on spotify, Sadly spotify didnt have any google takeaway like feature, also Downloading songs is Piracy (_duh_) so we're going off legal stuff here `;)`

> If Buying isnt owning, Pirating isnt stealing :D

To be honest Streaming is far better than buying songs induvidually for 23 INR like back on google play music days (2014s).

#### Spotdl

Anyhow, To download spotify songs I came across this amazing tool [_spotdl_](https://github.com/spotDL/spotify-downloader) which queries youtube for the song name and downloads via _ytdlp_.

Wrote a simple script to fetch all my liked songs and make a long txt file containing urls. This was using [_spotipy_](https://pypi.org/project/spotipy/).


```bash
pacchu@pacsrv: $ cat liked_song_urls.txt | head
https://open.spotify.com/track/3RXUgPNIbUgFxsDWuBQEt6
https://open.spotify.com/track/0MHStU0muAIEMbwdnebYu2
https://open.spotify.com/track/0tCbGwXOpEiYIxkr8S2FAr
https://open.spotify.com/track/02sy7FAs8dkDNYsHp4Ul3f
https://open.spotify.com/track/5sBDrrtLGbV64QJnEqfjer
```
Now its just a matter of looping the big list and downloading via spotdl.

and viola populated the entire pv with *some* of my spotify songs.

```bash
pacchu@pacsrv: $ ls 
...
'美波 - DROP.mp3'
'美波 - ホロネス.mp3'
'藤澤慶昌 - 魔術の授業.mp3'
'양방언 - No Boundary - Live at Sejong Center for the Performing Arts in Seoul, 2018.11.21.mp3'
'양방언 - 暁のヨナ／Akatsuki-no-YONA.mp3'

pacchu@pacsrv: $ ls | wc -l
707

```
Although it didn't alot of niche songs I listen to (over 1000+) this really suffices me since all my recents are included in this!


Another missing thing was Spotify Discovery and its Smart Shuffle, Sadly can't do anything on the AI side of things so currently working on a script that will periodically poll spotify api for Discover Weekly playlist.

`spotdl` supports full album downloads so I can essentially download [Discover Weekly](https://open.spotify.com/playlist/37i9dQZEVXcEK9kNSuDsAP?pi=bQPRGqShS8C2G) basically. 

### Last.fm Integration

I use [_itspacchu@lastfm_](https://www.last.fm/user/itspacchu) to keep track of my scrobbing data, Luckily lastfm is natively supported by navidrome

![image](https://github.com/user-attachments/assets/c2603967-ca8d-40c6-964f-488c8c7d62ed)

Popping in my client and secret and I got scrobbing working!! (The cool chart in beginning of this blog ^^)

One issue I've noticed is during listening to songs made by multiple artists like

`Stephen Schwartz/Ariana Grande/Stephen Oremus`

instead of 

`Stephen Schwartz, Ariana Grande, Stephen Oremus`

which sorta ruins the Lastfm album arts and Scrobbing history, Maybe I can work on a fix for this?

### Discord RPC Integration

Now for the final (not so) important thing, Discord _Listening to.._ Status messages, Spotify integration is strong with discord but navidrome doesn't really have any native support for discord RPC.

I found this which claims to connect with navidrome server and send discord rpc status [logixism/navicord](https://github.com/logixism/navicord).

> I am in process of rewriting this on my own with some additional features with proper album art fetching and in GO!

#### It works!

![Screenshot From 2025-06-29 15-57-49](https://github.com/user-attachments/assets/a3d4c73e-c7c7-4b9d-81ac-d929dcd2ddc6)


![image](https://github.com/user-attachments/assets/2ea91a70-93d1-479d-aec4-b9df38c35655)


Well now I shall be now binging songs through Navidrome, There are alot more things to do to make it as seamless as spotify, 

Maybe have a discord bot to automatically download songs based on spotify link being provided to it, or

Anyhow hopefully I will see how long I can run this before my laziness kicks in :D

### Bonus ramblings (Asahi Appreciation)

![asahi](https://asahilinux.org/img/AsahiLinux_kawaii_logo.png)

If you're wondering why it says pacashi... I am now running Asahi Linux on my Mac :D

![image](https://github.com/user-attachments/assets/6b539d10-d8cd-46c9-b4bc-1b4b296930ee)

Daily driving this is really fun compared to Macos, Although its sometimes pain to run this due to limited 8G ram of my M1 air and lack of USB C Display out support (_yet as of now_). 

If y'all haven't heard of asahi linux project, [Enjoy](https://asahilinux.org/)

Maybe I might write a post about it in future about my experiences with Asahi!

Cheers!

### Gists

#### Manifests

<script src="https://gist.github.com/itspacchu/a52a8a9b8e4203829b96c7e508bd8641.js"></script>


<script src="https://gist.github.com/itspacchu/084b847782fad2eb443cc6abfd4a8d63.js"></script>


#### Spotipy script to export

<script src="https://gist.github.com/itspacchu/2c9385fc24e8a1e9da7a32e5da24a414.js"></script>


