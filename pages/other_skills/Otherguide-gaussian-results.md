---
title: Viewing Gaussian Results
sidebar: other_skills_sidebar
permalink: /Otherguide-gaussian-results.html
folder: other_skills
---

<!-- <link rel="stylesheet" href="css/theme-blue.css"> -->

To open a checkpoint file, follow:
1. `File`
2. `Open`
3. Select the `.chk` file

## Gaussian Logfile

The logfile (`.log`) contains all of the job information. You should always
check the logfile for successful job completion! The “it did something” way is
to check the end for an end quote. The “real” way is to check for convergence.
That said, not everything that has a Gaussian logfile will have convergence
information, but it will have information indicating that what you were doing
worked.

```
IF OTHER PEOPLE ARE GOING TO TALK, CONVERSATION IS SIMPLY
IMPOSSIBLE.
-- WHISTLER'S
PRINCIPLE
Job cpu time: 0 days 0 hours 0 minutes 3.0 seconds.
Elapsed time: 0 days 0 hours 0 minutes 2.8 seconds.
File lengths (MBytes): RWF= 6 Int= 0 D2E= 0 Chk= 1 Scr= 1
Normal termination of Gaussian 16 at Fri Jun 7 10:02:03 2019.
```

## Summary

The summary window contains job information and some results. To access the
results summary, follow: <code>Results &rarr; Summary</code>. One
*E<sub>h</sub>* (hartree) is equivalent to 627.509474 kcal mol<sup>-1</sup>.
There's a great energy converter page from
[Colby College](http://www.colby.edu/chemistry/PChem/Hartree.html) that you can
use to make this more meaningful to you.

{% include image.html file="other_skills/Gaussian_methane_summary.png"
alt="The window contains three tabs, overview, thermo, and opt. Overview is
selected. Then the titlecard is shown. Next the file location is listed.
The remaining lines contain job information, including: File Type, Calculation
Type, Calculation Method, Basis Set, Charge, Spin, Solvation, Electronic Energy,
RMS Gradient Norm, Imaginary Freq, Dipole Moment, Polarizabililty,
Hyperpolarizability, and Point Group." caption="The Gaussian summary window." %}

## Vibrations

The vibrations window contains frequency and Raman information. From this
window, you can watch animations of stretching and vibrations. To access the
window, follow: <code>Results &rarr; Vibrations</code>.

{% include image.html file="other_skills/Gaussian_methane_vibrations.png"
alt="The window contains a large table with different vibrational modes shown
in each row. The columns include Mode Number, Frequency, Infrared, Raman
Activity, Depolar-P, and Depolar-U. Selected rows can be animated using the
Start Animation button in the next block, and settings can be adjusted for
speed and repetition." caption="The Gaussian vibrations window." %}

## Charge Distribution

The charge distribution can be plotted on the structure. To access the
distribution, follow: <code>Results &rarr; Charge Distribution</code>.

{% include image.html file="other_skills/methane_Mulliken_charges.png"
alt="Methane is shown with the charges listed on the atoms. Carbon has a -0.794
charge. The hydrogens each have a charge of 0.198."
caption="Charges mapped onto methane." %}

## Cube Data

Different data can be plotted onto the structure. This can be accomplished
by following <code>Results &rarr; Surfaces/Contours</code>, which brings up the
surfaces and contours window.

{% include image.html file="other_skills/surfaces_and_contours_window.png"
alt="The first block contains the Cubes Available, with the Cube Actions
button to the right. Under this block is Surfaces Available with the Surface
Actions button to the right. There are some boxes below to specify the isovalue
for new surfaces of MO, Density, and Laplacian. The final block is Contours
Available with the Contour Actions to the right."
caption="The Surfaces and Contours window. Here, the electron density cube
was selected and and ESP surface was mapped onto it." %}

First, pick a type of information to show on the structure through
<code>Cube Actions &rarr; New Cube</code>. You can plot several different
properties. For the example below, I picked the total density as the content
for the new cube. The grid options specify how smooth the surface looks.
`Coarse` is fine for quick images, and `Medium` should be alright for
presentations or posters.

You can also use those cubes to plot different information.
To do so, follow <code>Surfaces Available &rarr; New Mapped Surfaces</code>
in the second block. I picked electrostatic potential (ESP) for the example.

{% include image.html file="other_skills/ESP_map.png"
alt="A structure of blobs. The left is teal and the right is dark blue. The
spectral scale goes from red as negative values to dark blue as positive
values."
caption="The electrostatic potential mapped onto the structure." %}

Cubes can be saved, but surfaces will be recalculated each time.

{% include links.html %}
