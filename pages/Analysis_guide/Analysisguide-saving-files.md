---
title: Saving Files
sidebar: Analysis_sidebar
permalink: Analysisguide-saving-files.html
folder: Analysis_guide
---

<link rel="stylesheet" href="css/theme-purple.css">

VMD is pretty useful for saving structures.
For instance, you can save the final frame of a trajectory
(so a loaded in `prmtop` and `nc` file combo), and use that final structure for
all of your images.
Pretty cool, huh? No? Alright, tough crowd.
Anyway, you can do that by first highlighting the structure you'll want to save
something from in the main menu, then following
<code>File &rarr; Save Coordinates</code>.
When saving a PDB from the prmtop/nc combo, then you're going to want to change
the first frame to be equal to the last frame value
(so in the image below, both should be 4999), because otherwise the PDB will
contain a ridiculous number of coordinates and thus won't actually be helpful.
You can also use [VMD's syntax](Analysisguide-graphical-reps.html#syntax)
to specify which things you want saved (usually `all not water`).
Also, with frame numbers, as you can see, VMD starts a "0" and counts upwards,
so while there were 5000 frames loaded, it'll register as 0 to 4999.

{% include image.html file="Analysis/vmd-save.png"
alt="VMD's Save Trajectory window. First box: Save data from. Second:
selected atoms. Third: file type. PDB is selected. Bottom left is frames.
The first is 0, last is 4999, and stride is 1. Save all at once is selected
instead of save in background. The clickable save button is to the right of the
file type box." caption="The Save Trajectory menu." %}


{% include links.html %}
