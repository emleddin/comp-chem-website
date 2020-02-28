---
title: "Fast NMA (ft. cpptraj and Python)"
sidebar: Analysis_sidebar
permalink: /Analysisguide-cpptraj-NMA.html
folder: Analysis_guide
---

The NMD file can be prepared for use with ProDy using *cpptraj*.
How cool is that?

First, you need to create a covariance matrix using the `matrix` command.
Covariance is a fancy way to say that you're looking for the overall change in
A with respect to B, B with respect to C, and so on.
In this case, we're trying to reduce down multi-dimensional coordinate data
and then compare each of the residues to each other.

After creating the matrix, use the `diagmatrix` command to calculate the
eigenvectors of the matrix and generate the NMWiz files.

```
## For normal modes (evecs = eigenvectors)
matrix out WT_protein_system_covar_mat.dat name norm_mode :1-476@CA,P,C4',C2 covar
diagmatrix norm_mode out WT_protein_system_evecs.out vecs 100 reduce \
 nmwiz nmwizvecs 100 nmwizfile WT_protein_system_100.nmd nmwizmask :1-476@CA,P,C4',C2
```

The mask used above (`@CA,P,C4',C2`) is based on what the ProDy interface in
VMD uses (`protein and name CA or nucleic and name P C4' C2`) by default.

Python can be used to make the mobility plots that became the
[normal mode plots](Analysisguide-determine-normal-modes.html) that
we got to know and love with gnuplot.
Future Mark will share a script for that on
his [GitHub](https://github.com/markahix/Basic-Scripts).

{% include note.html content="This is a note." %}
