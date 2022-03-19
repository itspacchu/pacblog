---
title: "Fourier Series Epicycloid"
date: 2020-07-09T15:18:42+05:30
draft: false
---

++++ This post is mirrored from [here](https://vonneumannscientia.pythonanywhere.com/post/23/)

So yeah this is simple but hard at the same time due to how flexible fourier series is.

<a href="https://www.codecogs.com/eqnedit.php?latex=\sum&space;c_n&space;e^{-\tau&space;n&space;f&space;t}&space;=&space;...&space;c_{-1}&space;e^{1&space;\tau&space;f&space;t}&space;&plus;&space;c_{0}*1&space;&plus;&space;c_{1}&space;e^{-1&space;\tau&space;f&space;t}&space;..." target="_blank"><img src="https://latex.codecogs.com/gif.latex?\sum&space;c_n&space;e^{-\tau&space;n&space;f&space;t}&space;=&space;...&space;c_{-1}&space;e^{1&space;\tau&space;f&space;t}&space;&plus;&space;c_{0}*1&space;&plus;&space;c_{1}&space;e^{-1&space;\tau&space;f&space;t}&space;..." title="\sum c_n e^{-\tau n f t} = ... c_{-1} e^{1 \tau f t} + c_{0}*1 + c_{1} e^{-1 \tau f t} ..." /></a>
<br>
<br>
<b>Attempt #1 :</b> Havent done much except trying to pick out a backend to work this thing on ... thought of using <b>Cinema4D</b> but due to lack of its precision on floating point integers coudn't get it to work with my initial values
<br>
<br>
<iframe src="https://pastebin.com/embed_iframe/WdTE7BAX" style="border:none;width:100%"></iframe>
<br>
i'll post an update if get anything else
<br>
<br>
And here's me messing with Cinema4D and some random <a href="https://www.codecogs.com/eqnedit.php?latex=C_n" target="_blank"><img src="https://latex.codecogs.com/gif.latex?C_n" title="C_n" /></a> <a href="https://www.codecogs.com/eqnedit.php?latex=n" target="_blank"><img src="https://latex.codecogs.com/gif.latex?n" title="n" /></a> and <a href="https://www.codecogs.com/eqnedit.php?latex=\emph{Phase()}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\emph{Phase()}" title="\emph{Phase()}" /></a> Values
<br><br>
<img src="http://vonneumannscientia.pythonanywhere.com/media/comment_img/ezgif-3-0c70e3c02b78.gif" width=640px height=320px>
<br>

<hr>
<b>Attempt #2 :</b> Well i decided to come back to blender-python. and found an amazing tutorial on youtube <i>( It was in p5.js )</i>,
I didnt realise i could loop the entire thing instead of pre-stacking parametric equations in addition really impressive i must say :).
<br>
<br>
<iframe width="640" height="320" src="https://www.youtube.com/embed/Mm2eYfj0SgA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
<br>
<br>
Here's the demo at end of Attempt 2 :D
<br>
<br>
<a href="https://gyazo.com/4081664154cb0b3c87404921fba4d854"><img src="https://i.gyazo.com/4081664154cb0b3c87404921fba4d854.gif" alt="Image from Gyazo" width="640"/></a>
<br>
<br>
<h2> Download the .blend file </h2>
<a class="btn btn-primary" href="https://mega.nz/file/GwsXTCbC#7UqdQe4D9UeCGZhq3eFhSEKehj-pIE-HOABCF9sJ7so" role="button">FourierDrawing_A_2.blend</a>
<br>
<br>
So now all i need to do is find fourier coefficients which i already have a script for in python ^^ above :> and merge them into this one.
Cheerios <b>#Day2</b>
<br>
<br>
<b>Attempt #2 cont :</b> I got the result but coudn't draw anything useful except basic signals due to memory limitation but its cool to see them drawing,
This challenge was really cool ... i learnt a lot :D

<br>
<br>
<a href="https://gyazo.com/545c9e3d7d124cb216db2705b254ba2d"><img src="https://i.gyazo.com/545c9e3d7d124cb216db2705b254ba2d.gif" alt="Image from Gyazo" width="640"/></a>
<br>
<br>
<a href="https://gyazo.com/f3a64d8969ea12163be0561f3f636c00"><img src="https://i.gyazo.com/f3a64d8969ea12163be0561f3f636c00.gif" alt="Image from Gyazo" width="640"/></a>
<br>
<br>
<a href="https://gyazo.com/06c0107c6142e673683adbfa7db732fa"><img src="https://i.gyazo.com/06c0107c6142e673683adbfa7db732fa.gif" alt="Image from Gyazo" width="640"/></a>
<br>
<br>
thanks to <a href="http://vonneumannscientia.pythonanywhere.com/u/vijay_shankar">@vijay_shankar</a> for hosting this.
<br>
