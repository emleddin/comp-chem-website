---
title: Color Keys
sidebar: Analysis_sidebar
permalink: Analysisguide-color-keys.html
folder: Analysis_guide
---

<link rel="stylesheet" href="css/theme-purple.css">

Chimera allows users to develop a color key that matches the scale used in
attribute shading.
To add a color key to your image (or just make a color key for a previously
generated image), follow either
<code>Tools &rarr; Depiction &rarr; Color Key</code> or
<code>Tools &rarr; Utilities &rarr; Color Key</code>.
Both are in newer editions of Chimera, but older editions only have the latter.
This path will bring up the Color Key menu (see the image below).

{% include image.html file="Analysis/colorkey-creation.png"
alt="The 2D Labels/Color Key pane. The Color Key tab is selected. The next
line is a box for number of colors or labels. Then the three colors and
their listed values are selected. There are a lot of other options, as well."
caption="Chimera's Color Key menu, with options for
generating a color key, and an example shown from the options given." %}

The number of colors shown in the scale can be changed in the
`Number of colors/labels` box.
Clicking on an individual color will bring up the colors menu.
The colors depicted in the figure have the Tk color codes of:
* Blue: `#0000ffffffff`
* Yellow: `#ffffffff9792`
* Red: `#ffffffff0000`
The key can be blocks of the given colors, or made blended by changing the
`Color range depiction` box, and the figure labels can include plain text
(i.e. unformatted) unit labels.

Once the settings have been chosen, simply draw the key wherever you would like
it. If you click anywhere outside the center of the generated key while the
color key box is open, then it will start to redraw the key.
Grabbing the center of the drawn key will allow it to be repositioned.

{% include links.html %}
