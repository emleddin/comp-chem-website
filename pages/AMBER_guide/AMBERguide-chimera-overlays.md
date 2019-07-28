---
title: Overlays in Chimera
sidebar: AMBER_sidebar
permalink: AMBERguide-chimera-overlays.html
folder: AMBER_guide
---

<link rel="stylesheet" href="css/theme-orange.css">

As mentioned earlier, you can save structures relative to each other in
Chimera. First, open both structures in Chimera. Then, follow
`Tools &rarr; Structure Comparison &rarr; MatchMaker`.
This brings up the `MatchMaker` panel (see the image below). On the left,
you'll select one structure as the reference, and you'll choose the ones to
match on the right.

{% include image.html file="AMBERguide/matchmaker-screen.png"
alt="The MatchMaker window has reference structures to the top left and
structures to match on the top right. Then there are a bunch of options
for matching things. The same thing should not be selected for both the
reference and the structure to match.
"
caption="The MatchMaker screen, which allows you to align sequences and then
save their coordinates relative to each other." %}

Once you've hit "apply," they'll be matched and oriented to the reference you
selected. You can then save them through `File &rarr; SavePDB`.
Highlight the one to save, and then select the correct option under "Save
relative to model," depending on what you want.

{% include links.html %}
