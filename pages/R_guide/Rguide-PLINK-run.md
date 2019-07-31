---
title: PLINK Run Information
sidebar: Rguide_sidebar
permalink: Rguide-PLINK-run.html
folder: R_guide
---

<link rel="stylesheet" href="css/theme-pink.css">

Some of the summary statistics that PLINK can generate
(through different commands) include missing genotype rate (missingness),
Hardy-Weinberg equilibrium, minor allele frequency, and linkage disequilibrium.
There are many more things PLINK can do
(including family-based association testing for disease traits),
which are all further described on the
[PLINK website](http://zzz.bwh.harvard.edu/plink/).

## PLINK Job Script {#job-script}
The following script would run the PLINK commands found in the `plink_frq` file
on a SLURM scheduler.
```bash
#!/bin/bash
#SBATCH -p public              # partition aka allocation
#SBATCH --qos general          # quality-of-service (priority)

module load  plink/1.07

./plink_frq
```
If you get an error code, try `source plink_frq` instead of `./plink_frq`.
The error dependent on where you're sourcing the file from.

## Tests {#tests}
A sample PLINK information file, `plink_frq`, specifying what PLINK needs to
run to test for minor allele frequency (MAF) is below.
```bash
# no web stops PLINK from updating before run;
# path needs to include folder and the name for the ped and map
plink --noweb --file /path/to/PED/and/MAP/files \
      --nonfounders \ # all individuals included
      --allow-no-sex \ # prevents setting phenotypes with "ambiguous" sex to missing
      --freq # actual test
```

Where the actual test is will be changed for each different test.
If the path were `~/home/euid123/R_jobs/` and the `.ped` and `.map` were both
named example, then the line would be `~/home/euid123/R_jobs/example \`.

## Table: Test specifics for PLINK {#table}

| Specifier            | Test or Function            | Test Statistic |
| -------------------- | --------------------------- | -------------- |
| `--freq`             | Minor Allele Frequency      | MAF            |
| `--het`              | Heterozygosity              | F Value        |
| `--hardy`            | Hardy Weinberg Equilibrium  | HWE            |
| `--r2`               | Linkage Disequilibrium      | r<sup>2</sup>  |
| `--out snps`         | Linkage Disequilibrium      | r<sup>2</sup>  |
| `--missing --mind 1` | Missingness                 | F\_MISS        |
| `--recodeAD`         | Recode                      | NA             |

* __Frequency__: test for minor allele frequency.
* __Heterozygosity__: test for inbreeding coefficients.
* __Hardy-Weinberg Equilibrium__: test for Hardy-Weinberg equilibrium.
* __Linkage Disequilibrium__: test for linkage disequilibrium.
* __Missingness__: test for missingness.
* __Recode__: change data coding to additive and dominance components.

## Using awk on Data {#awk}

The `awk` [Unix command](UNIXguide-awk.html) can be used to parse out
specified data.
The following command would create the `plinkawk.frq` file from the generated
`plink.frq` file, preserving the header, for values in column 5 that are less
than 0.05.
```bash
awk 'NR == 1; NR > 1 {if ($5<0.05) print}' plink.frq > plinkawk.frq
```

{% include links.html %}
