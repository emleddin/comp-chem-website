---
title: EDA Overview
sidebar: Analysis_sidebar
permalink: Analysisguide-EDA.html
folder: Analysis_guide
---

<link rel="stylesheet" href="css/theme-purple.css">

Energy decomposition analysis (EDA) is a quantitative means of understanding
chemical bonds.
The way that we go about EDA provides information about the Coulomb and
van der Waals energies for different residues of interest.

We go about performing EDA using a Fortran90 program adapted by
[Dr. Cisneros](http://chemistry.unt.edu/~CisnerosResearch/index.html).
The program uses an input file ([described here](Analysisguide-EDA-input.html))
that includes some specific information about the system being studied,
including the number of residues in the associated mdcrd file.
One thing to note for the Fortran90 program is that the input files must be in
ASCII format.
Starting with AMBER16, the default format for all generated files is NetCDF
and not ASCII; unless you explicitly set `ioutfm=0` in your mdin files, you 
will have them in NetCDF format.
To check if your mdcrd is in ASCII format, use something like `head _____.mdcrd`.
If you see neat rows of numbers, then it is in ASCII.
If it looks like your computer is exploding in the Terminal, then you'll need
to use cpptraj to create an ASCII formatted mdcrd.
Another (easier) way to do this is to use `file _____.mdcrd`.
If the file is a NetCDF, then `_____.mdcrd: data` would be returned;
otherwise `_____.mdcrd: ASCII text` will be returned.
You can use *cpptraj* to convert to ASCII through adding
```
trajout _____.mdcrd crd
```
to the end of your a *cpptraj* input (that includes all the trajin lines for
files of interest).
It is critically important that any time cpptraj is used to convert to ASCII
format that no strip commands are used.
Stripping the system, while saving on time, will return radically different
values for both Coulomb and van der Waals energies.
Using autoimage will have an effect on the significant figures, so it should
also not be used.

Once the Fortran90 program has run (correctly), there are 3 output files
generated.
These are fort.804, fort.803, and fort.806. The first one, `fort.804`, is a
sanity check that may include the atom typing.
It is created at the start of the program execution.
The other two files, `fort.803` and `fort.806`, are created after the program
has finished.
`fort.803` includes information about the Coulomb energies; `fort.806` includes
information about the van der Waals energies.
For both of these files, the columns are organized from left to right as:
1. Index (row number)
2. Residue A
3. Residue B
4. Coulomb or van der Waals energy (in kcal mol<s>-1</s>)
5. Standard error

{% include links.html %}
