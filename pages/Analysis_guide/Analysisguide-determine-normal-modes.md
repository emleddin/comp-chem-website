---
title: Determining Normal Modes with gnuplot
sidebar: Analysis_sidebar
permalink: Analysisguide-determine-normal-modes.html
folder: Analysis_guide
---

<link rel="stylesheet" href="css/theme-purple.css">

Typically, the first three normal modes are the most important for a system, as
they contribute the greatest to the overall motion of the protein.
However, some cases occur where they aren't that informative, i.e. there's so
much different movement occurring that those three are not distinct enough.
You can plot the different contributions using Python to get a clearer picture
regarding different contributions.

The following is `eigenplots.py` and can be run with `python eigenplots.py`.
Thanks, Alice!
```python
import numpy as np
import matplotlib.pyplot as plt
import matplotlib as mpl
import statsmodels.api as sm
from matplotlib.mlab import griddata
from tables import *
from matplotlib.colors import LinearSegmentedColormap

data1 = np.genfromtxt("WT-system/WT_protein_system_vacuum_prmtop_pca.nmd", delimiter=None,skip_header=9)

plt.rcParams.update({'font.size': 22})
plt.rcParams.update({'figure.autolayout': True})

data1eigenrank = data1[:,1]
data1eigenvalue = data1[:,2]
plt.tight_layout()
#x-axis 0 to 10; y-axis 0 to 50
plt.axis([0,10,0,50])
plt.xlabel('Mode Number')
plt.ylabel('Percentage of\nTotal Motion (%)')
plt.plot(data1eigenrank,data1eigenvalue,marker='o',c='black',linewidth=2.0)
plt.savefig('WT_protein_system_eigenplot.png')
plt.gcf().clear()
```
First a bunch of things were imported to let Python know it knows how to use
Python. 
Then, the dataset is found, and several unhelpful lines are skipped.
The auto-plot parameters and font sizes are reset, so the graph isn't weirdly
smushed.
Then two specific things are pulled from the matrix in order to be plotted, and
the plot information is specified.

{% include links.html %}
