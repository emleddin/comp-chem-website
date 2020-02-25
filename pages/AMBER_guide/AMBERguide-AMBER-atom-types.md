---
title: AMBER Atom Types
sidebar: AMBER_sidebar
permalink: AMBERguide-AMBER-atom-types.html
folder: AMBER_guide
---

<link rel="stylesheet" href="css/theme-orange.css">

AMBER has specific atom names to describe the environment
(and associated bonding) of that atom.
Atom typing is not found in the PDB, but it is found in anything dealing with a
force field (specifically prepi and frcmod files).
The traditional AMBER force field atom types can be found
[here](http://www.uoxray.uoregon.edu/local/manuals/biosym/discovery/General/Forcefields/AMBER.html)
and a description of the terms themselves can be found
[on the Cerius2 site](http://www.chem.cmu.edu/courses/09-560/docs/msi/ffbsim/B_AtomTypes.html).
<!-- Backup FF site: https://xbwang.wordpress.com/2016/07/16/amber-atom-types-standard-amber-forcefield/ -->
The following are the atom types in GAFF, or the General AMBER Force Field,
taken from [the AMBER website](http://ambermd.org/antechamber/gaff.html).

## Table: Amber Atom Types in General AMBER Force Field (GAFF) {#table}
<div class="datatable-begin"></div>

Atom Name | Description | Category
--------- | ----------- | --------
c | sp<sup>2</sup> C in C=O, C=S | basic
c1 | sp<sup>1</sup> C | basic
c2 | sp<sup>2</sup> C, aliphatic | basic
c3 | sp<sup>3</sup> C | basic
ca | sp<sup>2</sup> C, aromatic | basic
n | sp<sup>2</sup> N in amide | basic
n1 | sp<sup>1</sup> N | basic
n2 | sp<sup>2</sup> N with 2 substituted double bond | basic
n3 | sp<sup>3</sup> N with 3 substituted | basic
n4 | sp<sup>3</sup> N with 4 substituted | basic
na | sp<sup>2</sup> N with 3 substituted | basic
nh | amine N connected to the aromatic rings | basic
no | N in nitro group | basic
o | sp<sup>2</sup> O in C=O, COO- | basic
oh | sp<sup>3</sup> O in hydroxyl group | basic
os | sp<sup>3</sup> O in ether and ester | basic
s2 | sp<sup>2</sup> S (p=S, C=S etc) | basic
sh | sp<sup>3</sup> S in thiol group | basic
ss | sp<sup>3</sup> S in -SR and SS | basic
s4 | hypervalent S, 3 substituted | basic
s6 | hypervalent S, 4 substituted | basic
hc | H on aliphatic C | basic
ha | H on aromatic C | basic
hn | H on N | basic
ho | H on O | basic
hs | H on S | basic
hp | H on P | basic
p2 | sp<sup>2</sup> P (C=P etc) | basic
p3 | sp<sup>3</sup> P, 3 substituted | basic
p4 | hypervalent P, 3 substituted | basic
p5 | hypervalent P, 4 substituted | basic
f | any F | basic
cl | any Cl | basic
br | any Br | basic
i | any I | basic
h1 | H on aliphatic C with 1 electron-withdrawing group | special
h2 | H on aliphatic C with 2 electron-withdrawing groups | special
h3 | H on aliphatic C with 3 electron-withdrawing groups | special
h4 | H on aliphatic C with 4 electron-withdrawing groups | special
h5 | H on aliphatic C with 5 electron-withdrawing groups | special
cc(cd) | inner sp<sup>2</sup> C in conjugated ring systems | special
ce(cf) | inner sp<sup>2</sup> C in conjugated chain systems | special
cp(cq) | bridge aromatic C | special
cu | sp<sup>2</sup> C in three-memberred rings | special
cv | sp<sup>2</sup> C in four-memberred rings | special
cx | sp<sup>3</sup> C in three-memberred rings | special
cy | sp<sup>3</sup> C in four-memberred rings | special
n | aromatic nitrogen | special
nb | inner sp<sup>2</sup> N in conjugated ring systems | special
nc(nd) | inner sp<sup>2</sup> N in conjugated chain systems | special
sx | conjugated S, 3 substituted | special
sy | conjugated S, 4 substituted | special
pb | aromatic phosphorus | special
pc(pd) | inner sp<sup>2</sup> P in conjugated ring systems | special
pe(pf) | inner sp<sup>2</sup> P in conjugated chain systems | special
px | conjugated P, 3 substituted | special
py | conjugated P, 4 substituted | special

<div class="datatable-end"></div>


{% include links.html %}
