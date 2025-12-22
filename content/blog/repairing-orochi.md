---
title: "Repairing Orochi V2"
date: 2024-03-14T16:17:18Z
draft: false
cover:
  image: https://cdn.prashantnook.in/img/orochi.png
---

Greetings Humans,

I have been using Razer Orochi V2 for quite some time, Its a great compact mouse for work (and gaming ofc :>) Due to some some issue the scroll wheel stopped working and it glitches out while using, So me being me decided to straight up open it and look inside.

I had little bit of experience repairing mouses when I got my Logitech G102 where it was constantly having double clicking issues.

> Logitech G102 PCB
![image](https://github.com/itspacchu/static_dump/assets/37984032/9ad2c669-c7b2-4dbe-a064-2e284944f38d)

So, when my new Razer orochi's scroll wheel decided to stop working on me, I was pretty sad and happy that I get to repair it.

## Getting into the Guts

Popping off the cover its pretty straight forward spotting the screws and opening it.

#### Unscrewing time .. Very repairable ofcourse

![image](https://github.com/itspacchu/static_dump/assets/37984032/1ac9845e-59a7-4217-b6f3-c758bfa602fa)

> Be careful when removing the upper lid as the battery and DPI button wires are attached to the top plastic housing (Unfortunately I havent gotten enough photos)

When you do carefully unplug the wires for the battery and DPI button here's what you see inside.

![image](https://github.com/itspacchu/static_dump/assets/37984032/738662eb-26c6-42af-ba83-b0236981f6cf)

Unscrewing more screws to get the PCB out... You'll notice the first thing

#### It's Absolutely TINY!!!!

![image](https://github.com/itspacchu/static_dump/assets/37984032/28faca0e-fcd6-4e9a-b6eb-f96cedbcefcc)

Like here's the comparision between the Logitech G102 vs Orochi V2's PCB

![image](https://github.com/itspacchu/static_dump/assets/37984032/83ac99c4-2700-4bfd-840a-e0eac30b009f)

After some gawking about thinking of custom 3D Printed chassy for Orochi v2 like something Optimum did for the Logitech G superlight pro

{{<youtube xvz8KjCpdLE>}}

<br>

I was legit tempted by it but alas, I didn't want to ruin the perfectly good chassy of orochi and all. So the main culprit is the broken `Rotary Encoders`

#### Desoldering time

![image](https://github.com/itspacchu/static_dump/assets/37984032/2c6071d3-7a95-4fae-830a-234fa73fe326)

With some desolder pump + desolding patience ... (Painful work later)

#### ITS OUT !! 

![image](https://github.com/itspacchu/static_dump/assets/37984032/fbc6e1fc-96fa-4cf6-98e3-0bd9ff59c4de)

![image](https://github.com/itspacchu/static_dump/assets/37984032/811b2b19-5138-4e6e-9aca-67531a10942c)

#### Rotary Encoders

Now I've ordered some [9mm Kailh Dustproof Encoders](https://www.esckey.in/collections/kailh/products/kailh-dustproof-9mm-encoder?variant=46840804278545) off from [Esckeys.in](https://esckeys.in)

> [9mm Kailh Dustproof Encoders](https://www.esckey.in/collections/kailh/products/kailh-dustproof-9mm-encoder?variant=46840804278545)
![image](https://github.com/itspacchu/static_dump/assets/37984032/ef1ca4dd-6202-4b10-afde-ef30b4c8016b)


#### Soldering time 

So now Soldering this thing back in with some careful soldering :>

![image](https://github.com/itspacchu/static_dump/assets/37984032/e92ae5b5-11d9-4702-a077-674d281290d9)

Now just doing the same process backwards of screwing back in the PCB, putting back in the connector for top chassy, Screwing everything in.

Works flawlessly :3

![image](https://github.com/itspacchu/static_dump/assets/37984032/94b0436f-f89b-4e60-956d-be640a4467ca)