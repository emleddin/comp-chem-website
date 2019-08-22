---
title: Creating Cloth Posters
sidebar: other_skills_sidebar
permalink: /Otherguide-creating-cloth-posters.html
folder: other_skills
---

<!-- <link rel="stylesheet" href="css/theme-blue.css"> -->

Cloth research posters are more portable, durable, and substantially cheaper
than traditional paper posters. Have you ever had to bring a poster tube on a
plane? It's a nightmarish task.

You can use [Spoonflower](www.spoonflower.com) to print cloth posters. The
process that a few people have figured out work best for these are:
* Submit a poster with 300 DPI (dots per inch/pixels per inch) resolution
* Converting from a PDF to a PNG (a TIF, GIF, or *minimally compressed* JPG
    works too)
* Using the __Performance Piqu&eacute;__ fabric
* Using the __Yards (56" width)__ size
* Use a __Center__ repeat

Posters generated using LaTeX are already PDFs, and posters created from
PowerPoint can be exported as a PDF. From a saved PDF, these files can then
be converted to a higher-resolution image file using Gimp (free) or
another photo-editing software, such as Photoshop<sup>&reg;</sup>.

## Using Gimp to Convert a PDF to 300 DPI

You can open the file from the command line with:
```
gimp name_of_file.pdf
```

This will open the Import from PDF window. In this window, you can change the
resolution from the default 100 pixels per inch to the wanted 300 pixels
per inch. You want to do this so your poster is a higher-quality, and the
text and images aren't grainy or pixellated.

{% include image.html file="other_skills/gimp_poster_import_300dpi.png"
alt="Gimp's Import from PDF window. First, the PDF that is uploaded is shown as
a thumbnail. Then you select the page range. Open pages as layers. Width in
pixels is 14400, corresponding to 48 inches. Height in pixels is 10800,
corresponding to 36 inches. The resolution is 300 pixels per inch.
Anti-aliasing is selected. The import button is on the bottom right."
caption="The PDF resolution should be changed from the default 100 pixels/inch
to 300 pixels/inch before saving in an image format." %}

Once the PDF is imported, you can now export it as in image format. To do this,
follow <code>File &rarr; Export As</code>. I personally recommend saving as a
PNG, but any of the accepted formats is okay. Make sure to explicitly change
the file extension and the output file type.

Now that you've exported the image (it might be a good idea to open it up and
    check that everything looks right), you can upload it to
    [Spoonflower](www.spoonflower.com).


## Spoonflower Uploads

It is recommended that you make an account with Spoonflower for a few reasons:
* You can sometimes get discount codes
* Your past work will be saved
* It's easier for future you

Even if you don't make an account, you can still use Spoonflower to print your
cloth poster. The top left corner has an "Upload Your Design" button. Click
that button! &#x1F603;

From there, you upload your image.

{% include image.html file="other_skills/spoonflower_upload_page.png"
alt="The top left lists the file name. The left side has a ruler with the
preview of the poster. On the right are the options. Center is selected, and
the upload is 48x36in, 300 pixels per inch. Performance Pique fabric has been
chosen. The size is 1 yard (56 inches)."
caption="The Spoonflower upload window." %}

Once it is uploaded, select your fabric and click the "smaller" button until
the proper poster size (likely 48x36) is shown. Choose the "Yards (56" width)"
size.

Then proceed to checkout or upload more posters! Hooray! You did it!

{% include important.html content="Make sure you have your poster submitted
at least 2 weeks before you need it! Shipping (even rush) takes time, and
things can get lost in the mail." %}

{% include links.html %}
