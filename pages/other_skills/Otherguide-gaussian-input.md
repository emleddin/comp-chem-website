---
title: Gaussian Input Files
sidebar: other_skills_sidebar
permalink: /Otherguide-gaussian-input.html
folder: other_skills
---

<!-- <link rel="stylesheet" href="css/theme-blue.css"> -->

Gaussian input files have the file extension `.gjf` or `.com`.
Jobs will read in data from a checkpoint (`.chk`) file, or write to new file.
Logfiles (`.log`) contain all the information about the job, and
whether it failed or ran successfully.

{% include warning.html content="A successful run does not mean correct run.
Check your data! If it doesn’t make chemical sense, question it!" %}

## Water Example
Here is what a basic input for water would look like.
```bash
%mem=32MB
% chk=water.chk
# opt freq geom b3lyp/6-31+g(d,p) geom=connectivity integral=ultrafine scf=maxcyc=1024

water

0 1
O 1.80172602 0.06746038 0.00000000
H 2.76172599 0.06770148 0.00000000
H 1.48149872 0.97247667 0.00000000
```

This input, with explanatory comments marked with `###` is:
```bash
%mem=32MB ### system resources (both % words or %words OK)
% chk=water.chk ### specifies the checkpoint file to write
# opt freq geom b3lyp/6-31+g(d,p) geom=connectivity integral=ultrafine scf=maxcyc=1024 ### Job specifics–NO ENTER KEY
### I am a required blank line
water ### Titlecard: this line is required
### I am a required blank line
0 1 ### Charge, spin multiplicity
O 1.80172602 0.06746038 0.00000000
H 2.76172599 0.06770148 0.00000000
H 1.48149872 0.97247667 0.00000000
### I am a required blank line
```

<code>Calculate &rarr; Gaussian Calculation Set-Up</code>

{% include image.html file="other_skills/calculation_job_type.png"
alt="The calculation setup window, with the job type dropdown shown.
The options are Energy, Optimization, Frequency, Opt+Freq, IRC, Scan, Stability,
and NMR." caption="Different Gaussian job types." %}

## Job Type

1. Energy: Calculates the energy and wavefunction at a single, fixed
geometry
2. Optimization: Attempts to find the structure’s minimum energy
configuration
3. Frequency: Gives thermochemical properties of the structure
4. Opt + Freq: Performs both optimization and frequency
5. IRC: Asks to follow a reaction path by integrating the intrinsic reaction
coordinate
6. Scan: Scans the potential energy surface by performing single-point
energy calculations
7. Stability: Checks stability by determining if imaginary (negative)
frequencies exist (Yes? That’s bad, unless a transition state.)
8. NMR: Predicts NMR shielding tensors


## Method

* Method: the “school of thought” for the wavefunction
* Basis set: contains all the functions that represent the wavefunction
    * Higher-order basis sets are often more accurate, but at a higher
    computational/time cost
    * Diffuse functions (ex: +, ++) describe very electronegative atoms
    * Polarization functions (ex: d, p) allow for angular flexibility (i.e.,
    reduces the strain from lots of electrons)
* Charge: overall charge of the structure
* Spin: pairing of the electrons
    * Singlet: All electrons paired
    * Multiplicity = Number of unpaired electrons + 1

{% include image.html file="other_skills/calculation_method.png"
alt="calculation setup window, with the method tab selected.
The first line is method with Ground State, Hartree--Fock, and Default Spin
selected. The next line is Basis Set with 3-21G entered in the first box and
the next two empty. The third line has Charge with 0 and Spin as Singlet." caption="The method tab." %}

## Solvation

* Implicit: Solvent is a polarizable continuum with dielectric constant,
&epsilon;
    * Not terribly costly
    * Cannot model specific interactions, like hydrogen bonds
    * Magician waving a wand  there’s some magic happening, but you can’t see it
* Explicit: Want a solvent? Build it in. Put it there.
    * Expensive...
    * Can get stuff like hydrogen bonds
    * As magician’s apprentice, you see all the things going into the “magic”

{% include image.html file="other_skills/solvation_models.png"
alt="The left panel is a methane molecule, CH4, on a white background.
The caption is Vacuum (Gas Phase). The middle panel is methane surrounded by a
slight white gap before a red and mark hashed pattern. The caption is implicit
solvent. The right panel is methane with about 4 waters, H2O, drawn. The
caption is explicit solvent." caption="Different solvation models." %}

{% include links.html %}
