---
title: PLINK Data Files
sidebar: Rguide_sidebar
permalink: Rguide-PLINK-data.html
folder: R_guide
---

<link rel="stylesheet" href="css/theme-pink.css">

[PLINK](http://zzz.bwh.harvard.edu/plink/) is a free computational package that
can be used for genome association analyses.

Data for PLINK should be in PED and MAP files.
PED files are space or tab delimited files, and need to start with the
following 6 columns: `Family ID, Individual ID, Maternal ID, Paternal ID, Sex,`
and `Phenotype`.
Sex should be coded with 1=male; 2=female; and any other value meaning unknown.
MAP files describe markers, and should contain only four columns: `chromosome`
(1-22, X, Y, or 0 if unplaced), `rs\# or SNP ID`, `Genetic distance`
(in the morgan unit), and `Base-pair position` (bp units).

There is more information about these file types on the
[PLINK website](http://zzz.bwh.harvard.edu/plink/).

{% include links.html %}
