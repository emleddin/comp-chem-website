---
title: Cpptraj
sidebar: Analysis_sidebar
permalink: Analysisguide-cpptraj.html
folder: Analysis_guide
---

<link rel="stylesheet" href="css/theme-purple.css">

*Cpptraj* is a useful data analysis tool for AMBER simulations.
Detailed information about it can be found in the
[AMBER manual](http://ambermd.org/doc12/Amber19.pdf).
*Cpptraj* can be used to strip the waters from the simulation and autoimage
(center) the protein.

Since *cpptraj* is a program in AMBER, to run it, you would use a command like:
```bash
$ $AMBERHOME/bin/cpptraj -p WT_protein_system_wat.prmtop -i cpptraj_strip.in
```
The `-p` flag specifies that a prmtop file is being read in, and the
`-i` flag specifies your input file.
Using *cpptraj* in this manner is known as using it in batch mode.

You can also run *cpptraj* without an input file. In that case, you would start
with either
```bash
$ AMBERHOME/bin/cpptraj
cpptraj > parm WT_protein_system_wat.prmtop
```
or
```bash
$ $AMBERHOME/bin/cpptraj -p WT_protein_system_wat.prmtop
```
and follow through the list of commands line-by-line from your input file.
Using *cpptraj* in this manner is helpful when trying to test analysis commands
(because *cpptraj* is... finicky and the syntax can be easily messed up).

The following is an example input file which would strip and autoimage the
first five trajectory files (with the `mdcrd` extension;
this could also be `nc` depending on your scripted commands) and then write out
a comprehensive NetCDF file with the information of the five trajectory files
(i.e `cpptraj_strip.in`).

## `cpptraj_strip.in`
```
reference WT_protein_system_wat_init0.rst
trajin WT_protein_system_wat_md1.mdcrd
trajin WT_protein_system_wat_md2.mdcrd
trajin WT_protein_system_wat_md3.mdcrd
trajin WT_protein_system_wat_md4.mdcrd
trajin WT_protein_system_wat_md5.mdcrd

autoimage
strip :WAT,K+

trajout WT_protein_system_1-5.nc cdf
```

It is important to note that if your system originally included waters that the
strip command you use should be like `strip :WAT,K+ outprefix strip nobox`.
The `outprefix strip nobox` part writes a new parmtop file that, following the
current example naming scheme, would be `strip.WT_protein_system_wat.prmtop`.
Without this part of the command, you'll need to use
[<i>parmed</i>](Analysisguide-parmed.html) to strip the topology file, so that
your imaged trajectory doesn't look like an angry sea urchin in VMD.

Now that a simulation has been processed, *cpptraj* can be used to gather a lot
of different trajectory information, such as hydrogen bonds, normal modes,
distance between residues, root mean square deviation (RMSD), and root mean
square fluctuations (RMSF).

The command used to run *cpptraj* now should use a stripped prmtop file, which
would have been the prmtop that you saved prior to solvation (or the newly
created stripped prmtop).
```
$ AMBERHOME/bin/cpptraj -p WT_protein_system_vac.prmtop -i cpptraj_analysis.in
```

An example incorporating several types of analysis is `cpptraj_analysis.in`.

## `cpptraj_analysis.in`
```
trajin WT_protein_system_1-5.nc

autoimage

rms first out test_rms.dat :1-476 byres

## For correlation matrix
matrix out WT_protein_system_matrix_correl.dat name corr_mat \
 byres :1-476 correl

## For normal modes (evecs = eigenvectors)
matrix out WT_protein_system_covar_mat.dat name norm_mode :1-476@CA,P,C4',C2 covar
diagmatrix norm_mode out WT_protein_system_evecs.out vecs 100 reduce \
 nmwiz nmwizvecs 100 nmwizfile WT_protein_system_100.nmd nmwizmask :1-476@CA,P,C4',C2

hbond out WT_protein_system_hbond.dat dist 3.0 avgout \
   WT_protein_system_hbond_avg.dat

rms first out WT_protein_system_total_bb_rms.dat :1-476@CA,P,O3',O5',C3',C4',C5'

rmsd :1-476 first perres perresavg range 1-476 perresout \
   WT_protein_system_rmsd_byres.dat

atomicfluct :1-476 out WT_protein_system_rmsf_byres.dat byres

distance :476@PA :457@O3' out dist_PO_WT_protein_system.dat
```
The `:1-476` atom mask is specifying that these processes are run on all of the
476 system residues.
`hbond` extracts out the time hydrogen binds are present,
`rmsd` finds the RMSD (shocker!),
`atomicfluct` finds the RMSF, and `dist` determines
the distance between two specified atoms throughout the simulation.
The `\` symbols signify a line continuation for those specific commands.

{% include links.html %}
