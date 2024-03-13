---
title: "Worst Tank Project"
date: 2020-06-02T16:41:20+05:30
draft: false
ShowWordCount: true
ShowRssButtonInSectionTermList: true
disableShare: true
---

++++ This post is mirrored from [here](https://vonneumannscientia.pythonanywhere.com/post/22/)

This is an entry to Itch.io's **Weekly Game Jam #150**.
<br>
<br>
<a class="btn btn-primary" href="https://itspacchu.github.io/Worst-tank-GamejamCollab/" role="button"> Play on Github pages </a>
<br>
<br>
This is the first gamejam I've decided to team up with someone random from the internet. Which was really cool for working in a team under a time crunch.

_This fella is my teammate_

<a href=https://brrrrrr.itch.io//><img src=https://cdn.discordapp.com/attachments/852930321493655563/954765266804441088/unknown.png width=30%></a>

<br>
The main theme of this gamejam was  **You are the enemy** which was first very confusing and we had literally no idea what to even do.
We were first planning on making a game where you have to kill yourself through a mirror, But it sounded very wrong so we decided to drop having living things in game.
<br>
<br>
Having material things to break and explode made it much more interesting so we thought of making a game where you play as a drone and try to shoot yourself by ricocheting off of walls.
Being limited on time we decided to make it Top Down ( We already wasted 20+ hours on this brainstorming which also included some completly off theme ideas which were cool).
<br>
<br>
The final idea we decided was make a game where we should destroy the tank we're sitting in to pass the level.
<br>
Well the objective of ricochting bullets seems easy just use physics, but we wanted to have an aiming system which shows where the bullet is going, which turned out to be **SOO** simple but I was going the complete stupid way of computing it.

(Spoiler) This Sorcery!
<br>
<img src="https://i.imgur.com/k3U7NYd.png" width=640px height=320px>
<br>

What we had to do was to use the ```hit.gameObject.normal``` to get the surface normal of the object hit and just flip the hit vector.

<img src="https://cdn.discordapp.com/attachments/852930321493655563/954766045472780408/unknown.png" width=50%>

After a very "fun" session of brainstorming and finally implementing bullet reflections using vector reflections and dot products.

We finally finished the game 20 minutes before the deadling.. (phew).In the end we had alot of fun coming up with the idea and making it.

<iframe src="https://itch.io/embed/655988?border_width=0&amp;bg_color=424242&amp;fg_color=ffffff" width="550" height="165" frameborder="0"><a href="https://pacchu.itch.io/worsttank">WorstTank {Beta} by Pacchu, brrrr</a></iframe>

# Gallery 

<img src="https://i.gyazo.com/f6442403ef9dd0d54c2d765c25dc10c9.gif" alt="Image from Gyazo" width="640"/>

<img src="https://i.gyazo.com/156ed50ab5c2b7fb620c44cc3f57fce2.gif" alt="Image from Gyazo" width="640"/>

<img src="https://img.itch.zone/aW1hZ2UvNjU1OTg4LzM1Mjc3MzgucG5n/original/adiqkc.png" width=640>

<img src="https://img.itch.zone/aW1hZ2UvNjU1OTg4LzM1Mjc3MzkucG5n/original/PVZDh5.png" width=640>

