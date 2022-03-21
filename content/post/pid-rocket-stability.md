---
title: "Rocket PID Stability"
date: 2022-03-21T01:38:32+05:30
draft: false
---

Hello everyone!

Last semester we had a course on Control Systems, where we learnt about controlling systems and how designing their controllers. As a huge fan of Boston dynamics Spot and their various robots, I've always been curious about how they work.

The very first time I was introduced to robotics was back in 5th grade's Summer Camp, where we had to build robots like Line following and Path navigating.

<center>
<img src="https://media.discordapp.net/attachments/852930321493655563/955205374066192414/facebook_nextlearn.png" width=40%>
</center>


Now comming to back to current project, This project is currently my Final year project, and I'm still working on it. But that doesn't stop me from explaining the simulation built in [Godot](https://godotengine.org/).

### The Project

> If you wanna skip to the final part, you can go to the [Web Version](/post/pid-rocket-stability/#web-version)

The main goal of this project is to build a simulation of a rocket controller, which can stabilize the rocket in a controlled manner. For this the most naive approach is to use a PID controller to stabilize the rocket.

A **P**roportional, **I**ntegral and **D**erivative controller _(PID)_ is a traditional controller that can be used to stabilize a system. As the name suggests, the PID controller is a combination of a Proportional, Integral and Derivative controller, given by the following equation:

$$F_{out} = k_p * \delta + k_d * \frac{d}{dt} \delta + \int_{0}^{t} k_i * \delta dt$$

$$ \delta \textrm{  is the error between the desired value and the actual value. }$$ 

Thats a heck of a lot of math, but it's really simple to understand.

<img src="https://media.discordapp.net/attachments/852930321493655563/955211531807772733/unknown.png" width=75%>

Now if you're any intelligent living specimen, It'll be obvious to move the needle to the right by +23 degrees and viola the error is 0.

This is the _proportional_ controller, which is the simplest of the three. It simply tries to move the needle to the right by +23 degrees, which is what we did.

$$ F_{P} = k_p * \delta $$

<img src="https://media.discordapp.net/attachments/852930321493655563/955216292556701736/cool_gif_right.gif" width=75%>

Now we can see the error is oscillating from -23 deg to +23 deg, Which is where derivative comes in, which crush down the oscillating errors.

$$F_{D} = K_d * \frac{d}{dt} \delta$$

<img src="https://media.discordapp.net/attachments/852930321493655563/955335473990074418/unknown.png?width=581&height=506" width=75%>

Here there's a DC error which isnt oscillatory nor linear, For this DC error we need to use an Integral controller.

$$ F_{I} = K_i * \int_{0}^{t} \delta dt$$

Now why did I tell you all this?
Well this is the entireity of the PID controller.

The Rocket is a simple rigid body, where torque is applied to the rocket to rotate it and Force is applied as thrust to propel it.

The Thrust force can be rotated to change direction of force being applied, this is Thrust Vectoring.

<img src="https://media.discordapp.net/attachments/852930321493655563/955337632018235433/unknown.png" width=75%>

For the simplicity of control, Rocket's z rotation is locked to 0 deg.

Now for any Control System we have both Control parameters and Observer parameters. For this rocket I've chosen the Control parameters to be the X,Y torque which are controlled by side thrusters and the main thrust along with thrust vectoring controlled by their respective parameters, For the Observer parameters we have the Z position (Altitude) along with X,Y Rotation for keeping the rocket upright.

<img src="https://media.discordapp.net/attachments/852930321493655563/955339707657646100/unknown.png" width=75%>

Now for just settings all the PID controllers and observer parameters and tuning it just right.

#### The Simulation

```gdscript
	#rotational side thrusters
	PID_X = preload("res://PID.gd").new(1, 0.5, 0.6)
	PID_Z = preload("res://PID.gd").new(1, 0.5, 0.6)
	#thrust vectoring
	PID_tv_x = preload("res://PID.gd").new(0.4, 0.2, 0.15)
	PID_tv_z = preload("res://PID.gd").new(0.4, 0.2, 0.15)
	#height calib
	PID_Ypos = preload("res://PID.gd").new(0.5, 0.35, 0.75)
	PID_tv_x._set_range(-0.3,0.3)
	PID_tv_z._set_range(-0.3,0.3)
	PID_Ypos._set_range(0,1)
	PID_Ypos.minimum_clamp = 0; # can't get negative thrust right
```

The PID values chosen as tuned experimentally, although there are much better ways of properly tuning it and getting the best results the first set of values chosen "educatively..lol" just worked out of the box.

I know tuning is done by computing the transfer function of the PID system I've got going but I'm planning on switching to MATLAB for actual simulation so this project just deals with basic control scheme and manual tuning.

<video width=75% height=auto controls>
  <source src="https://user-images.githubusercontent.com/37984032/145939362-5da16fb6-5be7-44cf-a78a-a2c4dfc6d4a1.mp4" type="video/mp4">
    What kind of ancient browser are you using! html videos not supported.
</video> 

As you can see there's alot of oscillation and drift on the X Y plane, But it does seem to stabilize itself upright so that's progress.

After bit of adjusting the Derivative part and adding an observer for the X Y position here's the result.

<video width=75% height=auto controls>
  <source src="https://user-images.githubusercontent.com/37984032/145953150-054bd84f-2ddf-4bb2-859a-dfe86047e784.mp4" type="video/mp4">
    What kind of ancient browser are you using! html videos not supported.
</video> 

#### Auto landing

By setting the target rotating and position to a particular point, The rocket tries to reach the specified location. By generating a path towards a landing zone and interpolating the position, We can land the rocket!.

```gdscript
...
	if(autopilot):
		err_rot_x = target_rot.x - rx;
		err_rot_z = target_rot.z - rz; #vec2 y = z blender coord space
	
		err_pos_x = target_pos.x - px;
		err_pos_z = target_pos.z - pz;
		err_pos_y = target_pos.y - height;	
...
```
<br>

<video width=75% height=auto controls>
  <source src="https://user-images.githubusercontent.com/37984032/146388484-9a42fa5b-f205-43b6-a0e2-6b0596569437.mp4" type="video/mp4">
    What kind of ancient browser are you using! html videos not supported.
</video> 

Overall this has been a very fun project, I've learned a lot about building PID controllers and using it, although in a Simulation it's still a very fun thing to play around. For my major project I'm planning on using this as a base to build a practical implementation. Till that time keep exploring :D.

<a href="https://github.com/itspacchu/godotRocket"><img src="https://images-ext-1.discordapp.net/external/0x1sNbKU4L3OamtuWiC7ZgiUmFGXUBZzue_9JezeinI/https/opengraph.githubassets.com/acf51b2c4c802bdf42eae0ad72546e5394d8a2b63e5723d82a48c19715bc2b2d/itspacchu/GodotRocket" width=50%></a>


### Web version

A web playable version of this project is available [Here](https://0x45.in/projects/webrun/godotrocket/rocketpid.html)

<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>