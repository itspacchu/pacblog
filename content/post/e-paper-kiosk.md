---
title: "E Paper Kiosk"
date: 2022-08-28T12:58:29+05:30
draft: false
---

Greetings everyone,

Recently I have been interning as a *Research Intern* at [IIIT Hyderabad](https://www.iiit.ac.in/) in [Smart City Research Center](https://smartcitylivinglab.iiit.ac.in/).

![The logo](https://lh3.googleusercontent.com/k3i2IWxxC4TZ8vaYOlIULqMhfNYNG-3alOo0LZSzCQbeRu5NVjQkTYuA336ydwjaJWYdq1b1UqlRYFowNcqSkk_tHCIVO-sNbpbS9ccEkhvVfN7RBnJ9v9D6bb3oD1g4SgFf7YHMs3w=w2400)


```this is the very first photo I took inside.. and yea I know my camera glitched up*```

<br>

It's been really fun working with cool stuff and having access to [makers lab](https://cie.iiit.ac.in/launching-makers-lab-at-cie/), which is an absolute Hardware haven.
![Makers Lab](https://i.imgur.com/prZzMEt.png)


I've worked on some basic projects with neopixels and stuff which I've already worked with at my home with the TV ambilight setup with prismatik and Adalight FastLED.

---

Anyway coming to my current project here, Recently we were planning on erecting bunch of **Smart Lamps** Throughout campus. (here's my beautiful artistic rendition )

![image](https://user-images.githubusercontent.com/37984032/187063985-726e0ae3-dddd-4375-baf9-73e40c492364.png)

You see that e-paper display right there! yes, That's what I was tinkering with for the last few weeks and boy the display is gorgeous.

The main plan involves displaying **essential data** on lamp post which is also visible in broad daylight, Since e-paper display uses external light source to diffuse the screen contents rather than relying on backlight or self emissive nature of LEDs and OLEDs, This is perfect for this type of application.

## Electronic Paper Display

So what the heck is Electronic Paper display. For all the folks who used/seen a kindle its basically that.

![kindle is cool](https://user-images.githubusercontent.com/37984032/187064057-574197ec-dea7-445f-bb68-e155b5ba19b5.png)

Instead of traditional Pixels with Red Blue Green pixels lighting up in a matrix to form a screen , E-paper has charged balls which move in a fluid to give us the changable content of a screen.

### LED display vs E-paper
![image](https://user-images.githubusercontent.com/37984032/187065679-e7e0af0a-3319-42ad-bae2-37bf20a04e15.png)

There's this company Waveshare which makes cool little hats for raspberry pi along with big E-paper displays which work by SPI. They are pretty expensive around 5000 INR just for a ```800 x 480 7 inch display```.

here's how the raw display module looks like.. pretty gorgeous on itself.

![epaper raw display](https://user-images.githubusercontent.com/37984032/187064567-78b6c651-f8b5-422d-8666-fce992a91314.png)

Here is some tests with using the examples to render images on the panel (notice the induvidual dots instead of having grayscale values ).

![kaguya](https://user-images.githubusercontent.com/37984032/187064573-0f9ce444-116e-4ef1-9877-423fcaddf6f6.png)

The first limitation I kinda faced when working with this panel is ... the display is 1 bit color!

### Digital Color

Color in digital medium is represented in bits, Usually the images you see are 24 bit.
$$ 3 * 8 \textrm(bit) $$

Since e-paper display is just grayscale we only have one channel of gray values from $$ 0 \rightarrow 1 $$
For a 8bit grayscale image we scale the normalized pixel brightness.
$$ (0,1)_{\textrm(PixelValue)} * 2^8 $$
To have the standard (0,255) Color range we usually see.

![image](https://user-images.githubusercontent.com/37984032/187065064-32490fa5-bbe2-4f30-ad83-83137c4e3ca0.png)

![image](https://user-images.githubusercontent.com/37984032/187065395-d72bee1e-9129-4d30-97db-17b8e9048828.png)


`ps If you've seen my selfie in the beginning you'd have noticed the blocky image, This is due to low bit depth of the image.
This is called Quantization`

---

Since we dont have any grayscale values in a 1 bit color display, we have to use some clever tricks to represent grayscale values at cost of display resolution.

If you've seen this [display comparision](/post/e-paper-kiosk/#led-display-vs-e-paper) we don't really notice the induvidual Red Blue and Green *Subpixels* as they form different color shades, The orange you see on screen isn't really orange but a peak of Red and half peak of Green.

So if you look at the spectrum you would see something like this.

![image](https://user-images.githubusercontent.com/37984032/187065666-6b9625be-a9c8-4cda-ac5d-b384c7d93d24.png)

Similar to frequency domain colors appearing as something different we have a method to show grayscale values in spatial domain.

## Floyd Steinberg Dithering

[![image](https://user-images.githubusercontent.com/37984032/187065866-3b94f12d-a0ca-4aba-a2ec-262c0807f03e.png)](https://en.wikipedia.org/wiki/Floyd%E2%80%93Steinberg_dithering)

 
<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>

