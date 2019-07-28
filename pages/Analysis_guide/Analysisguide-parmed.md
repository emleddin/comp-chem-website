---
title: parmed
sidebar: Analysis_sidebar
permalink: Analysisguide-parmed.html
folder: Analysis_guide
---

<link rel="stylesheet" href="css/theme-purple.css">

If you've made the mistake of stripping all the water from a protein that had
some crystal waters prior to solvation, you can generated a stripped topology
file using *parmed*.

To do this follow:
```bash
$ $AMBERHOME/bin/parmed
> parm WT_protein_system_wat.prmtop
> strip :WAT,K+
> outparm strip.WT_protein_system_wat.prmtop
> quit
```

The bright side to having to use *parmed* is that you get to see some really
adorable ASCII art.

There's plenty more that *parmed* can do, so check out the documentation
(and, if you use Python, the [Python package](https://github.com/ParmEd/ParmEd)).

{% include links.html %}
