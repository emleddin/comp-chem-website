---
title: "Plotting Averages for RMSD (etc.) using R and gnuplot"
sidebar: Analysis_sidebar
permalink: Analysisguide-plotting-RMSD-averages.html
folder: Analysis_guide
---

<link rel="stylesheet" href="css/theme-purple.css">

Like in [previous section](Analysisguide-plotting-RMSD.html), you can plot the
averages of multiple simulations.
You can also use gnuplot to shade in the standard deviation of these averages,
but only once you've processed the data appropriately.
Therefore, a script using the
[programming language R](https://cran.r-project.org/mirrors.html) has been
created to properly get averages and standard deviations for plotting with
gnuplot.
Once R has been installed on your computer, then you would run the script with
```bash
$ Rscript r-magic-rmsd-rmsf-hbond-5.r
```

If this is your first time installing R, however, then you'll also need to
install the packages that the script needs.
These have been commented out in the provided script, but you can also just do
it before running the script by entering the R environment like:
```R
$ R
> install.packages("data.table")
> install.packages("abind")
> quit()
Save workspace image? [y/n/c]: n
```

The averaging script has been built for 2 systems with 3 replicates, but
sometimes you only need averages for one system, and sometimes you have more
(or less!) than 3 replicates.
So, the framework for up to 5 replicates has been created using comments,
and you should modify the script accordingly.
Also, it is important to use absolute paths for the script, so no tildes in
place of `/username/home`!
##  rmagic-rmsd-rmsf-hbond-5.r
```R
## Run this with "Rscript rmagic-rmsd-rmsf-hbond-5.r"
## (Assuming you've already installed R...)

#-----------------------------------------------#
#--Specify the paths to the Files from cpptraj--#
#-----------------------------------------------#

## This script has been pre-built for 2 systems with 3 replicates
## More or less than 3 reps (up to 5) can be achieved through
## Commenting or uncommenting

## Paths to the RMSD files
## Set A (system 1)
infile1A <- Sys.glob("/absolute/path/to/the/analysis/files/for/ WT-System-1/WT_protein_system_total_bb_rms.dat")
infile2A <- Sys.glob("/absolute/path/to/the/analysis/files/for/ WT-System-2/WT_protein_system_total_bb_rms.dat")
infile3A <- Sys.glob("/absolute/path/to/the/analysis/files/for/ WT-System-3/WT_protein_system_total_bb_rms.dat")
#infile4A <- Sys.glob("/absolute/path/to/the/analysis/files/for/ WT-System-4/WT_protein_system_total_bb_rms.dat")
#infile5A <- Sys.glob("/absolute/path/to/the/analysis/files/for/ WT-System-5/WT_protein_system_total_bb_rms.dat")

##Set B (system 2)
infile1B <- Sys.glob("/absolute/path/to/the/analysis/files/for/ MUT-A-System-1/MUT_A_system_total_bb_rms.dat")
infile2B <- Sys.glob("/absolute/path/to/the/analysis/files/for/ MUT-A-System-2/MUT_A_system_total_bb_rms.dat")
infile3B <- Sys.glob("/absolute/path/to/the/analysis/files/for/ MUT-A-System-3/MUT_A_system_total_bb_rms.dat")
#infile4B <- Sys.glob("/absolute/path/to/the/analysis/files/for/ MUT-A-System-4/MUT_A_system_total_bb_rms.dat")
#infile5B <- Sys.glob("/absolute/path/to/the/analysis/files/for/ MUT-A-System-5/MUT_A_system_total_bb_rms.dat")

## Paths to the RMSF files
## Set A (system 1)
infile1AF <- Sys.glob("/absolute/path/to/the/analysis/files/for/ WT-System-1/WT_protein_system_rmsf_byres.dat")
infile2AF <- Sys.glob("/absolute/path/to/the/analysis/files/for/ WT-System-2/WT_protein_system_rmsf_byres.dat")
infile3AF <- Sys.glob("/absolute/path/to/the/analysis/files/for/ WT-System-3/WT_protein_system_rmsf_byres.dat")
#infile4AF <- Sys.glob("/absolute/path/to/the/analysis/files/for/ WT-System-4/WT_protein_system_rmsf_byres.dat")
#infile5AF <- Sys.glob("/absolute/path/to/the/analysis/files/for/ WT-System-5/WT_protein_system_rmsf_byres.dat")

infile1BF <- Sys.glob("/absolute/path/to/the/analysis/files/for/ MUT-A-System-1/MUT_A_system_rmsf_byres.dat")
infile2BF <- Sys.glob("/absolute/path/to/the/analysis/files/for/ MUT-A-System-2/MUT_A_system_rmsf_byres.dat")
infile3BF <- Sys.glob("/absolute/path/to/the/analysis/files/for/ MUT-A-System-3/MUT_A_system_rmsf_byres.dat")
#infile4BF <- Sys.glob("/absolute/path/to/the/analysis/files/for/ MUT-A-System-4/MUT_A_system_rmsf_byres.dat")
#infile5BF <- Sys.glob("/absolute/path/to/the/analysis/files/for/ MUT-A-System-5/MUT_A_system_rmsf_byres.dat")

## Paths to the H-Bond files
## Set A (system 1)
infile1AH <- Sys.glob("/absolute/path/to/the/analysis/files/for/ WT-System-1/WT_protein_system_hbond.dat")
infile2AH <- Sys.glob("/absolute/path/to/the/analysis/files/for/ WT-System-2/WT_protein_system_hbond.dat")
infile3AH <- Sys.glob("/absolute/path/to/the/analysis/files/for/ WT-System-3/WT_protein_system_hbond.dat")
#infile4AH <- Sys.glob("/absolute/path/to/the/analysis/files/for/ WT-System-4/WT_protein_system_hbond.dat")
#infile5AH <- Sys.glob("/absolute/path/to/the/analysis/files/for/ WT-System-5/WT_protein_system_hbond.dat")

##Set B (system 2)
infile1BH <- Sys.glob("/absolute/path/to/the/analysis/files/for/ MUT-A-System-1/MUT_A_system_hbond.dat")
infile2BH <- Sys.glob("/absolute/path/to/the/analysis/files/for/ MUT-A-System-2/MUT_A_system_hbond.dat")
infile3BH <- Sys.glob("/absolute/path/to/the/analysis/files/for/ MUT-A-System-3/MUT_A_system_hbond.dat")
#infile4BH <- Sys.glob("/absolute/path/to/the/analysis/files/for/ MUT-A-System-4/MUT_A_system_hbond.dat")
#infile5BH <- Sys.glob("/absolute/path/to/the/analysis/files/for/ MUT-A-System-5/MUT_A_system_hbond.dat")

#-----------------------------#
#--Define your outfile names--#
#-----------------------------#

## A is for infiles labeled A
## Each system gets an averaged file
## That is then used to plot with gnuplot
RMSDA <- "WT_protein_system_total_bb_rms_avgd.dat"
RMSDB <- "MUT_A_system_total_bb_rms_avgd.dat"

RMSFA <- "WT_protein_system_rmsf_byres_avgd.dat"
RMSFB <- "MUT_A_system_rmsf_byres_avgd.dat"

HBONDA <- "WT_protein_system_hbond_3trial_avgd.dat"
HBONDB <- "MUT_A_system_hbond_3trial_avgd.dat"

#-------------------------------------------------------------------#
#-------Behind the Curtain: No Need to Modify Past This Line-------#
#-------------------------------------------------------------------#

## Use the data tables package to read in data frames
## Remove comment to install locally
#install.packages("data.table")
library(data.table)

## Use the abind package to combine data frames
## Remove comment to install locally
#install.packages("abind")
library(abind)

#-------------------#
#--Begin with RMSD--#
#-------------------#

## Reading each file as a data.table.
## Bonus - fread is much faster than read.csv
read1A <- fread(infile1A, header=TRUE)
read2A <- fread(infile2A, header=TRUE)
read3A <- fread(infile3A, header=TRUE)
#read4A <- fread(infile4A, header=TRUE)
#read5A <- fread(infile5A, header=TRUE)

read1B <- fread(infile1B, header=TRUE)
read2B <- fread(infile2B, header=TRUE)
read3B <- fread(infile3B, header=TRUE)
#read4B <- fread(infile4B, header=TRUE)
#read5B <- fread(infile5B, header=TRUE)

## Combine into one dataset
## Use both columns 1A and second column only for 2A and 3A
## Note: this makes it a matrix
combineA = abind(read1A, read2A[,2], read3A[,2], along=2)
#combineA = abind(read1A, read2A[,2], read3A[,2], read4A[,2], read5A[,2], along=2)

combineB = abind(read1B, read2B[,2], read3B[,2], along=2)
#combineB = abind(read1B, read2B[,2], read3B[,2], read4B[,2], read5B[,2], along=2)

## Change the column names so future life makes sense
## Your data are now Frame, infile1A RMSD, infile2A RMSD, infile3A RMSD
colnames(combineA) <- c("Frame", "RMSD1", "RMSD2", "RMSD3")
#colnames(combineA) <- c("Frame", "RMSD1", "RMSD2", "RMSD3", "RMSD4", "RMSD5")

colnames(combineB) <- c("Frame", "RMSD1", "RMSD2", "RMSD3")
#colnames(combineB) <- c("Frame", "RMSD1", "RMSD2", "RMSD3", "RMSD4", "RMSD5")

## Redefine as a data frame
combineA <- as.data.frame(combineA)

combineB <- as.data.frame(combineB)

## Append a column that's the average of RMSD cols
combineA$Average <- rowMeans(combineA[,2:4])
#combineA$Average <- rowMeans(combineA[,2:6])

combineB$Average <- rowMeans(combineB[,2:4])
#combineB$Average <- rowMeans(combineB[,2:6])

## Append a column that's the STDEV of RMSD cols
## The 1 means you're applying one function
## Which is the standard deviation function, sd
combineA$STDEV <- apply(combineA[,2:4], 1, sd)
#combineA$STDEV <- apply(combineA[,2:6], 1, sd)

combineB$STDEV <- apply(combineB[,2:4], 1, sd)
#combineB$STDEV <- apply(combineB[,2:6], 1, sd)

## Create a new variable with just Frame, Average, and STDEV
save_cols_A <- combineA[,c("Frame", "Average", "STDEV")]

save_cols_B <- combineB[,c("Frame", "Average", "STDEV")]

## Limit to 4 sig figs after decimal
save_cols_clean_A <- format(save_cols_A, digits=4)

save_cols_clean_B <- format(save_cols_B, digits=4)

#----------------------------------------------------------------------#
#---------------------------RMSD OUTFILES--------------------------#
#----------------------------------------------------------------------#

## Now write a tab-delimited outfile!
## Don't care about the index rownames because that's the frame
write.table(save_cols_clean_A, file = RMSDA, sep="\t", row.names=FALSE, quote=FALSE)

write.table(save_cols_clean_B, file = RMSDB, sep="\t", row.names=FALSE, quote=FALSE)

#----------------------#
#--CONTINUE WITH RMSF--#
#----------------------#

## Reading each file as a data.table.
## Bonus - fread is much faster than read.csv
read1AF <- fread(infile1AF, header=TRUE)
read2AF <- fread(infile2AF, header=TRUE)
read3AF <- fread(infile3AF, header=TRUE)
#read4AF <- fread(infile4AF, header=TRUE)
#read5AF <- fread(infile5AF, header=TRUE)

read1BF <- fread(infile1BF, header=TRUE)
read2BF <- fread(infile2BF, header=TRUE)
read3BF <- fread(infile3BF, header=TRUE)
#read4BF <- fread(infile4BF, header=TRUE)
#read5BF <- fread(infile5BF, header=TRUE)

## Combine into one dataset
## Use both columns 1A and second column only for 2A and 3A
## Note: this makes it a matrix
combineAF = abind(read1AF, read2AF[,2], read3AF[,2], along=2)
#combineAF = abind(read1AF, read2AF[,2], read3AF[,2], read4AF[,2], read5AF[,2], along=2)

combineBF = abind(read1BF, read2BF[,2], read3BF[,2], along=2)
#combineBF = abind(read1BF, read2BF[,2], read3BF[,2], read4BF[,2], read5BF[,2], along=2)

## Change the column names so future life makes sense
## Your data are now Residue, infile1A RMSF, infile2A RMSF, infile3A RMSF
colnames(combineAF) <- c("Residue", "RMSF1", "RMSF2", "RMSF3")
#colnames(combineAF) <- c("Residue", "RMSF1", "RMSF2", "RMSF3", "RMSF4", "RMSF5")

colnames(combineBF) <- c("Residue", "RMSF1", "RMSF2", "RMSF3")
#colnames(combineBF) <- c("Residue", "RMSF1", "RMSF2", "RMSF3", "RMSF4", "RMSF5")

## Redefine as a data frame
combineAF <- as.data.frame(combineAF)

combineBF <- as.data.frame(combineBF)

## Append a column that's the average of RMSD cols
combineAF$Average <- rowMeans(combineAF[,2:4])
#combineAF$Average <- rowMeans(combineAF[,2:6])

combineBF$Average <- rowMeans(combineBF[,2:4])
#combineBF$Average <- rowMeans(combineBF[,2:6])

## Append a column that's the STDEV of RMSD cols
## The 1 means you're applying one function
## Which is the standard deviation function, sd
combineAF$STDEV <- apply(combineAF[,2:4], 1, sd)
#combineAF$STDEV <- apply(combineAF[,2:6], 1, sd)

combineBF$STDEV <- apply(combineBF[,2:4], 1, sd)
#combineBF$STDEV <- apply(combineBF[,2:6], 1, sd)

## Create a new variable with just Frame, Average, and STDEV
save_cols_AF <- combineAF[,c("Residue", "Average", "STDEV")]

save_cols_BF <- combineBF[,c("Residue", "Average", "STDEV")]

## Limit to 4 sig figs after decimal
save_cols_clean_AF <- format(save_cols_AF, digits=4)

save_cols_clean_BF <- format(save_cols_BF, digits=4)

#----------------------------------------------------------------------#
#---------------------------RMSF OUTFILES--------------------------#
#----------------------------------------------------------------------#

## Now write a tab-delimited outfile!
## Don't care about the index rownames because that's the residue number
write.table(save_cols_clean_AF, file = RMSFA, sep="\t", row.names=FALSE, quote=FALSE)

write.table(save_cols_clean_BF, file = RMSFB, sep="\t", row.names=FALSE, quote=FALSE)


#------------------------#
#--CONTINUE WITH H-BOND--#
#------------------------#

## Reading each file as a data.table.
## Bonus - fread is much faster than read.csv
read1AH <- fread(infile1AH, header=TRUE)
read2AH <- fread(infile2AH, header=TRUE)
read3AH <- fread(infile3AH, header=TRUE)
#read4AH <- fread(infile4AH, header=TRUE)
#read5AH <- fread(infile5AH, header=TRUE)

read1BH <- fread(infile1BH, header=TRUE)
read2BH <- fread(infile2BH, header=TRUE)
read3BH <- fread(infile3BH, header=TRUE)
#read4BH <- fread(infile4BH, header=TRUE)
#read5BH <- fread(infile5BH, header=TRUE)

## Combine into one dataset
## Use both columns 1A and second column only for 2A and 3A
## Note: this makes it a matrix
combineAH = abind(read1AH, read2AH[,2], read3AH[,2], along=2)
#combineAH = abind(read1AH, read2AH[,2], read3AH[,2], read4AH[,2], read5AH[,2], along=2)

combineBH = abind(read1BH, read2BH[,2], read3BH[,2], along=2)
#combineBH = abind(read1BH, read2BH[,2], read3BH[,2], read4BH[,2], read5BH[,2], along=2)

## Change the column names so future life makes sense
## Your data are now Frame, infile1A HB, infile2A HB, infile3A HB
colnames(combineAH) <- c("Frame", "HB1", "HB2", "HB3")
#colnames(combineAH) <- c("Frame", "HB1", "HB2", "HB3", "HB4", "HB5")

colnames(combineBH) <- c("Frame", "HB1", "HB2", "HB3")
#colnames(combineBH) <- c("Frame", "HB1", "HB2", "HB3", "HB4", "HB5")

## Redefine as a data frame
combineAH <- as.data.frame(combineAH)

combineBH <- as.data.frame(combineBH)

## Append a column that's the average of RMSD cols
combineAH$Average <- rowMeans(combineAH[,2:4])
#combineAH$Average <- rowMeans(combineAH[,2:6])

combineBH$Average <- rowMeans(combineBH[,2:4])
#combineBH$Average <- rowMeans(combineBH[,2:6])

## Append a column that's the STDEV of RMSD cols
## The 1 means you're applying one function
## Which is the standard deviation function, sd
combineAH$STDEV <- apply(combineAH[,2:4], 1, sd)
#combineAH$STDEV <- apply(combineAH[,2:6], 1, sd)

combineBH$STDEV <- apply(combineBH[,2:4], 1, sd)
#combineBH$STDEV <- apply(combineBH[,2:6], 1, sd)

## Create a new variable with just Frame, Average, and STDEV
save_cols_AH <- combineAH[,c("Frame", "Average", "STDEV")]

save_cols_BH <- combineBH[,c("Frame", "Average", "STDEV")]

## Limit to 4 sig figs after decimal
save_cols_clean_AH <- format(save_cols_AH, digits=4)

save_cols_clean_BH <- format(save_cols_BH, digits=4)

#------------------------------------------------------------------------#
#------------------------H-BOND OUTFILES---------------------------#
#------------------------------------------------------------------------#

## Now write a tab-delimited outfile!
## Don't care about the index rownames because that's the frame

write.table(save_cols_clean_AH, file = HBONDA, sep="\t", row.names=FALSE, quote=FALSE)

write.table(save_cols_clean_BH, file = HBONDB, sep="\t", row.names=FALSE, quote=FALSE)
```

Now that that's over, we can once again plot it using gnuplot.
This script also plots the standard deviation, which is why there are three
parts of information being processed.
It looks like you're plotting the same thing 3 times per graph.
You are, in a way.
Because gnuplot does key naming weirdly, you have to first plot the line you
care about with the title for the key.
Then you plot the standard deviation curves.
That's dataset one.
Then you plot dataset two.
Finally, you plot those original curves again, because otherwise they're
buried by the standard deviation plots.
It's not counterintuitive, but it looks decent.

The reason behind this craziness is that gnuplot literally just stacks each
plotted line over the others without any thought about what's being
buried--whatever was plot last is on top.
Think of it like a sandwich--if you put the peanut butter on the bread,
you can't *really* see the full slice of bread anymore.
You know that it is there, because you see the outline, but the entire piece of
bread is obscured by the peanut butter.
This gets worse as you add the jelly and the other slice of bread.
The second piece of bread hides any pattern in the peanut butter or jelly.
Now you probably get why you have to trick gnuplot.

## avg-rmsd-etc.gnu
```Gnuplot
set encoding iso_8859_1
set term postscript enhanced color font "Arial,24";

set xlabel "Time (ns)"
set ylabel "RMSD ({\305})"
set key right bottom Left reverse maxrows 2
#set yrange [1.5:4]

# Other Berendsen inputs are $1/500, these Langevin are $1/100
set output "rmsds-avg.eps";
plot "WT_protein_system_total_bb_rms_avgd.dat" u ($1/100):($2) w lines s bezier t "Wild Type" ls 1 lw 4, \
"WT_protein_system_total_bb_rms_avgd.dat" u ($1/100):($2+$3):($2-$3) w filledcurve fs solid 0.15 t "Std. Dev." ls 1, \
"MUT_A_system_total_bb_rms_avgd.dat" u ($1/100):($2) w lines s bezier t "Mutation A" ls 2 lw 4, \
"MUT_A_system_total_bb_rms_avgd.dat" u ($1/100):($2+$3):($2-$3) w filledcurve fs solid 0.15 t "Std. Dev." ls 2, \
"WT_protein_system_total_bb_rms_avgd.dat" u ($1/100):($2) w lines s bezier notitle ls 1 lw 4, \
"MUT_A_system_total_bb_rms_avgd.dat" u ($1/100):($2) w lines s bezier notitle ls 2 lw 4;

set xlabel "Time (ns)"
set ylabel "Number of hydrogen bonds"
#set key left bottom Left reverse

# Other Berendsen inputs are $1/500, these Langevin are $1/100
set output "hbonds-avg.eps";
plot "WT_protein_system_hbond_3trial_avgd.dat" u ($1/100):($2) w lines s bezier t "Wild Type" ls 1 lw 4, \
"WT_protein_system_hbond_3trial_avgd.dat" u ($1/100):($2+$3):($2-$3) w filledcurve fs solid 0.15 t "Std. Dev." ls 1, \
"MUT_A_system_hbond_3trial_avgd.dat" u ($1/100):($2) w lines s bezier t "Mutation A" ls 2 lw 4, \
"WT_protein_system_hbond_3trial_avgd.dat" u ($1/100):($2+$3):($2-$3) w filledcurve fs solid 0.15 t "Std. Dev." ls 2, \
"MUT_A_system_hbond_3trial_avgd.dat" u ($1/100):($2) w lines s bezier notitle ls 1 lw 4, \
"MUT_A_system_hbond_3trial_avgd.dat" u ($1/100):($2) w lines s bezier notitle ls 2 lw 4;

set xlabel "Residue number"
set ylabel "RMSF ({\305})"
set key left top Left reverse maxrows 2
#set yrange [0:7]
set xrange [0:455]

set output "rmsf-avg.eps";
plot "WT_protein_system_rmsf_byres_avgd.dat" u ($1):($2) w lines t "Wild Type" ls 1 lw 4, \
"WT_protein_system_rmsf_byres_avgd.dat" u ($1):($2+$3):($2-$3) w filledcurve fs solid 0.15 t "Std. Dev." ls 1, \
"MUT_A_system_hbond_3trial_avgd.dat" u ($1):($2) w lines t "Mutation A" ls 2 lw 4, \
"MUT_A_system_hbond_3trial_avgd.dat" u ($1):($2+$3):($2-$3) w filledcurve fs solid 0.15 t "Std. Dev." ls 2, \
"WT_protein_system_rmsf_byres_avgd.dat" u ($1):($2) w lines notitle ls 1 lw 4, \
"MUT_A_system_hbond_3trial_avgd.dat" u ($1):($2) w lines notitle ls 2 lw 4;
```

{% include links.html %}
