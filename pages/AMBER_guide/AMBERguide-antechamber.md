---
title: Using <i>antechamber</i> and <i>parmchk</i> for Ligands
sidebar: AMBER_sidebar
permalink: AMBERguide-antechamber.html
folder: AMBER_guide
---

<link rel="stylesheet" href="css/theme-orange.css">

The *antechamber* program is a helpful tool for ligand
(i.e. drug and inhibitor) parametrization, assuming you have a pretty typical
organic molecule.
(If not, you'll need to do this the Gaussian way, or the REDD way.)
First, make a PDB file with __only__ the ligand molecule--no protein, no metal,
just ligand.
If your ligand is in the PDB with everything else, copy the lines with the
ligand into a new PDB file.
If your ligand PDB does not have hydrogens, then those will need to be added.
Luckily, AMBER's *reduce* program can do this!

```
$AMBERHOME/bin/reduce ligand_missing_H.pdb > ligand_with_H.pdb
```

Amazing, now you should have hydrogens where they need to be.
Now you're ready to use *antechamber*,
which may take a little bit of time depending on the size of your ligand,
because AMBER will be running a quantum calculation.

```
$AMBERHOME/bin/antechamber -i ligand_with_H.pdb -fi pdb -o ligand_with_H.mol2 -fo mol2 -c bcc -s 2 -nc 0 -m 1
```

So, what the fruitcakes did that all mean?
First, you're reading in the PDB file (and saying that your `f`ile `i`n is a
PDB), telling it what file to write out (and saying that your `f`ile `o`ut
is a mol2 file). The `-s 2` tells the program to be verbose, so that all of
the information is printed to the Terminal (it's helpful for debugging
this command).
The `-c bcc` specifies what type of quantum calculation you're running--in this
case, it's AM1-BCC (Austin Model 1-Bond Charge Corrections).
It's not meant to be super great--it's a quick and dirty calculation, because
you're likely doing this same parametrization for a great number of compounds.
If you really care about this ligand's parametrization, then you'll want to
consider using RESP charges (and now we're back to the
[<b>R</b>ESP <b>E</b>SP charge <b>DD</b>ata <b>B</b>ase Home Page](http://upjv.q4md-forcefieldtools.org/REDDB/index.php)).
There are other charge options for *antechamber*, too, which can be found by
doing `antechamber -L`.
Anyway, the `-nc 0` says that the `n`et `c`harge is zero.
If your ligand has a +3 overall charge, use `-nc 3`; for a -2 overall charge
you'd use `-nc -2`. If you're lazy and guess 0 when there's really a charge,
you'll probably get an error at this step--though you really should take the
20 seconds to determine if there's a charge.
Finally, the `-m 1` specifies the multiplicity of the ligand.
This is determined through *2S + 1*, where *S* is the total number of unpaired
electrons in the system. Thus, with zero unpaired electrons, this is 1.

Hooray, we've made it through the *antechamber* step, which gave us a ligand
with charges in a mol2 file.
With that information, we can use *parmchk* to make a force field modification
file (known as an frcmod) for the ligand.

```
$AMBERHOME/bin/parmchk -i ligand_with_H.mol2 -f mol2 -o ligand_with_H.frcmod
```

Great! That's done! You now have an frcmod file that has parameters specific to
your ligand based on the Generalized Amber Force Field (GAFF) for organic
molecules. You're now ready to move onto [LEaP](AMBERguide-LEAP.html).

{% include links.html %}
