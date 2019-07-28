---
title: Matrix Correlation Information
sidebar: Analysis_sidebar
permalink: Analysisguide-mat-corr-Chimera.html
folder: Analysis_guide
---

<link rel="stylesheet" href="css/theme-purple.css">

Once the *cpptraj* matrix correlation data has been processed with
[the matrix correlation Python script](Analysisguide-correlational.html),
a list of values corresponding to each line in the protein is generated.
That file is literally just lines of numbers, and is not ready for use in 
Chimera attribute mapping without some finagling.
Behold: `matcor-chimera-numbers.sh`.
Instead of individually pasting numbers and adding attribute lines multiple
times over for every system you wish to plot, you can change a few lines in the
script and generate the numeric lists a little easier.

## `matcor-chimera-numbers.sh` {#script}
```bash
#!/bin/bash

## Define variables
## f will name your files, RESA is the first residue name, RESB is the
## second residue name, and INFILE is the file created when making the
## correlation plots when using the Python script
f="SYSTEM"
RESA="WT"
RESB="MUTA"
INFILE='/path/to/file/created/by/matr_corr.py'

## Find number of lines in generated matrix value (i.e. number of residues)
## And paste those numbers and data together into one file
a=$(wc $INFILE)
LC=$(echo $a|cut -d' ' -f1)
seq 1 $LC > ${f}-numbers.txt
paste ${f}-numbers.txt $INFILE > ${f}-pastenumbers.txt

## Set up information for Chimera attribues
## Note: attribute cannot start with a capital letter
echo "#SYSTEM${RESA}SYSTEM${RESB}" > ${f}_mc_chimera.txt
echo "attribute: system${RESA}${RESB}mc" >> ${f}_mc_chimera.txt
echo "match mode: 1-to-1" >> ${f}_mc_chimera.txt
echo "recipient: residues" >> ${f}_mc_chimera.txt

## This will print the formatted residue number and value
awk '{printf "\t:%-3s\t%-5s\n", $1, $2}' ${f}-pastenumbers.txt >> ${f}_mc_chimera.txt

## Remove the lists of numbers generated with paste
rm ${f}-numbers.txt
rm ${f}-pastenumbers.txt
```

{% include links.html %}
