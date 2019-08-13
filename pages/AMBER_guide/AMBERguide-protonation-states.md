---
title: Addressing Multiple Protonation States
sidebar: AMBER_sidebar
permalink: AMBERguide-protonation-states.html
folder: AMBER_guide
---

<link rel="stylesheet" href="css/theme-orange.css">

If you've never taken general chemistry, then the title here probably makes
zero sense. If you *have* taken general chemistry, then the words "multiple
protonation states" might spark panic. Never fear! With help of the Internet
(and a little ~chemical intuition~), our systems will be biologically
relevant!

So what do I mean by multiple protonation states? You've probably heard of
(and used) ammonia at some point. Ammonia is NH<sub>3</sub>. Its conjugate
acid, an ammonium ion, is NH<sub>4</sub><sup>+</sup>. They differ by--you
guess it--a single hydrogen. They're pretty similar things, and whether or not
that hydrogen is there is pH-dependent.

Why should you care? Certain amino acids, like histidine (*sigh*), can have
multiple protonation states. That's actually a good thing, because then you get
stuff like acid-base catalysis. But that also means things like histidine can
be the difference between accurate or garbage simulations.

There are five amino acids that can have weird protonation states. They are:
aspartate, cysteine, glutamate, histidine, and lysine.

{% include image.html file="AMBERguide/protonation-states.png"
alt="Aspartic acid, ASH. Aspartate, ASP. Cysteine can be CYM, CYS, or
CYX when in a double bond. Glutamic acid, GLH. Glutamate, GLU.
Histidine can be HID, HIE, HIP, or HIS. Lysine can be LYN or LYS.
ASP, CYM, GLU, and LYN are all deprotonated. ASH, CYS, GLH, and LYS
are all protonated. HIS and HIE are protonated at N-epsilon. HID is
protonated at N-delta. HIP is protonated at both N-epsilon and N-delta.
ASH, CYM, HID, HIP, and LYN are all atypical deprotonation states.
"
caption="The different protonation states of aspartate, cysteine, glutamate,
histidine, and lysine." %}

There are a few ways to ensure that your protein is protonated correctly.
These are described below.

{% include important.html content="Make sure you've added any missing loops
and addressed any non-standard residues before checking the protonation
states! H++ __cannot__ run on a structure with missing residues!" %}

## MolProbity

[MolProbity](http://molprobity.biochem.duke.edu/)

MolProbity also has the added bonus of

#### ADD MORE HERE

## H++ Server
The [H++ Server](http://biophysics.cs.vt.edu/) is a webserver that processes
a PDB structure and adds missing hydrogens based on the pKas of ionizable
groups.

To use it, select the
["Process a Structure"](http://biophysics.cs.vt.edu/uploadpdb.php) tab.

{% include image.html file="AMBERguide/Hplusplus-upload.png"
alt="The Process a Structure page for H++. There are two choices: selecting
a file to submit and entering a PDB code.
"
caption="The 'Process a Structure' page for H++." %}

Then, submit!

##### ADD MORE HERE LOL


{% include links.html %}
