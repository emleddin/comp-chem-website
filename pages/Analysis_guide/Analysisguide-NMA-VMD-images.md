---
title: "Normal Mode Images in VMD"
sidebar: Analysis_sidebar
permalink: /Analysisguide-NMA-VMD-images.html
folder: Analysis_guide
---

<link rel="stylesheet" href="css/theme-purple.css">

## Creating Images for `.nmd` Files with Structure Information in VMD {#images}
You can make gorgeous images and gifs with the NMD structure information in VMD.
1. Load in the NMD and structure, then align as described
[previously](Analysisguide-cpptraj-NMA.html#load-NMD).
2. Change the arrow color in the top right of the NMD Wizard pane.
Trying to change it from the graphics menu will not work.
3. Use the NMD Wizard Pane to modify the arrow settings. Some solid choices are
`Arrow cylinder radius: 0.1` and `Arrow/porcupine cone radius: 0.4`.
4. Change the `Graphics material` to your choosing. If you want the default
Hard Plastic, you may need to deselect it and reselect it to make the changes
take effect!
5. After modifying the arrows, then modify the graphic display. If you go back
to the arrows later, you may need to redo your specifications for the
`default_name coordinates` structure...

{% include important.html content="If you are highlighting a residue, make sure
that that residue is not being colored by another command! It will NOT render
properly, and you'll be upset that it wasn't colored as intended." %}

{% include image.html file="Analysis/NMWiz-modifications.png"
alt="The NMWiz GUI for a loaded NMD in VMD. There are many rows of buttons."
caption="NMWiz GUI with a loaded structure.T he top right box in black shows
where to modify the arrow color. The options button in red on the Mode (2) line
opens the Mode Graphics Options dropdown at the bottom of the GUI. In that
section, the purple box highlights the checkbox for drawing atoms in both
directions. The green dashed box shows where to set the arrow and cone
properties. The brown dashed box highlights the button for the arrow material." %}

{% include image.html file="Analysis/NMD-test.png"
alt="A protein structure with normal mode information."
caption="Example rendering with normal mode arrows. The protein structure is
lime (ColorID 12), a highlighted residue is yellow (ColorID 4),
and the nucleic acid residues are magenta2 (ColorID 28). The arrows are shown
in both directions in black." %}

## Table: Graphical Representation of `1: default_name coordinates` {#tab-graph}

| Style | Color      | Selection                 | Modified Property | Material |
| ----- | ---------- | ------------------------- | ----------------- | -------- |
| Tube  | ColorID 12 | all                       | Radius: 0.2       | AOChalky |
| VDW   | ColorID 12 | name CA and not resid 251 | Sphere Scale: 0.4 | AOChalky |
| VDW   | ColorID 4  | name CA and resid 251     | Sphere Scale: 0.4 | AOChalky |
| VDW   | Color 28   | name P C2 "C4'"           | Sphere Scale: 0.4 | AOChalky |
