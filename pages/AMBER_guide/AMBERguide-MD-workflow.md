---
title: Molecular Dynamics Workflow
sidebar: AMBER_sidebar
permalink: AMBERguide-MD-workflow.html
folder: AMBER_guide
---

<link rel="stylesheet" href="css/theme-orange.css">

By now you've probably seen some of the working parts to molecular dynamics,
but the order that all these things go in can be a little confusing.
Enter: the flow chart of doom.

<!-- BEGIN IMAGE -->
{% include image.html file="AMBERguide/amber-MD-workflow.svg"
alt="First block is white and says 'Follow AMBER system set-up.'
Second block is yellow and says 'Copy the solvated prmtop and inpcrd, as well
as run scripts and mdin files to the job location (e.g., cluster)'.
Third block is yellow and says 'Copy the thing.inpcrd as thing_init0.rst for
use in the minimization script.'
Fourth block is blue and says 'Run the mineq.sh script.'
Fifth block is yellow and say 'Copy the final init structure to your computer
and look at it in VMD. Does it look alright, or are there things like atoms
going through a ring?'
If you follow the 'GOOD' path, this leads to block 6A, which is white and says
'Return to the supercomputer!'
If you follow the 'YIKES...' path, this leads to block 6B, which says
'Try fixing the initial structure (so back to step 1), reminimizing, or both.'
6B then leads to block 1 or 4 with dashed arrows.
From 6A, 7A is yellow and says 'Copy thing_initX.rst as thing_min0.rst for
use in the production script.'
8A is white and says 'Claim a GPU and edit the dynamicsgpu.sh
script to reflect that.'
9A is blue and says 'Run the dynamicsgpu.sh script.'
10A is white and says 'Check up on the simulation, checking the energies,
looking at RMSDs, etc. Figure out when production really starts.'
The final block is blue and says 'Run the cpptraj scripts and analyze the data!'
"
caption="A workflow for running AMBER simulations.
Blocks colored yellow are copy steps, blocks colored blue are run steps,
blocks colored white are additional tasks, and the red block means something
bad happened." max-width="600" %}
<!-- END IMAGE -->

{% include links.html %}
