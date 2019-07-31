---
title: Generating Images
sidebar: Analysis_sidebar
permalink: Analysisguide-generating-images.html
folder: Analysis_guide
---

<link rel="stylesheet" href="css/theme-purple.css">

If you've been reading in order, then you know that I keep throwing this
"publication-quality images" phrase around.
Well, what do you know, the "Generating Images" section will actually tell you
how to make these images! Amazing.
Once you've gotten the the screen to look how you want the image you wanted
created to look, follow <code>File &rarr; Render</code> in the main menu.
This brings up the `File Render Controls` menu (see the image below).

{% include image.html file="Analysis/file-render-controls.png"
alt="The File Render Controls window. The first option is 'Render the
current scene using:' with Tachyon, internal, in-memory rendering selected.
The next choice is 'Filename', and the name given is
my-delightful-protein-system.tga. Next to this box is a Browse button.
Finally, the 'Render command' is shown.
This is usr slash bin slash open space percent s.
The button next to it is 'Restore Default.'
The 'Start Rendering' button is at the bottom."
caption="The Render screen for image generation." %}

The first dropdown, `Render the current scene using:`, selects the
image-quality type.
If you're just doing something super quick that's kind of irrelevant, then it's
fine to save the file with the default `Snapshot (VMD OpenGL window)`.
If you're going to want to use the image for a presentation, poster, or
publication, however, then you'll want to select
`Tachyon (internal, in-memory rendering)`.
For a juxtaposition of these, see the next to figures.
(We'll get to why the colors are different at the end of this section.)

{% include image.html file="Analysis/snapshot.png"
alt="The protein is blue, yellow, and pink. The image is grainy."
caption="Image generated with Snapshot (VMD OpenGL window)." %}

{% include image.html file="Analysis/tachyon.png"
alt="The protein is mostly blue with some yellow and with flecks of pink.
It appears to be of a high quality."
caption="Image generated with Tachyon (internal, in-memory rendering)." %}

The second dropdown is where you select the save location and the filename.
For these images, keep the `.tga` extension; you can convert the `.tga` using
Gimp or the UNIX [`convert`](UNIXguide-convert.html) command later.
The final box shouldn't be something you have to mess with at all, as it is the
default option. Once you're ready, hit `Start Rendering`.

Woohoo! You've saved a picture! Enjoy remaking it 73 more times because
it wasn't good yet.
Oh, and a quick note: If you're coloring specific sections of a protein
(like with `resid 1 to 23` and `resid 95 to 293`), then you will need to make
sure that you don't also have just `protein` selected; it'd need to be like
`protein not resid 1 to 23 and not resid 95 to 293`.
The reason why is because VMD cannot handle the layering in image creation,
and your picture will look terrible (just revisit the images above).


{% include links.html %}
