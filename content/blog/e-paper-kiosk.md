---
title: "E Paper Kiosk"
date: 2022-08-28T12:58:29+05:30
draft: false
ShowWordCount: true
ShowRssButtonInSectionTermList: true
disableShare: true
---

Greetings everyone,

Recently I have been interning as a *Research Intern* at [IIIT Hyderabad](https://www.iiit.ac.in/) in [Smart City Research Center](https://smartcitylivinglab.iiit.ac.in/).

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

## Dithering

dithering an image is a way to make an imahe appear higher fidelity than it actually is.

So let's consider a simple scenario, we have 3 colors
```python
BLACK = (0,0,0)
GRAY = (0.5,0.5,0.5)
WHITE = (1,1,1)

colors = [BLACK,GRAY,WHITE]
```
If we directly apply the colors without any gradient it would look very discrete (Left Sphere), While if we add a bit of noise while interpolating between the colors we can get a pseudo smooth appearance (Right Sphere).


![renderdither](https://user-images.githubusercontent.com/37984032/187075232-43e41aa7-d069-4fb8-b806-7cd6681f18e3.png)

### Floyd-Steinberg Dithering

[![image](https://user-images.githubusercontent.com/37984032/187065866-3b94f12d-a0ca-4aba-a2ec-262c0807f03e.png)](https://en.wikipedia.org/wiki/Floyd%E2%80%93Steinberg_dithering)
 
This is a very cool dithering algorithm used in GIFs and many low fidelity formats to preserve detail lossy.

---

I was originally planned to write my own Dithering algorithm to generate dithered bitmap (bmp) format for the Waveshare API but found out python's pillow _Python Imaging Library_'s 

```python
Image.convert('1')
```

method already does basic dithering which covers my need.

So taking a screenshot of my [website](https://0x45.in) and passing it through the dithering algorithm we have

![thebeauty](https://user-images.githubusercontent.com/37984032/187064034-a15e3b09-87d4-44ec-bcc4-29ded65cc8a5.png)

Even the render of my head was represented really well using dithering.

Now since this current e-ink panel supports red pigment as well I tried doing some basic point processing to fetch red values to dither and represent as well and it turned out kinda weird so we decided to completely drop using the red pigment, But it looked really cool I say it.

```python
webpage = Image.open("screenshot.png").convert("RGB").transpose(Image.ROTATE_90)
webpage = change_contrast(webpage,100)
#r = webpage.split()[0] Do the point processing for red
#r.point( lambda p: 255 - (10*p) if ((p >= 200) and (p < 240)) else 255 ).convert("1").save("screenshot_r.bmp")
webpage.convert("1").save("screenshot_b.bmp")
```
---

![image](https://user-images.githubusercontent.com/37984032/187075516-5f8c2c27-4bdf-4ce9-ab77-a2c03471e40c.png)

![image](https://user-images.githubusercontent.com/37984032/187075567-d2561fab-942e-4c96-987c-6484c45e176f.png)


``` these images are manually segmented into red and black parts ```

---

## Web rendering?

So the people here wanted the thing to be connected to WiFi so it can fetch data from [onem2m server]() of iiith. Before my plan was to use opencv or pillow itself to completly render graphs and map and export as an image, but there was a problem.

If someone want's to update the layout or want to completly change how it looks... they have to redo the whole image generation part again, So why not go the Electron route and just render a webpage, this way it's more powerful as it uses HTML+CSS to markup the layout.

By calling chrome headless mode
```python
subprocess.run(['chromium','--headless','--disable-gpu','--screenshot','--window-size=480,800',url])
```
It was possible to export a screenshot of the webpage which can be easily converted and displayed.

## Enclosure Design

We wanted to place the whole e-ink panel inside the metal chassy of the lamp post so I had to come up with a way to put the panel and all the electronics inside the post.

The first iteration of design included a basic box where the display can easily slide through... yea sliding through is a very very stupid idea.

The display broke as it was sliding inside and that was a very expensive mistake! ~~(not gonna elaborate on how much I thought I was gonna be fired! )~~

![image](https://user-images.githubusercontent.com/37984032/187075841-e8d2b4a1-4f9c-4cfb-a0a5-1e27122749dc.png)

Here's a new design which is yet to be printed.

![image](https://user-images.githubusercontent.com/37984032/187075943-89e56e54-8a8e-4d3a-a17e-94be41b67768.png)

## Final Assembly

So after designing a whole enclosure this is how it finally fits in all together. We were extremely on time crunch as people from Wi-SUN were coming in a week for evaluation, After giving it a finishing color coat it started giving the look of being profesionally made.

![image](https://cdn.discordapp.com/attachments/756467788398198894/1047156877592633344/unknown.png)

At this point I wanted to put everything in a docker for easy deployment incase of issues with raspberry pi or broken SD card ( I have accidentally broken some while handling this 3D print ), But again due to the time crunch I've decided just to pile up on systemd scripts.

For automating simple updates I've worked with github actions to create a self runner to auto update the bot.

![image](https://cdn.discordapp.com/attachments/756467788398198894/1047158589149687829/image.png)

Which did save alot of time by not manually ssh-ing into the pi. The worst part about the lamp enclosure is ... it's made of metal, essentially making it a faraday cage.

A Faraday cage is a device which blocks external electromagnetic signals from passing through ... Since WiFi is part of the electromagnetic spectrum, It was essentially making the communication with the main router absurdly slow. Also the fact that the only way the WiFi signal can even reach the lamp was through a window.

![image](https://cdn.discordapp.com/attachments/756467788398198894/1047161607567982624/image.png)

I found out about the WiFi issue on the day the Wi-SUN people are supposed to come, [Dr Aftab](https://www.iiit.ac.in/people/faculty/aftab.hussain/) suggested we remove a small metal panel to allow WiFi in and well it worked for the demo.

Since we were working with this lamp during the phase of KETI's hackathon, we decided to present this alongside our main hackathon project.

<iframe width=100% src="https://www.youtube.com/embed/zbXav_wcGhQ" title="KETI OneM2M Hackathon project submission | #TeamAthena" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Overall it was really a fun project to work with.

## Update

We won the Best Technology award in KETI (Korean Electronics Technlogical Institute) OneM2M hackathon.
I did not expect we would pull this off.

![Team Athena](https://user-images.githubusercontent.com/37984032/215316227-4b653cf5-0773-4e5d-93fc-25c62462481e.jpg)

<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>

