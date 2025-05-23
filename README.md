BlackHoleProject  
=============

Made by: Ellis Simmons, May 2025  
Language: Processing (Java)

---

What this is?    
-----------------------------------
This is a visual simulation project that models a black hole’s gravitational effects on nearby matter and stars using particles. It is split into two sketches, one showing stars being pulled toward the black hole, and the other simulating particles orbiting and falling in.

---

What it does:  
---------------------------------------
- The **Stars** sketch:  
  - Shows stars scattered around space  
  - Stars move toward the black hole with gravity like pull  
  - Stars disappear when they cross the event horizon and respawn randomly
  - Stars leave a glowing trail behind them to show their motion    
- The **Particles** sketch:  
  - Simulates particles orbiting the black hole with tangential velocity  
  - Particles are pulled in by gravity and fall inside the event horizon  
  - Particles also leave glowing trails showing their motion  
- The **CompleteBlackHoleProject.pde** sketch:  
  - Combines both stars and particles in one simulation  
  - Includes the black hole’s event horizon visualized with rings  
  - Shows interaction of both elements around the black hole in a single program

---

How to run it:  
-----------------------------------------------
You can run each `.pde` sketch separately in Processing to see the two parts of the simulation, or run the complete version for the full experience.

---

How it works:  
-------------------------------
- Built with Processing’s Java mode  
- Uses vectors for position and velocity  
- Applies simplified gravity physics based on inverse square law for attraction  
- Event horizon is a circular boundary; particles and stars are removed when crossing it  
- Trails are implemented by storing previous positions for a fading effect
- All particles have slight "air resistance" so they do not infinitely rotate, there is no air resistance in space but this makes it so every particle eventually falls in

---

Why I made it:  
--------------------------------------
I wanted to create a cool visual model that captures the behavior of black holes and their effect on nearby matter. It’s both a programming challenge and a way to help myself understand physics.

---

Stuff you can mess with:  
-------------------------------------------
```python
- numParticles = 20                # Number of orbiting particles simulating matter  
- numStars = 150                  # Number of background stars scattered around  
- eventHorizonRadius = 70         # Radius of the black hole’s event horizon  
- particleTrailLength = 10        # How long the glowing trails behind particles last  
- starTrailLength = 8             # Length of the fading trail behind stars  
- particleMinVelocity = 1.5       # Minimum tangential velocity for particle respawn  
- particleMaxVelocity = 3.5       # Maximum tangential velocity for particle respawn  
- particleGravityStrength = 2000  # Strength of the gravitational pull on particles  
- starGravityStrength = 1000      # Strength of the gravitational pull on stars  
- velocityDamping = 0.999         # How quickly particles and stars lose momentum  
```

---

Sources & Inspiration:  
------------------------------------------------
- Neil deGrasse Tyson’s videos on black holes and astrophysics  
- Kurzgesagt’s YouTube videos about black holes and gravity  
- NASA’s educational articles on black holes and event horizons  
- Scientific papers and popular science blogs about gravity and space-time  

---

As per usual, if you're going to steal or use it at least credit me please. Thank you for reading and have a nice day.
