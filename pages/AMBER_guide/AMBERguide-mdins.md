---
title: Mdin Files
sidebar: AMBER_sidebar
permalink: AMBERguide-mdins.html
folder: AMBER_guide
---

<link rel="stylesheet" href="css/theme-orange.css">

Input files, known as `mdin` files, set up the conditions that the system is
subjected to. Typically, molecular dynamics simulations go through the
following steps:

1. __Minimization__. Since PDBs do not have hydrogens, and solvent molecules
are just kind of thrown into a box by *LEaP*, the goal of minimization is to,
for lack of a better work, minimize the number of clashes and bad contacts
between things in the system. Let's say that you have two hydrogen atoms
driving wild protein-based cars. If *LEaP* decided that the two hydrogen atom
cars should be bumper-to-bumper, minimization would be the driving instructor
pointedly reminding them to maintain a 3 second following distance. With each
step of minimization, you typically lower any restraints that you have (it's a
gradual learning process for our student-driver hydrogens), until your final
step which would ideally happen without any restraints at all.
2. __Heating__. MD simulations are based on trajectories, and those
trajectories need to have initial velocities in order to have kinetic energy.
The heating step is where these initial velocities are assigned, and thermal
energy (*cough* heat *cough*) is added to the system. The temperature starts
from 0 K and is gradually brought up to the desired temperature
(probably 300 K). Usually the restraints come back during heating because most
of what is being heated is solvent.
3. __Equilibration__. After the system goes from from being motionless to
reaching the desired temperature, the system should undergo equilibration.
Equilibration is kind of like the system's time to relax. It goes from being
restrained for most of its life to those restraints being lifted and given the
opportunity to wiggle freely. Like with minimization, equilibration often has
several steps of gradually reducing the restraint weight, until the final
equilibration step that has nothing.
4. __Production__. The system is finally ready for unrestrained MD! Huzzah!
[And there was much rejoicing.] Production is the part of MD simulations that
takes the longest time, but it is also the part that people care about.
Analyses are based on the data from the production steps, and production can
last as long as you want it to. Typically anything less than 100 ns is useless,
and a minimum of 1 &mu;s is seen as ideal. How long you run for is entirely
dependent on your resources, but the longer you run for, the better the data.

 * It is wise to break up production into smaller chunks, instead of generating
one massive 100 ns data file, though, because writing more frequent restarts
means that if the computer crashes you don't have to start all over, and
smaller file sizes means that data corruption is less likely.
Additionally, many supercomputers have a wall-clock time, and you lose anything
that goes over that time--so writing over that limit means you're wasting both
your time and computational resources.

Replicate trajectories should go through each of these 4 steps independently.
So, the initial `prmtop` and `inpcrd` should be copied into multiple folders
and undergo all these steps alone. The reason for this is that your starting
structure won't change, but what contacts are manipulated through minimization
might.

Also, it is <u>**_HIGHLY suggested_**</u> that you check the system after
you've finished equilibration before moving onto production. Sometimes there
are bonds that are clearly not right, and checking will save you a lot of time
waiting on a system doomed to fail.

{% include links.html %}
