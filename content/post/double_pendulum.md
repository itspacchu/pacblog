---
title: "Double_pendulum"
date: 2020-08-05T22:12:05+05:30
draft: false
---

Lately Youtube has been recommending me random Chaos theory videos and how small changes to input of a system can lead to huge changes in the Output.

The Output of system diverges vastly from the input even for very small difference in initial input conditions. Me being the type of person I am, decided to make a double pendulum system, cause processing is a really fun library to play around with and I wanted to try it out.

I worked on some basic projects from TheCodingTrain and Nature of code and this is one of them.
<a href="https://www.myphysicslab.com/pendulum/double-pendulum-en.html"> Reference </a>
<br>
<br>

Basic Implementation idea :
Pivoting a point at p1,p2
<br>
now with a fixed length find a point lets say elbow e1,e2

to find the e1 and e2 with length l1,
You can do :
e1 = l1 * cos(theta);
<br>
<br>

<iframe src="https://pastebin.com/embed_iframe/0eKarcL0" style="border:none;width:100%"></iframe>

<br>
<br>
Now once we get the base 2 lines and points attached basically plugging in the formula for theta1 and theta2
their velocities (angular) and accelerations. V
<br>
<br>

<img src="https://i.imgur.com/cUNwZKl.png" width=640 height=auto>
<br>
And here's my implementation. [ Click the image to try it out ]
<br>
<br>

<a href=https://0x45.in/projects/webrun/doublependulum/><img src=https://cdn.discordapp.com/attachments/852930321493655563/954759650354528346/Annotation_2020-08-05_221332_2SWPpm6.png></a>

Hope you enjoyed this post.



