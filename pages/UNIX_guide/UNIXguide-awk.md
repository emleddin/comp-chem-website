---
title:
sidebar: UNIX_guide_sidebar
permalink: UNIXguide-awk.html
folder: UNIX_guide
---

The `awk` language is useful for whittling down data from a mega-file to a more
manageable file.
Basically, instead of columns A-Z with different information, you could select
out which letters would be of importance to you.
The command can even be used to select values greater than or less than
different cutoffs, which can make data analysis faster.
The information shown below is from a complete file with 24,525 rows of data.
```bash
 CHR             SNP   A1   A2          MAF  NCHROBS
  21      kgp2850918    C    A      0.03691      298
  21      kgp4753447    A    G      0.03716      296
  21      kgp6829524    A    G      0.06419      296
  21     kgp13210339    A    C      0.05667      300
  21     kgp10927414    A    G      0.06419      296
  21     kgp10658468    A    G      0.06667      300
  21      rs10439884    A    G         0.08      300
```
Using `awk` can select MAF values from a specific cutoff.
In the awk line below, the header is printed through `NR == 1` (NR stands for
    number of records; NF would stand for number of fields and refer to
    columns), and the remaining data is sorted through column 5 (`$5`) to
    select out values below 0.05.
Then, a new file is created using `>` with the new file name specified.
```bash
$ awk  'NR == 1; NR > 1 {if ($5<0.05) print}' plink.frq > plinkawk.frq
```
The new opening lines of this now 350 row file are:
```bash
 CHR             SNP   A1   A2          MAF  NCHROBS
  21      kgp2850918    C    A      0.03691      298
  21      kgp4753447    A    G      0.03716      296
  21      kgp5439554    A    G      0.04667      300
  21      kgp9921880    G    A      0.04333      300
  21     kgp13121553    G    A         0.03      300
  21      kgp1799905    A    G      0.04667      300
  21      kgp4273039    A    C       0.0473      296
```
If, for example, you only wanted to print four specific columns of information
to the Terminal (and not a separate file), a command like
```bash
$ awk  '{print $1, $2, $3, $9}' mega_data_set.dat
```
could be used.

{% include links.html %}
