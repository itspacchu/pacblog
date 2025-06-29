---
title: "Navidrome"
date: 2025-06-28T20:07:09Z
draft: false
---

Greetings Tinkerers!

In the past couple of months I've been tinkering with some cool ways of modifying my homelab and writing k8s operators. As y'all know I am a huge music addict

(cough!.)

![music-is-beautiful](https://www.tapmusic.net/collage.php?user=itspacchu&type=1month&size=3x3&caption=true&playcount=true)

Anyhow.. My Spotify Premium ended and looking at the price 1180 INR/year, To be honest not bad.
But, I wanted to see if I can host my own version of spotify along with alot of things I do to track music and let friends know what I'm listening to.


### Navidrome setup

![navi](https://www.myqnap.org/wp-content/uploads/logo-192x192-2.png)


On r/selfhosting, I've come across the very same thing I was looking for [_Navidrome_](https://www.navidrome.org/).

Off I went into the [_Installation_](https://www.navidrome.org/docs/installation/), Got the arm64 for my raspberry pi cluster and got it running on k8s, It was pretty straight forward deployments binded to my music local storage.


> I'll attach the repo of all the files and scripts later [here](https://github.com/itspacchu)


#### Gist

<script src="https://gist.github.com/itspacchu/a52a8a9b8e4203829b96c7e508bd8641.js"></script>

#### Navidrome UI

![image](https://github.com/user-attachments/assets/bb684d4b-fe7d-4367-b4a0-e41f2afe636d)


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
  
Now for Clients, I've decided to go with just the web application for my desktop since its pretty slick and lightweight to be run, While for android there are many cool ones but I am using [Tempo@fdroid](https://f-droid.org/packages/com.cappielloantonio.notquitemy.tempo/)

![image](https://github.com/user-attachments/assets/a9020396-ba5d-4d16-825f-7a048e231130)


### Spotify <-> Navidrome migrations

Now for the important things ... how do I bring my spotify songs into navidrome, I have over 1600+ Songs on spotify, Sadly spotify didnt have any google takeaway like feature, also Downloading songs is Piracy (_duh_) so we're going off legal stuff here `;)`

> If Buying isnt owning, Pirating isnt stealing :D

To be honest Streaming is far better than buying songs induvidually for 23 INR like back on google play music days (2014s).

#### Spotdl

Anyhow, To download spotify songs I came across this amazing tool [_spotdl_](https://github.com/spotDL/spotify-downloader) which queries youtube for the song name and downloads via _ytdlp_.

Wrote a simple script to fetch all my liked songs and make a long txt file containing urls. This was using [_spotipy_](https://pypi.org/project/spotipy/).

#### Spotipy script to export

<script src="https://gist.github.com/itspacchu/2c9385fc24e8a1e9da7a32e5da24a414.js"></script>


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


### Last.fm Integration

I use [_itspacchu@lastfm_](https://www.last.fm/user/itspacchu) to keep track of my scrobbing data, Luckily lastfm is natively supported by navidrome

![image](https://github.com/user-attachments/assets/c2603967-ca8d-40c6-964f-488c8c7d62ed)

Popping in my client and secret and I got scrobbing working!! (The cool chart in beginning of this blog ^^)


### Discord RPC Integration

Now for the final (not so) important thing, Discord _Listening to.._ Status messages, Spotify integration is strong with discord but navidrome doesn't really have any native support for discord RPC.

I found this which claims to connect with navidrome server and send discord rpc status [logixism/navicord](https://github.com/logixism/navicord).


<script src="https://gist.github.com/itspacchu/084b847782fad2eb443cc6abfd4a8d63.js"></script>

### It works!

![Screenshot From 2025-06-29 15-57-49](https://github.com/user-attachments/assets/a3d4c73e-c7c7-4b9d-81ac-d929dcd2ddc6)


![image](https://github.com/user-attachments/assets/2ea91a70-93d1-479d-aec4-b9df38c35655)


Well now I shall be now binging songs through Navidrome, There are alot more things to do to make it as seamless as spotify, 

Maybe have a discord bot to automatically download songs based on spotify link being provided to it, or

Another things is to rewrite the discord rpc in go for fun cause why not?

Anyhow hopefully I will see how long I can run this before my laziness kicks in :D

### Bonus ramblings (Asahi Appreciation)

![asahi](https://asahilinux.org/img/AsahiLinux_kawaii_logo.png)

If you're wondering why it says pacashi... I am now running Asahi Linux on my Mac :D

![image](https://github.com/user-attachments/assets/6b539d10-d8cd-46c9-b4bc-1b4b296930ee)

Daily driving this is really fun compared to Macos, Although its sometimes pain to run this due to limited 8G ram of my M1 air and lack of USB C Display out support (_yet as of now_). 

If y'all haven't heard of asahi linux project, [Enjoy](https://asahilinux.org/)

Maybe I might write a post about it in future about my experiences with Asahi!

Cheers!





