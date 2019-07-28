---
title: Atoms Not in Residue Templates
sidebar: AMBER_sidebar
permalink: AMBERguide-residue-template-error.html
folder: AMBER_guide
---

<link rel="stylesheet" href="css/theme-orange.css">

Occasionally while using a LEaP-based system, you'll get errors like:
```
Created a new UNIT for residue: WAT sequence: 585
Created a new atom named: O within residue .R<WAT 585>
Created a new atom named: H1 within residue .R<WAT 585>
Created a new atom named: H2 within residue .R<WAT 585>
   total atoms in file 7658
   The file contained 7658 atoms not in residue templates
```
These occur when you didn't source the correct leap files with the atom types
you needed (leaprc.ff99SB, for example).

You can also get these errors if you have non-standard residues in your files,
but you didn't get the parameters you needed for them.
```
Created a new UNIT for residue: AKG sequence: 455
Created a new atom named: O1 within residue .R<AKG 455>
Created a new atom named: C1 within residue .R<AKG 455>
Created a new atom named: O2 within residue .R<AKG 455>
Created a new atom named: C1 within residue .R<AKG 455>
Created a new atom named: O3 within residue .R<AKG 455>
---
Created a new atom named: C4 within residue .R<AKG 455>
   total atoms in file 7658
   The file contained 69 atoms not in residue templates
```

Go back and load in the things you need--check the force field and check your
non-standards. Effectively, begin the LEaP process all over again.


{% include links.html %}
