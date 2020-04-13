---
title: "tleap: for Command-Line Lovers"
sidebar: AMBER_sidebar
permalink: AMBERguide-tleap.html
folder: AMBER_guide
---

<link rel="stylesheet" href="css/theme-orange.css">

*tleap* is a program that will generate the system from the command line based
on an input file containing all the necessary information, written in the same
syntax that is used in *xleap*.

An example *tleap* script is:
```
source leaprc.protein.ff14SB
source leaprc.DNA.OL15
source leaprc.gaff
source leaprc.water.tip3p

loadoff ZN2.lib
loadamberparams ZN2.frcmod

loadamberprep NSA.prepi
loadamberparams NSA.frcmod

NSB = loadmol2 NSB.mol2
loadamberparams NSB.mol2

WTP = loadpdb WT_protein_system.pdb

savepdb WTP WT_protein_system_vac.pdb
saveamberparm WTP WT_protein_system_vac.prmtop WT_protein_system_vac.inpcrd

addions WTP K+ 0.0
solvatebox WTP TIP3PBOX 12.0

savepdb WTP WT_protein_system_wat.pdb
saveamberparm WTP WT_protein_system_wat.prmtop WT_protein_system_wat.inpcrd
quit
```

When running a *tleap* script, you can specify the input file with the
`-f` flag.
```bash
$ $AMBERHOME/bin/tleap -f tleap-script.in
```

*tleap* prints a lot of information to the Terminal, and you can watch for any
errors.
Of course, you can send this information to an out file,
if you don't want to watch everything fail before your eyes
(just make sure it didn't fail before moving on).
The information that is printed is also saved to an appending `leap.log` file,
so the log from every attempt at creating your system is saved without
overwriting by default.
```bash
$ $AMBERHOME/bin/tleap -f tleap-script.in > tleap-attempt.out
```

{% include note.html content="If you experience issues with a `mol2` saying
that the parameters cannot be found, make sure that the argument you loaded
it in using (`NSB` above) matches the 3-letter code for the non-standard." %}

{% include links.html %}
