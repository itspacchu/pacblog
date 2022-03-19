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

<img src="https://cdn.discordapp.com/attachments/954771568381296710/954774437968900116/749975627633000520.png" width=30%>
<br>
<img src="https://cdn.discordapp.com/attachments/954771568381296710/954774560593547294/749975627633000520.png" width=30%>
<br>
where α is the r_o value of Covid19
its negative as people get infected the total susecptance population drops (ie people get sick)
<br>
<img src="https://cdn.discordapp.com/attachments/954771568381296710/954774560593547294/749975627633000520.png" width=30%>
<br>
here β is the recovery coefficient of Covid19
its negative as infected people either gain immunity or die due to virus ... either way they aren't suceptible to the virus anymore
<br>
<img src="https://cdn.discordapp.com/attachments/954771568381296710/954774687194447952/749975627633000520.png" width=30%>
<br>
<img src="https://cdn.discordapp.com/attachments/954771568381296710/954774722028126231/749975627633000520.png" width=30%> 

## Source code

<script src="https://gist.github.com/itspacchu/b5715349617f54465b545152ab03217a.js"></script>


### Source

<a class="btn btn-primary" href="https://www.maplesoft.com/applications/download.aspx?SF=127836/SIRModel.pdf" role="button">SRI MODEL PDF</a>

<a class="btn btn-primary" href="http://vonneumannscientia.pythonanywhere.com/media/comment_img/nABjVnV.png" role="button">Full Resolution</a>
