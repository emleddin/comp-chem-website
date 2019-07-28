---
title: Vectors
sidebar: Rguide_sidebar
permalink: Rguide-vectors.html
folder: R_guide
---

<link rel="stylesheet" href="css/theme-pink.css">

Vectors are a basic data structure that can include logical, integer, double,
character, complex, or raw data. It can only hold one type of data at a time.
A new vector can be created with the values `4, 7,` and `9`, where `c` stands
for combine.
```R
> c(4, 7, 9)
[1] 4 7 9
```
If the following command was used, all of the values would be coded as
character values.
```R
> c(1, TRUE, "three")
[1] "1"	"TRUE"	"three"
```
## Sequences and Variables {#seq-and-var}

Sequences of numbers can also be saved as a vector, using a colon
(`start:end`) or [`seq(start, end)`]. Using `seq` allows increments other than
1 to be used, when the increment is specified after end
[`seq(start, end, increment)`].
```R
> a <- 5:9
[1]	5	6	7	8	9
> alpha <- seq(5, 9)
[1]	5	6	7	8	9
> quartersvector <- seq(5, 6, 0.25)
[1]	5.00	5.25	5.50	5.75	6.00
> variablecharlie <- 9:5
[1]	9	8	7	6	5
```
The above example demonstrated saving sequences of numbers as variables.
You can access the individual value in the vector through using the variable
name and brackets. The following example will show that and include comments
(shown by `\#`)  about what's happening.
```R
> variablecharlie[3] #I'm calling value 3 stored in the vector
[1] 7 #The third value is the number 7
> quartersvector[2]
[1] 5.25
> alpha[2] <-68 #replaces the second position of the vector with 68
> print(alpha) #prints the values in alpha to command line
[1] 5 68 7 8 9
```
Names can be assigned to the variable with `names()`. After assignment,
printing will show the names. Either single or double quotes can be used to
assign names.
```R
> limbs <- c(4, 3, 4, 3, 2, 4, 4, 4)
> names(limbs) <- c('One-Eye', 'Peg-Leg', 'Smitty', 'Hook', 'Scooter', 'Dan', 'Mikey', 'Blackbeard')
> print(limbs)
One-Eye	Peg-Leg	Smitty	Hook	Scooter	Dan	Mikey	Blackbeard
4	3	4	3	2	4	4	4
```
To remove a variable (or dataset), use the `rm()` command, where the data you
wish to remove is specified in the parentheses. Similarly, to list what data is
available, use the `ls()` command with empty parentheses.

## Saving R Data {#save}

Data can be saved with the `save()` command. Multiple data sets can be saved in
one data file (in the example, these are `x`, `y`, and `z`).
```R
> save(x, y, z, file="xyz.rda")

{% include links.html %}
