---
title: Uploads to PyRED
sidebar: AMBER_sidebar
permalink: AMBERguide-PyRED-uploads.html
folder: AMBER_guide
---

<link rel="stylesheet" href="css/theme-orange.css">

First things first: PyRED knows what it wants.
If it wants something titled a particular way, it will only accept things
with that particular title.
So treat PyRED like the royalty it is and don't disobey it.
Second things second: if your school has a Gaussian license, you can apply for
an academic account that will allow you to run the quantum calculation with
Gaussian (you don't have to use Gaussian, in this instance, so don't worry).

{% include tip.html content="PyRED's account registration is finicky,
and the Captcha is intense. Pay attention to the differences between uppercase
and lowercase letters when making an account, and save your assigned login and
password, since you don't get to change it." %}

## Nucleotide Fragment Generation
PyRED creates parameters for nucleotides in fragments.

<u> Dimethylphosphate Portion of PDB (<code>Mol_red1.pdb</code>) </u>
```
ATOM      1  C1  DMP     1       1.100   0.000   0.000
ATOM      2  H11 DMP     1       0.000   0.000   0.000
ATOM      3  H12 DMP     1       1.476   1.034   0.000
ATOM      4  H13 DMP     1       1.476  -0.484   0.913
ATOM      5  O3' DMP     1       1.524  -0.687  -1.135  
ATOM      6  P   DMP     1       3.138  -0.847  -1.398  
ATOM      7  O1P DMP     1       3.811   0.378  -0.942  
ATOM      8  O2P DMP     1       3.281  -1.435  -2.738  
ATOM      9  O5' DMP     1       3.475  -2.001  -0.280
ATOM     10  C2  DMP     1       3.096  -3.315  -0.544
ATOM     11  H21 DMP     1       2.018  -3.403  -0.661
ATOM     12  H22 DMP     1       3.568  -3.689  -1.444
ATOM     13  H23 DMP     1       3.401  -3.925   0.302
```

<u> Example <code>Project.config</code> </u>
```bash
# Provide informative titles
MOLECULE1-TITLE        = Dimethylphosphate
MOLECULE2-TITLE        = NucleotideOfInterest

# Providing the total charge for molecule 1 is mandatory
MOLECULE1-TOTCHARGE    = -1
# Providing the total charge for molecule 2 is not mandatory
MOLECULE2-TOTCHARGE    =  0

# Define two inter-mcc between molecule 1 and molecule 2
MOLECULE-INTER-MCC1    = 0.0 | 1 2 |  1  2  3  4 | 1 2
MOLECULE-INTER-MCC1    = 0.0 | 1 2 | 10 11 12 13 | 3 4
```

In the `Project.config` file, the lines with `MOLECULE-INTER-MCC1`
describe where the connections need to be made between the two compounds.
In the example, molecule 1's <code> 1  2  3  4 | 1 2</code> refers to C1, H11,
H12, H13, H12, and H13. Molecule 2's <code>| 10 11 12 13 | 3 4 </code> refers
to C3', H3', C4', H4', O3', and H3T.

<u> Example `System.config` </u>
```
FFPARM = AMBERFF99SB
```

## Using the Job Information
After the job has completed (you should get an email), you can download the
project folder.
This folder will have substantially more information if the job completes
successfully! &#x1F603;

### Completed Jobs
Inside the project folder (named P with a string of numbers), you can find the
`mol2` file by entering the `Data-R.E.D.Server/`.
If you ran a job split into multiple `Mol_red` files that needed to have
intermolecular connections, then enter the `Mol_MM` folder, followed by the
`INTER` folder.
The important `mol2` file(s) should be in that folder.
Check that the structure optimized as you anticipated by viewing the `mol2` in
VMD.
You should also check that the assigned AMBER atom types make sense.
{% include note.html content="Chimera will open `mol2` files, but they'll
have weird spheres that can be confusing to interpret." %}

The `frcmod` files can be found from the project folder and then entering
`Data-R.E.D.Server/Data-Default-Proj`.
The `frcmod.known` is anything that PyRED found parameters for.
The missing parameters are listed in `frcmod.unknown`, and it will usually
mark if it thinks they are optional.
You can find missing parameters in publications, or by using `parmchk`
or `parmchk2` from AMBERTools.
```
$ parmchk2 -i Mol-sm_m1-c1.mol2 -f mol2 -o my_new_residue.frcmod
```

### Jobs that Errored Out
In the project file, there should be a file that is titled similarly to
`R.E.D.-Server-3672.master1.q4md-forcefieldtools.org.log`.
This log should have more information on why the job failed.
If not, the Gaussian log files should help you debug the problem.

{% include links.html %}
