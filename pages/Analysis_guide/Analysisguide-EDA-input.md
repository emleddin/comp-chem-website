---
title: EDA Input File
sidebar: Analysis_sidebar
permalink: Analysisguide-EDA-input.html
folder: Analysis_guide
---

<link rel="stylesheet" href="css/theme-purple.css">

EDA uses an input file that consists of the number of protein residues,
the number of files to be read in, the total number of atoms, protein atoms,
total residues, and number of types.
The final line should be the names of the mdcrds (in ASCII format) that the
program should use.
The file extension on the input file should be `.inp`.

All of the associated numbers can be found from looking at a PDB file for the
system. The final line of the protein residues and the final line of the
solvated system from which the first example input was generated is shown
here, with the relevant numbers in brackets.
```
ATOM   [7277]  O4  AKG    [455]     3.870  -2.076   2.583  1.00  0.00
ATOM  [59661]  H2  WAT  [17929]    -1.189   1.046 -55.340  1.00  0.00
```

This example is for a protein that the strip command was not used on.
```
455 !number of protein residues
1 !number of files
59661 !total number of atoms
7277 !number of protein atoms
17929 !number of total residues
2000 !max number of types
solvated_complex_imaged_1-200-full.mdcrd
```

This example is for a protein that the strip command was used on.
Notice that the protein and the residue totals are equivalent.
Using strip will return bad values, so it shouldn't be used.
```
455 !number of protein residues
1 !number of files
7278 !total number of atoms
7278 !number of protein atoms
455 !number of total residues
2000 !max number of types
solvated_complex_imaged_1-200.mdcrd
```

This example shows what it looks like when multiple mdcrd files are read in.
```
473 !number of protein residues
10 !number of files
59663 !total number of atoms
7295 !number of protein atoms
17929 !number of total residues
2000 !max number of types
solvated_complex_md1.mdcrd
solvated_complex_md2.mdcrd
solvated_complex_md3.mdcrd
solvated_complex_md4.mdcrd
solvated_complex_md5.mdcrd
solvated_complex_md6.mdcrd
solvated_complex_md7.mdcrd
solvated_complex_md8.mdcrd
solvated_complex_md9.mdcrd
solvated_complex_md10.mdcrd
```

{% include links.html %}
