---
title: Labels
sidebar: Analysis_sidebar
permalink: Analysisguide-vmd-labels.html
folder: Analysis_guide
---

<link rel="stylesheet" href="css/theme-purple.css">

VMD allows you to label atoms, distances, angles, or dihedrals in several ways.

{% include image.html file="Analysis/VMD-labels.png"
alt="The top left is the VMD Display window, the bottom left is the Terminal
for VMD, the top right is the Graphical representations window, middle right is
the main VMD window, and bottom right is the labels window."
caption="The Terminal, Display, and Labels GUI in VMD." %}

## Atoms {#atoms}

One way to label atoms is by following
<code>Mouse &rarr; Label &rarr; Atoms</code> in the main menu and then
right-clicking on the atom/residue of interest.
This will print some information to the Terminal that VMD is operating from,
including what it was that was named, which can be helpful, since the default
labeling color is neon green.
Another way is to left click on the display window, hit `1` on the keyboard,
and then click on the atom that you want information on using the mouse.
Finally, following <code>Graphics &rarr; Labels</code> will pull up all the
information printed to the Terminal in a GUI.
These different labeling types are shown in the figure above.

## Distances {#distances}

Distances between two atoms can be labeled by left-clicking on the display
window, hitting `2` on the keyboard.
Your cursor then becomes a cross, which can be used to select the two specific
atoms by left-clicking on one and then the other.
Like with the atom information, the distance will be listed on the screen,
printed to the Terminal, and shown in the labels GUI created through following
<code>Graphics &rarr; Labels</code> (once you've changed `Atoms` to `Bonds`
in the upper left corner).

## Angles {#angles}

Angles between three atoms can be labeled by left-clicking the display window,
hitting `3` on the keyboard.
Your cursor then becomes a cross, which can be used to select the three
specific atoms by left-clicking on them in succession.
The order you select them in makes a difference, though, so think through the
angle you're interested in before making your selection.
Like before, the angle will be listed on the screen, printed to the Terminal,
and shown in the labels GUI created through following
<code>Graphics &rarr; Labels</code> (once you've changed `Angles` in the upper
left corner).

## Dihedrals {#dihedrals}

Dihedrals between four atoms can be labeled the same was as
[angles](Analysisguide-vmd-labels.html#angles), except instead of hitting `3`,
you hit `4` on the keyboard and the atoms of interest.
The atom order will also make a difference here, so be careful.

{% include links.html %}
