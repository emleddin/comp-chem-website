---
title: Creating SNP Mutations in <i>LEaP</i>
sidebar: AMBER_sidebar
permalink: AMBERguide-SNPs-in-LEaP.html
folder: AMBER_guide
---

<link rel="stylesheet" href="css/theme-orange.css">

SNPs can also be created by removing the GUI Chimera offers and manually
changing residues.
For instance, if you wanted to change isoleucine (ILE) to leucine (LEU),
then you would find the ILE in the PDB and remove everything that was not the
atoms named C, CA, N, or O.

Your original ILE
```
ATOM    129  N   ILE    10     -15.372  24.194 -43.088  1.00  0.00
ATOM    130  H   ILE    10     -16.116  24.609 -42.545  1.00  0.00
ATOM    131  CA  ILE    10     -14.509  23.251 -42.446  1.00  0.00
ATOM    132  HA  ILE    10     -13.546  23.173 -42.950  1.00  0.00
ATOM    133  CB  ILE    10     -14.289  23.510 -40.982  1.00  0.00
ATOM    134  HB  ILE    10     -13.900  24.518 -40.840  1.00  0.00
ATOM    135  CG2 ILE    10     -15.631  23.370 -40.244  1.00  0.00
ATOM    136 HG21 ILE    10     -16.020  22.362 -40.385  1.00  0.00
ATOM    137 HG22 ILE    10     -15.482  23.556 -39.180  1.00  0.00
ATOM    138 HG23 ILE    10     -16.343  24.093 -40.643  1.00  0.00
ATOM    139  CG1 ILE    10     -13.167  22.603 -40.448  1.00  0.00
ATOM    140 HG12 ILE    10     -13.563  21.588 -40.404  1.00  0.00
ATOM    141 HG13 ILE    10     -12.348  22.642 -41.167  1.00  0.00
ATOM    142  CD1 ILE    10     -12.652  23.009 -39.067  1.00  0.00
ATOM    143 HD11 ILE    10     -13.470  22.970 -38.348  1.00  0.00
ATOM    144 HD12 ILE    10     -11.863  22.324 -38.757  1.00  0.00
ATOM    145 HD13 ILE    10     -12.255  24.023 -39.110  1.00  0.00
ATOM    146  C   ILE    10     -15.173  21.926 -42.614  1.00  0.00
ATOM    147  O   ILE    10     -16.368  21.785 -42.360  1.00  0.00
```

becomes
```
ATOM    129  N   ILE    10     -15.372  24.194 -43.088  1.00  0.00
ATOM    131  CA  ILE    10     -14.509  23.251 -42.446  1.00  0.00
ATOM    146  C   ILE    10     -15.173  21.926 -42.614  1.00  0.00
ATOM    147  O   ILE    10     -16.368  21.785 -42.360  1.00  0.00
```

Finally, to change the SNP residue, change the residue name (resname)
from ILE to LEU.
```
ATOM    129  N   LEU    10     -15.372  24.194 -43.088  1.00  0.00
ATOM    131  CA  LEU    10     -14.509  23.251 -42.446  1.00  0.00
ATOM    146  C   LEU    10     -15.173  21.926 -42.614  1.00  0.00
ATOM    147  O   LEU    10     -16.368  21.785 -42.360  1.00  0.00
```

Now you have what *LEaP* will see as a leucine, auto-filling the missing atoms. 
You can just leave the wonky non-sequential numbering, as *LEaP* also renumbers
everything when it runs.

{% include links.html %}
