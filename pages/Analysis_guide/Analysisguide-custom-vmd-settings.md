---
title: "Custom Settings at Start-Up"
sidebar: Analysis_sidebar
permalink: Analysisguide-custom-vmd-settings.html
folder: Analysis_guide
---

<link rel="stylesheet" href="css/theme-purple.css">

[Visual Molecular Dynamics (VMD)](http://www.ks.uiuc.edu/Research/vmd/) is a
very powerful program (available for Unix, MacOS X, and Windows) that allows
users to visualize their MD data.

VMD allows users to create a `.vmdrc` file that is sourced the program's
start-up.
This file should be located in your home directory (`/home/username`).

My `.vmdrc` file looks like:
```
display projection orthographic
menu main on
display nearclip set 0
axes location off
color Display Background white
display depthcue off
atomselect macro noh {not (mass 1.008 and charge < 0.25)}
set env(VMDFILECHOOSER) FLTK
color Labels Atoms black
color Labels Bonds black
label textthickness 2.0
```
The explanation:
* The default projection is "perspective," which will make things closer to the
screen larger. Instead of a square box in orthographic, perspective is more of
a triangular box shape.
* Using `menu main on` ensures that you will have the main menu (which is
important if you haven't memorized the command prompt for every single thing
VMD does) at all times.
* Nearclip controls how distinctly and crisply items pop out of the screen;
the most clean view is achieved at lower values.
* The axes are turned off because they are relative and any generated images
or movies shouldn't include them.
* The default background color is black. Any images or movies that are
generated should be made with a white background.
* Depthcueing is the front-to-back shading of loaded molecules.
When `depthcue` is off, there is no shading/automatic transparency.
* The default of VMD removes all hydrogens.
By using the `atomselect` line, any polar hydrogen atoms are shown.
* `FLTK` is an independent file chooser that should effectively be the default 
for most \*nix systems. This line is especially important when using Mac OS,
due to some issues with trying to use a Mac-based file chooser.
The other choice for VMD is `TK`.
* The default atom labels are green. Black is way easier to see on the white
background.
* The default bond labels are also green. Again, black on white is easier to
read.
* The default labels are thin and hard to read. This makes them bolder.


{% include links.html %}
