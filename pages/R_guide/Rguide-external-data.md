---
title: Using External Data, Files, and Scripts
sidebar: Rguide_sidebar
permalink: Rguide-external-data.html
folder: R_guide
---

<link rel="stylesheet" href="css/theme-pink.css">

Files can be listed by using "list.files()", which will return possible files.
The source command will run a script, and is shown below.
```R
> source("bottle1.R")
[1] "This be a message in a bottle1.R!"
```
R can read a .csv file, which literally means comma separated values.
The example below shows a csv, titled `targets.csv`, being read.
```R
read.csv("schools.csv")
University	 		Students 	Tuition
1 Truman State University	6200		13500
2 University of Iowa		33300		29000
3 University of Michigan	44700		45000
4 University of North Texas	37900		20000
```
Text files (.txt) can also be read, but if the separator is a tab, the
"read.table" command is a better fit. The following example shows the tab
separator specification (`sep="\t"`).
```R
read.table("population.txt", sep="\t")
	V1       V2
1 	City	Population
2 Joliet	148262
3 Kirksville	17519
4 Denton	133808
5 New Lenox	26217
```
This example had V1 and V2 as headers.
R isn't automatically aware that they are headers, so that needs to be
specified when reading the table.
```R
read.table("population.txt", sep="\t", header=TRUE)
	City	Population
1 Joliet	148262
2 Kirksville	17519
3 Denton	133808
4 New Lenox	26217
```

{% include links.html %}
