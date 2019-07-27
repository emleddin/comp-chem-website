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
[here](http://www.quimica.urv.es/~bo/MOLMOD/General/Forcefields/AMBER.html).
The following are the atom types in GAFF, or the General AMBER Force Field,
taken from [the AMBER website](ambermd.org/antechamber/gaff.html).

## Table: Amber Atom Types in General AMBER Force Field (GAFF) {#table}
<div class="datatable-begin"></div>

Atom Name | Description | Category
--------- | ----------- | --------
c | sp2 C in C=O, C=S | basic
c1 | sp1 C | basic
c2 | sp2 C, aliphatic | basic
c3 | sp3 C | basic
ca | sp2 C, aromatic | basic  
n | sp2 N in amide | basic
n1 | sp1 N | basic
n2 | sp2 N with 2 substituted double bond | basic
n3 | sp3 N with 3 substituted | basic
n4 | sp3 N with 4 substituted | basic
na | sp2 N with 3 substituted | basic
nh | amine N connected to the aromatic rings | basic
no | N in nitro group | basic  
o | sp2 O in C=O, COO- | basic
oh | sp3 O in hydroxyl group | basic
os | sp3 O in ether and ester | basic  
s2 | sp2 S (p=S, C=S etc) | basic
sh | sp3 S in thiol group | basic
ss | sp3 S in -SR and SS | basic
s4 | hypervalent S, 3 substituted | basic
s6 | hypervalent S, 4 substituted | basic  
hc | H on aliphatic C | basic
ha | H on aromatic C | basic
hn | H on N | basic
ho | H on O | basic
hs | H on S | basic
hp | H on P | basic  
p2 | sp2 P (C=P etc) | basic
p3 | sp3 P, 3 substituted | basic
p4 | hypervalent P, 3 substituted | basic
p5 | hypervalent P, 4 substituted | basic  
f | any F | basic  
cl | any Cl | basic
br | any Br | basic
i | any I | basic  
% Start special
h1 | H on aliphatic C with 1 electron-withdrawing group | special
h2 | H on aliphatic C with 2 electron-withdrawing groups | special
h3 | H on aliphatic C with 3 electron-withdrawing groups | special
h4 | H on aliphatic C with 4 electron-withdrawing groups | special
h5 | H on aliphatic C with 5 electron-withdrawing groups | special  
cc(cd) | inner sp2 C in conjugated ring systems | special
ce(cf) | inner sp2 C in conjugated chain systems | special
cp(cq) | bridge aromatic C | special
cu | sp2 C in three-memberred rings | special
cv | sp2 C in four-memberred rings | special
cx | sp3 C in three-memberred rings | special
cy | sp3 C in four-memberred rings | special  
n | aromatic nitrogen | special
nb | inner sp2 N in conjugated ring systems | special
nc(nd) | inner sp2 N in conjugated chain systems | special  
sx | conjugated S, 3 substituted | special
sy | conjugated S, 4 substituted | special  
pb | aromatic phosphorus | special
pc(pd) | inner sp2 P in conjugated ring systems | special
pe(pf) | inner sp2 P in conjugated chain systems | special
px | conjugated P, 3 substituted | special 
py | conjugated P, 4 substituted | special

<div class="datatable-end"></div>


{% include links.html %}
