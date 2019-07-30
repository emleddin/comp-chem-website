---
title: Overview
sidebar: AMBER_sidebar
permalink: AMBERguide-systems-overview.html
folder: AMBER_guide
---

<link rel="stylesheet" href="css/theme-orange.css">

There's a general flow to setting up systems that is outlined in
the [figure below](AMBERguide-systems-overview.html#set-up).
The entire process starts with a crystal structure of the
protein, which is explained more [in the PDB section](AMBERguide-PDBs.html).
Once you have a PDB file, you then clean it up to remove anything you don't
need. One pretty easy way to do this is using a grep command to extract any
lines you care about:

```
grep -e '^ATOM\|^HETATM\|^TER\|^END' file_from_PDB.pdb > file_from_PDB_clean.pdb
```

Using this `grep` command extracts out only lines beginning with:

* `ATOM`: positional information for each atom
* `HETATM`: positional information for hetero atoms (these are typically metals)
* `TER`: termination lines (used to separate out protein, DNA, etc.)
* `END`: the final line of the file
and saves them to a new file (`file_from_PDB_clean.pdb`).

This command does not copy any of the lines beginning with:
* `REMARK`: a bunch of comments crystallographers and experimentalists probably
care about, but sometimes includes things about missing residues you need to
know about
* `ANISOU`: which is specific information on how the crystal structure was
obtained
* `CONECT`: connection info between atoms that some programs, like Chimera,
add to saved files
* `MASTER`: a dummy "master path" for the file that's useless to us

### Figure: Setting Up Systems {#set-up}
{% include image.html file="AMBERguide/amber-system-flow.svg"
alt="First block is blue and says 'Get PDB structure.'
Second block is blue and says 'clean the PDB structure'.
Under this block, 2U, is red with 'deal with non-standard' residues.
To the right, 2R is red with 'remove REMARK and ANISOU lines.'
3U is red with 'deal with non-standard residues.'
4U is 'set-up using LEaP.'
4U diverges to 5U, 5R, and 5B.
5U is blue with 'copy to cluster and use mdin files to minimize, etc.'
6U is 'check with system visually using VMD and inspect output.'
Below 2R is 3R in red with 'fill missing loops.'
3R diverges into 4A and 4B.
4A is red and says 'Use Modeller.'
4B is red and says 'Copy from another PDB structure.'
From 4U, 5R is red and says 'add non-standard prepi/frcmod/lib files (if any).'
5R connects to 5B, which is blue with 'load in the PDB.'
To the right of 5B is a line connecting to 6BA. The line says 'Save!' And
6AB is white and says 'save the vacuum prmtop and inpcrd files.'
5B also leads to 6B, which is blue and says 'Solvate the system and add ions.'
6B leads to 6BB, which has a line that says 'Save!' and a white box with
'Save the solvated prmtop and inpcrd files.'
Finally, 6B leads to the last block in white which says 'save the solvated PDB.'
"
caption="The flow of setting up a system using AMBER. Blocks colored in blue
are critical, blocks colored in red may be necessary, and blocks colored in
white are steps where you generate files." max-width="600" %}
<!-- END IMAGE -->

After the first-pass for cleaning the PDB structure, it is important to check
that the protein is intact. Sometimes, to get a crystal structure, huge chunks
of protein are skipped over. That means, that instead of having one, smooth,
connected necklace-like chain, your protein is broken into multiple necklaces
of varying sizes--and you're responsible for finding the correct clasps to link
them into one (this is better explained
    [in the image](AMBERguide-systems-overview.html#missing-res)).
When you open a structure in Chimera, areas with missing residues are linked
together with dashed lines.


### Figure: Setting Up Systems {#missing-res}
<!-- FIX ME -->
{% include image.html file="AMBERguide/amber-missing-residues.svg"
alt="Top sequence is blue with G T R Y A G K V V. Bottom sequence is red
G T R - - - K V V.
"
caption="The top block (in blue) is the full, correct protein sequence.
The bottom block (in red) is missing three residues in the center."
max-width="600" %}
<!-- END IMAGE -->

So how do you deal with these missing residues? First, it would behoove you to
see what the experimentalists did to get the crystal structure... which means
reading the paper. &#x1F603;
They'll probably talk about how those loops or residues were skipped, and if
they had any experimental add-ins (like an X-residue linker) to tell them where
the first part ended and the new part began.

Once you know what they did, you can make decisions to match the structure to
that. Otherwise, there's 2 common paths moving forward. First, if there's
another PDB structure for what you're looking at, you can try to copy the
residues from there.

1. Find another PDB
2. Open both structures in Chimera
3. Overlay the structures
4. Resave these overlayed structures with respect to the one you wanted to use
5. Copy and paste the missing residues in a text editor and hope it worked

Unfortunately, the more likely solution is that you'll need to use
[Modeller](https://salilab.org/modeller/) to fix those missing sections, or
match them to the experimental linker. Luckily, Modeller interfaces with
Chimera, so you can build in the missing parts that way. Though, you can go
the Python command-line driven route, if you prefer that.

Another important component to getting the PDB structure correct is having any
non-standard residues included where they need to be included. Non-standard
residues are anything that's not a prototypical amino acid, DNA, or RNA base.
So, for example, 5-methylcytosine and thymidine triphosphate would be
considered non-standard residues. Similarly, any ligands that are complexed
with the protein are also treated as non-standard residues, because you need to
generate parameter files for them. The way to deal with these situations is
described
[in the non-standard residue section later on](AMBERguide-non-standards.html).
Don't forget--you need to copy information from the non-standard residue's PDB
file back into the master PDB file that you'll use with *LEaP*. And, you don't
need to have hydrogens on that one, because *LEaP* will add them for you.

Finally, after all of that fun getting a master PDB, you're ready to use
*LEaP*. Once again, this is described more thoroughly in the
[set-up using <i>LEaP</i> section](AMBERguide-LEAP.html). What you're doing in
*LEaP* is actually building the files used for simulation.

Woohoo! You made it through making a `prmtop` and `inpcrd`. Now it's
<u>**_HIGHLY_**</u> recommended that you check the structures by looking at them
in VMD. Ask yourself: (a) *are there any crazy long bonds that are obviously
incorrect?* (b) *does my non-standard residue look decent and have the
appropriate connections?*. There are two small points to make here. First, what
you see in VMD may not be an accurate representation, and the *xleap* editor's
interpretation of bonds/connections is the only "true" source. Second, if
things look close but not completely correct, they'll likely be fixed in
minimization. Make a note of it and check after you've finished minimization.

So what now? Well, you'll copy your `prmtop` and `inpcrd` over to the cluster
(or wherever you plan on running this). But that's not all you need--you'll
need a runscript (i.e., a  `.sh` file--keep reading for an example) and your
`mdin` files (see [the mdin section](AMBERguide-mdins.html)). Without all of
these pieces, your simulation will fail, and you'll spend several minutes
asking "WHY????", when really you just didn't copy all the stuff you needed.

After running the minimization, heating, and equilibration on the CPUs, it is
<u>**_HIGHLY suggested_**</u> that you check the system again in VMD before
beginning production. It is a million times better to spend forever getting the
system correct than finish 100 ns of simulation for it all to be for nothing.
If everything looks ok, then submit the production steps to run on GPUs. If
not, well, you're back to wherever it looks like things went wrong (probably
    either the non-standard's parametrization or set-up using *LEaP*).

{% include links.html %}
