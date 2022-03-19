---
title: "Covid SRI Model"
date: 2020-07-08T20:14:08:27+05:30
draft: false
---

++++ This post is mirrored from [here](https://vonneumannscientia.pythonanywhere.com/post/18/)

Standard SRI model refers to Suseceptance population ( those who can be infected from the virus ) , Infected (duh) , Recovered/Dead .. by solving differential equations

S = Susceptance population
R = Recovered/Dead
I = Infected

<img src="https://latex.codecogs.com/gif.download?%5Cfrac%7BdS%7D%7Bdt%7D%20%3D%20-%20%5Calpha*S*I">
<br><br>
<img src="https://latex.codecogs.com/gif.download?%5Cfrac%7BdI%7D%7Bdt%7D%20%3D%20+%20%5Calpha*S*I%20-%5Cbeta*I">
<br><br>
where α is the r_o value of Covid19
its negative as people get infected the total susecptance population drops (ie people get sick)
<br><br>
<img src="https://latex.codecogs.com/gif.download?%5Cfrac%7BdI%7D%7Bdt%7D%20%3D%20+%20%5Calpha*S*I%20-%5Cbeta*I">
<br><br>
here β is the recovery coefficient of Covid19
its negative as infected people either gain immunity or die due to virus ... either way they aren't suceptible to the virus anymore

<br>
<br>
<img src="https://latex.codecogs.com/gif.download?%5Cfrac%7BdS%7D%7Bdt%7D%20%3D%20+%20%5Cbeta*I">
<br>
<br>
<img src="https://latex.codecogs.com/gif.download?%5Cfrac%7BdS%7D%7Bdt%7D%20%3D%20-%20%5Cbeta*I">

<h2> Source code </h2>
<script src="https://gist.github.com/itspacchu/b5715349617f54465b545152ab03217a.js"></script>
<br>

<br>

<h3> Source </h3>
<a class="btn btn-primary" href="https://www.maplesoft.com/applications/download.aspx?SF=127836/SIRModel.pdf" role="button">SRI MODEL PDF</a>
<br>
<hr>
<a class="btn btn-primary" href="http://vonneumannscientia.pythonanywhere.com/media/comment_img/nABjVnV.png" role="button">Full Resolution</a>
