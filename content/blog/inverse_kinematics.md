---
title: "Inverse Kinematics"
date: 2020-07-30T19:39:31+05:30
draft: false
ShowWordCount: true
ShowRssButtonInSectionTermList: true
disableShare: true
---

++++ This post is mirrored from [here](https://vonneumannscientia.pythonanywhere.com/post/25/)

This project started off in exploring the [Inverse Kinematics](https://en.wikipedia.org/wiki/Inverse_kinematics). Inverse kinematics piqued my interest when I started watching MIT maker portfolio videos and stumbled on a 5 arm chain Robot arm. I've always wondered how IK systems work in blender or cinema4D and I thought I'd explore.

The first method I stumbled on was Isoceles triangle approach where you compute angles assuming symmetricity of Isoceles triangle.

<center>
<img src="https://cdn.discordapp.com/attachments/852930321493655563/954776165330083921/unknown.png" width=50%>
</center>

This method rapidly fails when the we want to compute angles for a non-symmetric conditions and for longer chains.

### FABRIK

FABRIK (Forward And Backward Reaching Inverse Kinematics) seems to be the most common method of inverse kinematics. It's a simple method that works well for short chains, and works on an Iterative approach.

There's a really impressive video on YouTube that explains the FABRIK method.

<iframe width="640" height="320" src="https://www.youtube.com/embed/UNoX65PRehA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<br>
<br>
A Basic implementation in C# would involve looping through the chain and computing the angles, then back-propagating the angles to the end of the chain, Control nodes can be added to the chain to control the angles.
Using FABRIK also lets you have long chains and control the pole placement of the end effector.

Here's a small snippet of what I got to work.

<center>
<img src="https://cdn.discordapp.com/attachments/852930321493655563/954775666648285244/2a1e50965211a88da86b4c850a9b27f1.gif" width=100%>
</center>


```#TODO Update when done```