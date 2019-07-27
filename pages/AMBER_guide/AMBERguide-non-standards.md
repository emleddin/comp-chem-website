---
title: "Non-Standards"
sidebar: AMBER_sidebar
permalink: AMBERguide-non-standards.html
folder: AMBER_guide
---

<link rel="stylesheet" href="css/theme-orange.css">

Sometimes new systems will have a non-standard residue that needs to be
parameterized in order to run molecular dynamics. What does that mean?
Well, it means your research project is so special that nobody's every needed
(or if they did, they didn't make it public) the set of parameters for
something in your system.
That said, a few hours scouring the internet could save you the pain and
suffering (fine, maybe just the time and mild annoyance) of having to generate
parameters for non-standard residues.
Two good places to check are the
[<b>R</b>ESP <b>E</b>SP charge <b>DD</b>ata <b>B</b>ase Home Page][http://upjv.q4md-forcefieldtools.org/REDDB/index.php]
(they were trying real hard to stay with a theme...) and the
[University of Manchester AMBER parameter data base][http://research.bmh.manchester.ac.uk/bryce/amber].

If you're not lucky enough to have pre-generated parameters, then you get the
pure and utter joy of either using *antechamber* in AMBER yourself
(which isn't all that bad for small organic compounds) or uploading some
information to
[PyRED program interfaced by RED Server Development](http://upjv.q4md-forcefieldtools.org/REDServer-Development/).
PyRED is an interactive submission process that generates the wanted `frcmod`,
in addition to the `mol2` required for making the `prepi` file.
PyRED has a
[tutorial](http://upjv.q4md-forcefieldtools.org/Tutorial/Tutorial-4.php)
available on how to generate certain types of non-standard residues.

{% include links.html %}
