---
title: EDA Plots by Residue
sidebar: Analysis_sidebar
permalink: Analysisguide-EDA-plots.html
folder: Analysis_guide
---

<link rel="stylesheet" href="css/theme-purple.css">

In an effort to quickly generate the EDA plots based on data that has already
been used in previous steps, `chimeraprint.sh` was written.
This script generates the files needed for difference images for by-residue
data that has been processed using
[`bashbyres.sh`](Analysisguide-EDA-Python.html##bashbyres-script) and using
the associated [paste](Analysisguide-EDA-Python.html##byresEDAplot) command to
create a combined data file.

## `chimeraprint.sh` {#print-script}
```bash
#!/bin/bash

## Define variables
## f will name your files, RESA is the first residue name, RESB is the second residue name
## g and h are dependent on the columns that the energy was found in the combined data used
## after doing "paste" on bashbyres.sh data files
f="SYSTEM-WT--MUT-A"
g=3 #Column with WT energy
h=7 #Column with MUT A energy
RESA="WT"
RESB="MUT-A"

## Coul
## Set up the information for Chimera
## Note: attribute cannot start with a capital letter
echo "#SYSTEM${RESA}SYSTEM${RESB}" > ${f}_EDA_coul_chimera.txt
echo "attribute: system${RESA}${RESB}coul" >> ${f}_EDA_coul_chimera.txt
echo "match mode: 1-to-1" >> ${f}_EDA_coul_chimera.txt
echo "recipient: residues" >> ${f}_EDA_coul_chimera.txt

## This will print the residue number ($2) and the difference in energy for $g and $h (specified above)
awk -v g=$g -v h=$h '{printf "\t:%-3s\t%-22s\n", $2, ($g - $h)}' combodata-coul-WT-res436.dat >> ${f}_EDA_coul_chimera.txt

## VDW
echo "#SYSTEM${RESA}SYSTEM${RESB}" > ${f}_EDA_vdw_chimera.txt
echo "attribute: system${RESA}${RESB}vdw" >> ${f}_EDA_vdw_chimera.txt
echo "match mode: 1-to-1" >> ${f}_EDA_vdw_chimera.txt
echo "recipient: residues" >> ${f}_EDA_vdw_chimera.txt

awk -v g=$g -v h=$h '{printf "\t:%-3s\t%-22s\n", $2, ($g - $h)}' combodata-vdw-WT-res436.dat >> ${f}_EDA_vdw_chimera.txt
```


{% include links.html %}
