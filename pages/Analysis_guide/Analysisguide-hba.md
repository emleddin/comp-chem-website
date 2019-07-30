---
title: "Hydrogen Bond Analysis (HBA)"
sidebar: Analysis_sidebar
permalink: Analysisguide-hba.html
folder: Analysis_guide
---

<link rel="stylesheet" href="css/theme-purple.css">

*cpptraj* can be used to determine how long hydrogen bonds are present in a
simulation using `hbond`.

Hydrogen bonds are a non-covalent structural force between a hydrogen atom and
a nitrogen, oxygen, or fluorine atom.
These hydrogen bonds arise because of the attraction between the hydrogen and
the electronegative atom.

The data provided in the `WT_protein_system_hbond_avg.dat` data file contains
the average length of simulation time that a hydrogen bond is present, defined
through a distance of 3.0 &#8491;.

Once those bonds have been singled out using *cpptraj*, then they can be
further assessed through a program like Excel or LibreOffice Calc, or through
scripting.
Open the data file in a spreadsheet, ensuring that you will not be modifying
the original `.dat` file.
The columns pertinent to analysis are __#Acceptor__ (the atom connected to the
accepting hydrogen), __Donor__ (the donating electronegative atom),
and __Frac__ (the fraction of the simulation that the bond is present for;
1 corresponds to 100%).
After deleting the irrelevant columns (__DonorH__, __Frames__, and __AvgDist__),
then you can sort the bonds by fraction, taking care to keep the donor and
acceptor columns matched.
Sorting by size allows for the removal of bonds that are unhelpful, which would
be anything occurring less than 1% (0.001) of the simulation time.
Delete those less than 0.001, and then sort the columns through
1. Alphabetically by __#Acceptor__
2. Alphabetically by __DonorH__
3. Numerically by __AvgDist__

All three options should be specified, because sometimes the hydrogen bond will
appear, dissappear, and reappear, all of which are not intrinsically recognized
through the averaging that *cpptraj* performs.

The actual analysis then has a few schools of thought.
The first, is that different acceptors and donors of the same residue type are
what you should be looking for, and thus you can take the sum of anything with
those two specific residues in those respective positions.
The other is that individual hydrogen bonds matter, and thus only things with
the exact same name in the two columns should be added together.
Overall, it depends on what goal is set for the analysis, or what argument that
is trying to be made.

After the determination is made between by residue or by hydrogen, then you can
begin comparison in whatever means you're going for.
If you're comparing the bonding between complex A and complex B, then you would
first sum all the relevant bonds in the individual complexes, before matching
line by line for specific residues/hydrogens.
Once the two complexes are matched, then you can take the difference, and color
or denote important changes in whatever manner makes sense in the spreadsheet.
As an example, I performed something like that in the
[table below](Analysisguide-hba.html#table), where green shown matches within
30%, red show major changes of over 30%, purple corresponded to residues in one
complex but not the other, and yellow corresponded to a residue that was
changed between complexes (the SNP position).

## Table: Example HBA Table {#table}
<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:black;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:black;}
.tg .tg-11bm{background-color:#fd6864;color:#000000;text-align:left;vertical-align:top}
.tg .tg-2ws5{background-color:#9698ed;color:#000000;text-align:left;vertical-align:top}
.tg .tg-096r{color:#000000;text-align:left;vertical-align:top}
.tg .tg-2tb3{background-color:#fcff2f;color:#000000;text-align:left;vertical-align:top}
.tg .tg-5qvc{background-color:#9aff99;color:#000000;text-align:left;vertical-align:top}
.tg .tg-f8tx{color:#000000;text-align:center;vertical-align:top}
</style>
<table class="tg">
  <tr>
    <th class="tg-f8tx" colspan="3">Complex A</th>
    <th class="tg-f8tx" colspan="3">Complex B</th>
  </tr>
  <tr>
    <td class="tg-096r">#Acceptor</td>
    <td class="tg-096r">Donor</td>
    <td class="tg-096r">Frac</td>
    <td class="tg-096r">#Acceptor</td>
    <td class="tg-096r">Donor</td>
    <td class="tg-096r">Frac</td>
  </tr>
  <tr>
    <td class="tg-5qvc">ALA_269@O</td>
    <td class="tg-5qvc">PHE_273@N</td>
    <td class="tg-5qvc">0.1748</td>
    <td class="tg-5qvc">ALA_269@O</td>
    <td class="tg-5qvc">PHE_273@N</td>
    <td class="tg-5qvc">0.1645</td>
  </tr>
  <tr>
    <td class="tg-2ws5">ALA_269@O</td>
    <td class="tg-2ws5">LEU_313@N</td>
    <td class="tg-2ws5">0.1748</td>
    <td class="tg-096r"></td>
    <td class="tg-096r"></td>
    <td class="tg-096r"></td>
  </tr>
  <tr>
    <td class="tg-11bm">ALA_356@O</td>
    <td class="tg-11bm">SER_312@N</td>
    <td class="tg-11bm">0.0324</td>
    <td class="tg-11bm">ALA_356@O</td>
    <td class="tg-11bm">SER_312@N</td>
    <td class="tg-11bm">0.6705</td>
  </tr>
  <tr>
    <td class="tg-2tb3">ALA_356@O</td>
    <td class="tg-2tb3">SER_360@N</td>
    <td class="tg-2tb3">0.5218</td>
    <td class="tg-2tb3">ALA_356@O</td>
    <td class="tg-2tb3">SER_360@N</td>
    <td class="tg-2tb3">0.7717</td>
  </tr>
</table>

## HBA Averaging with R {#HBA-w-R}

As previously mentioned, the data that comes out of *cpptraj* can contain lines
that have the same hydrogen bond for different lengths of time, and these need
to be summed.
This can be a tedious process, and also makes it difficult to average across
simulations, since they may or may not have the exact same bonds.
R is powerful enough to deal with this, and can thus be used to tidy up and
average hydrogen bonding data for a simulation.

<u> rmagic-hbond-avg-stringfix.r </u>
```R
## Run this with "Rscript rmagic-hbond-avg-stringfix.r"
## (Assuming you've already installed R...)

#-----------------------------------------------#
#--Specify the paths to the Files from cpptraj--#
#-----------------------------------------------#

## This script has been pre-built for a system with 3 replicates
## More or less than 3 reps (up to 5) can be achieved through
## Commenting or uncommenting

## Paths to the Hbond-avg files
## Set A (system 1)
infile1A <- Sys.glob("/absolute/path/to/the/analysis/files/for/WT-System-1/WT_protein_system_hbond_avg.dat")
infile2A <- Sys.glob("/absolute/path/to/the/analysis/files/for/WT-System-2/WT_protein_system_hbond_avg.dat")
infile3A <- Sys.glob("/absolute/path/to/the/analysis/files/for/WT-System-3/WT_protein_system_hbond_avg.dat")
#infile4A <- Sys.glob("/absolute/path/to/the/analysis/files/for/WT-System-4/WT_protein_system_hbond_avg.dat")
#infile5A <- Sys.glob("/absolute/path/to/the/analysis/files/for/WT-System-5/WT_protein_system_hbond_avg.dat")

#-----------------------------#
#--Define your outfile names--#
#-----------------------------#

## A is for infiles labeled A
## Each system gets an averaged file
## That is then used with the H bond analysis script

A_avg <- "/absolute/path/to/the/averaged/file/WT-System_total_hbond_avg_fs_double.dat"

## Explicitly set the number of the SNP/changed residue to match
## This uses a regex to match with any characters before the _
## So ABC_100@O would become Changed_ResA@O
## Therefore you won't miss things at an atom-level by computing the residue
fix_stringA <- ".*_100"
fixed_stringA <-"Changed_ResA"

fix_stringB <- ".*_200"
fixed_stringB <-"Changed_ResB"

## How many data sets to add (use 4 after decimal)
sets <- 3.0000
#sets <- 5.0000

#----------------------------------------------------------------------#
#---------Behind the Curtain: No Need to Modify Past This Line---------#
#----------------------------------------------------------------------#

## Use the data tables package to read in data frames
## Remove comment to install locally
#install.packages("data.table")
library(data.table)

## Use the tidyverse package to perform string replacement
## Remove comment to install locally
#install.packages("tidyverse")
library(tidyverse)

## Turn off scientific notation
options(scipen = 999)

#-------------------------#
#--Read in Hbond Scripts--#
#-------------------------#

## Reading each file as a data.table.
## Bonus - fread is much faster than read.csv
read1A <- fread(infile1A, header=TRUE)
read2A <- fread(infile2A, header=TRUE)
read3A <- fread(infile3A, header=TRUE)
#read4A <- fread(infile4A, header=TRUE)
#read5A <- fread(infile5A, header=TRUE)

colnames(read1A) <- c("Acceptor", "DonorH", "Donor", "Frames", "Frac", "AvgDist", "AvgAng")
colnames(read2A) <- c("Acceptor", "DonorH", "Donor", "Frames", "Frac", "AvgDist", "AvgAng")
colnames(read3A) <- c("Acceptor", "DonorH", "Donor", "Frames", "Frac", "AvgDist", "AvgAng")
#colnames(read4A) <- c("Acceptor", "DonorH", "Donor", "Frames", "Frac", "AvgDist", "AvgAng")
#colnames(read5A) <- c("Acceptor", "DonorH", "Donor", "Frames", "Frac", "AvgDist", "AvgAng")

## Combine all the datasets into 1
bound <- rbind(read1A, read2A, read3A)
#bound <- rbind(read1A, read2A, read3A, read4A, read5A)

bound$Acceptor <- as.character(bound$Acceptor)
bound$DonorH <- as.character(bound$DonorH)
bound$Donor <- as.character(bound$Donor)
bound$Frac <- as.numeric(bound$Frac)
bound$Frames <- as.numeric(bound$Frames)
bound$AvgDist <- as.numeric(bound$AvgDist)
bound$AvgAng <- as.numeric(bound$AvgAng)

## Deal with the string
clean_boundA <- mutate_if(bound, is.character, str_replace_all, pattern=fix_stringA, replacement=fixed_stringA)

## Deal with the other string
clean_boundB <- mutate_if(clean_boundA, is.character, str_replace_all, pattern=fix_stringB, replacement=fixed_stringB)

## Collapse repeat lines into themselves (i.e. add numbers together)
superbound <- aggregate(data=clean_boundB, cbind(Frames,Frac,AvgDist,AvgAng)~Acceptor+Donor, FUN=sum)

## If DonorH matters, then use:
#superbound2 <- aggregate(data=bound, cbind(Frames,Frac,AvgDist,AvgAng)~Acceptor+DonorH+Donor, FUN=sum)

## Get average based on number of sets combined [This if for 3]
superbound$AvgFrame <- format(superbound$Frames / sets, digits=4, format="f")
superbound$AvgFrac <- format(superbound$Frac / sets, digits=4, format="f")
superbound$AAvgDist <- format(superbound$AvgDist / sets, digits=4, format="f")
superbound$AAvgAng <- format(superbound$AvgAng / sets, digits=4, format="f")

save_cols_AH <- superbound[,c("Acceptor", "Donor", "AvgFrac")]

## Limit to 4 sig figs after decimal
save_cols_clean_AH <- format(save_cols_AH, digits=4)

colnames(save_cols_clean_AH) <- c("Acceptor", "Donor     ", "AvgFrac")

## Now write a tab-delimited outfile!
## Don't care about the index rownames
#write.table(save_cols_clean_AH, file = A_avg, sep="\t", row.names=FALSE, quote=FALSE)

## Write a pseudo-fixed width outfile
capture.output( print(save_cols_clean_AH, print.gap=3, row.names=FALSE), file = A_avg)
```

From here, you can use the HBA shell script.
It won't have the listed issue of only being effective on single trials
(since you just averaged them &#x1F603;).

## HBA: the Shell Script
As you can already tell, HBA is... tedious.
So, it's been semi-scripted to identify what may be key residues between two
systems.
When using the following script as a stand-alone (and not using the
[previous R script](Analysisguide-hba.html#HBA-w-R) with it), here are a few
points of caution:

* Situations where it'll work effectively:
  * Comparing single trials of 2 systems
  * Comparing the averages of 2 systems that have already been finagled together
   correctly.
* Situations where there's still some work that needs to be done:
  * Adapting it to get the average of 3 systems to be used in the comparison of
    2 averaged systems

There was a lot of talk about averages in there.
Averages are important, because they make your argument stronger.
If one system had bond A for 90% of the time while B had it 2% of the time in
trial one, but those are reversed in trial two, you can't actually say that
bond is important without other structural information (like, per se, your
entire active site being torn to shreds in trial 2, but it being perfectly
intact in trial one).
For now, the "smart" way to get the average would be to follow this set of
things with Excel or Libre Office:
1. Open data A trial 1 in sheet alpha.
2. Copy data A trial 2 to sheet alpha, next to trial 1.
3. Repeat for remaining data A.
4. Insert/delete cells until each row of sheet alpha has matching information.
Blank cells are ok! The words need to be the same.
5. Copy all of the names to one cell column in sheet alpha.
6. Compute the averages in a different cell column [ex: ($A3 + $A6 + $A9)/3]
and copy that formula through for all.
7. Create a new set of columns that are equal to the named column and the
average columns. [ex. In cell A12, do =A1; in cell A13, do =A10].
8. Copy those two columns into a text file and save. Now you have the averages
for one data set!
9. Repeat all of those steps with data B.
10. Run the script with the averages of data A and B! Congratulations on HBA!

If you've used the [R script](Analysisguide-hba.html#HBA-w-R), however, you
don't need to worry about all of that! Hooray!
And now, without further ado:

## hbond-analysis.sh {#hbond-sh}
```bash
#!/bin/bash

##########################################
##        Define your 2 datasets        ##
##      Your h-bond optional cutoff     ##
##         And your outfile name        ##
##########################################

## What two sets are you comparing?
infileA=TET_hedi_5mdC_hbond_avg_WTagain.dat
infileB=TET_5mC_RNA_hbond_avg.dat

## List cutoff as a percentage (20 is 20%)
cutoff=20

## Tag of differences for outfiles
filename=TET-5mdC-5mC-hbond-avg
setA=TET-hedi-5mdC
setB=TET-5mC-RNA

##########################################
##         Predefined variables         ##
##########################################

## You can change the file names, but
## it'll be annoying to change the variables

outfile1A=hbond-clean-1A.tmp
outfile2A=hbond-clean-2A.tmp
outfile3A=hbond-clean-3A.tmp

outfile1B=hbond-clean-1B.tmp
outfile2B=hbond-clean-2B.tmp
outfile3B=hbond-clean-3B.tmp

outfile4AB=hbond-clean-4AB.tmp
outfile5A=hbond-clean-5A.tmp
outfile5B=hbond-clean-5B.tmp
outfile6AB=hbond-clean-6AB.tmp
outfile7AB=hbond-clean-7AB.tmp
outfile8AB=hbond-clean-8AB.tmp
outfile9AB=hbond-clean-9AB.tmp
outfile10AB=$filename-abs-diff.dat

outfile11A=hbond-clean-11A.tmp
outfile11B=hbond-clean-11B.tmp
outfile12A=hbond-clean-12A.tmp
outfile12B=hbond-clean-12B.tmp

##########################################
##              Fileset A               ##
##  Make some files; do some analysis   ##
##########################################

## Clean the data. Remove lines less than
## 1% and print file with the
## 3 columns you want; keep header
## 1=Acceptor 3=Donor 5=Frac

awk 'NR == 1 {print $1,$3,$5}; NR > 1 { if ($5>0.0099) print $1, $3, $5 }' $infileA > $outfile1A

## Sum duplicate acceptor/donor columns

awk 'NR == 1; {s1[$1,$2] = $1; s2[$1,$2] = $2; s3[$1,$2] += $3} END { for (i in s3) print s1[i], s2[i], s3[i]}' $outfile1A > $outfile2A

## Clean up the output. Make alphabetical order
## by acceptor then by donor and print that
## in clean columns (with left-aligned AAs)

sort $outfile2A | awk '{ printf "%-15s %-15s %8s\n", $1, $2, $3 }' > $outfile3A

##########################################
##              Fileset B               ##
##  Make some files; do some analysis   ##
##########################################

## Clean the data. Remove lines less than
## 1% and print file with the
## 3 columns you want; keep header
## 1=Acceptor 3=Donor 5=Frac

awk 'NR == 1 {print $1,$3,$5}; NR > 1 { if ($5>0.0099) print $1, $3, $5 }' $infileB > $outfile1B

## Sum duplicate acceptor/donor columns

awk 'NR == 1; {s1[$1,$2] = $1; s2[$1,$2] = $2; s3[$1,$2] += $3} END { for (i in s3) print s1[i], s2[i], s3[i]}' $outfile1B > $outfile2B

## Clean up the output. Make alphabetical order
## by acceptor then by donor and print that
## in clean columns (with left-aligned AAs)

sort $outfile2B | awk '{ printf "%-15s %-15s %8s\n", $1, $2, $3 }' > $outfile3B

##########################################
##           Comparison Time            ##
##      How different are A and B?      ##
##########################################

## Get a list of things with matching Acceptor
## and Donor columns between the files

awk 'FNR==NR{a[$1,$2];next} (($1,$2) in a)' $outfile3A $outfile3B | awk '{printf "%-15s %-15s\n", $1, $2}' > $outfile4AB

## Get rows with the matches from A & B

awk 'FNR==NR{a[$1,$2];next} (($1,$2) in a)' $outfile4AB $outfile3A > $outfile5A
awk 'FNR==NR{a[$1,$2];next} (($1,$2) in a)' $outfile4AB $outfile3B > $outfile5B

## Print a single file for comparison
## 1=Acceptor 2=Donor 3=A_Frac 6=B_Frac

paste $outfile5A $outfile5B > $outfile6AB

## Get the difference and print it

awk 'NR == 1 { print $1 "\t" $2 "\t\t" "Diff_A-B" }; NR>1, NF > 0 { print $1 "\t" $2 "\t" ($6 - $3) }' $outfile6AB > $outfile7AB
(head -n 1 $outfile7AB && tail -n +3 $outfile7AB | cat ) > $filename-diff.dat

## Give it as absolute difference

awk '{ printf "%-15s %-15s %8s\n", $1, $2, ($3 >=0) ? $3 : 0 - $3}' $outfile7AB > $outfile8AB

## Sort the file,
## keeping the header

(head -n 1 $outfile8AB && tail -n +3 $outfile8AB | sort -Rk 3nr ) > $outfile9AB

## Show the difference as a percentage,
## keeping the header

awk 'NR == 1 { print $1 "\t" $2 "\t\t" "AbsDiff%" }; NR>1, NF > 0 { printf "%-15s %-15s %8s\n", $1, $2, $3*100 }' $outfile9AB > $outfile10AB

## Get the cutoff file

awk -v f=$cutoff 'NR == 1; NR > 1 {if ($3> f ) print}' $outfile10AB > $filename-$cutoff-percent-cut.dat

##########################################
##             No Match List            ##
##  No match between A&B?  No problem.  ##
##########################################

## Get full list of no matches
awk 'NR==FNR{a[$1,$2];next} !(($1,$2) in a)' $outfile4AB $outfile3A > $outfile11A
awk 'NR==FNR{a[$1,$2];next} !(($1,$2) in a)' $outfile4AB $outfile3B > $outfile11B


## Print the no matches larger than cutoff
## giving it a header

awk -v f=$cutoff 'NR == 1; NR > 1 {if ( (100*$3) > f ) print}' $outfile11A > $outfile12A
awk -v f=$cutoff 'NR == 1; NR > 1 {if ( (100*$3) > f ) print}' $outfile11B > $outfile12B

## Clean the output and give the files

awk 'NR == 1 { print "#Acceptor" "\t" "Donor" "\t\t" "AbsDiff%" }; NR > 1, NF > 0 { printf "%-15s %-15s %8s\n", $1, $2, $3*100 }' $outfile12A > $setA-$cutoff-percent-cut-nomatch.dat
awk 'NR == 1 { print "#Acceptor" "\t" "Donor" "\t\t" "AbsDiff%" }; NR > 1, NF > 0 { printf "%-15s %-15s %8s\n", $1, $2, $3*100 }' $outfile12B > $setB-$cutoff-percent-cut-nomatch.dat


## Remove the temporary data files
rm hbond-clean*.tmp
```

In using this script, you set a cutoff of difference between A and B.
Like before, 20% is considered significant, with bigger differences being
important.
You'll get three important outfiles--the information with anything exceeding
the cutoff, and files with bonds that aren't matched between the two systems.


{% include links.html %}
