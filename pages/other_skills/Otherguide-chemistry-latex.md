---
title: Helpful LaTeX Packages for Chemistry
sidebar: other_skills_sidebar
permalink: /Otherguide-chemistry-latex.html
folder: other_skills
---

<!-- <link rel="stylesheet" href="css/theme-blue.css"> -->
## LaTeX Overview {#overview}

[LaTeX](https://www.latex-project.org/about/) is a system for preparing
documents, slideshows, posters (and much, much more) using high-quality
typesetting.
It's command-based, as opposed to layer upon layer of button pressing with
common word processors.
One of the advantages to using LaTeX for STEM projects is that it has a
powerful and robust math rendering capabilities.

[Overleaf](https://www.overleaf.com/) is an online LaTeX editor that allows
for collaboration.
It's effectively the Google Docs version of Overleaf.
The free version offers a lot, but has some limitations in terms of saving
document history and compile time.
Unless you have in-depth version control needs, this shouldn't be an issue.
It has many [tutorials](https://www.overleaf.com/learn/latex/Tutorials) for
getting started with LaTeX.
Another helpful resource for getting started is the
[LaTeX Wikibook](https://en.wikibooks.org/wiki/LaTeX).

If you have a specific question about a LaTeX functionality, a quick Google
search will likely pull up about twenty related questions (with solutions!) on
[Stack Exchange](https://tex.stackexchange.com/).
That website is incredible.

## Helpful Formatting Commands {#format}

There are a few formatting commands that I never remember, but I use in
almost every document.

### Changing font {#font}
The default font for most LaTeX classes is Computer Modern; Beamer’s default
is sans serif Computer Modern.

To change to sans serif Computer Modern, ad the following to your preamble:
```latex
%Change to sans serif font
\renewcommand{\familydefault}{\sfdefault}
```
{% include note.html content="I'd recommend using this with the
[`sansmathfonts` package](Otherguide-chemistry-latex.html#sansmathfonts)." %}

{% include image.html file="other_skills/latex_fonts.png"
alt="The text in the image is: This is an example of default, serif Computer
Modern. This is an example of sans serif Computer Modern. Notice it looks
like the rest of the document.
This is an example of the teletype font family, a fixed-with or monospace
Computer Modern."
caption="Font family examples." %}

The lines in the image were generated through:
```latex
\noindent{\textrm{This is an example of default, serif Computer Modern.}} \\
{\textsf{This is an example of sans serif Computer Modern. Notice it looks
like the rest of the document.}} \\
{\texttt{This is an example of the teletype font family, a fixed-with or
monospace Computer Modern.}} \\
```

Font can also be changed in different ways, making them bold or italicized.

{% include image.html file="other_skills/latex_font_styles.png"
alt="The left column is the LaTeX command and the right is the result."
caption="Results of commands impacting fonts." %}

Font sizes can also be changed for sections of text. The default font size of
`\normalsize` is 10pt font, but that can be redeclared through something
like `\documentclass[12pt]{article}`.

{% include image.html file="other_skills/latex_font_sizes.png"
alt="The left column is the LaTeX command and the right is the result."
caption="Results of commands impacting font size." %}

### Modifying the Table of Contents {#TOC}
Adding this line to your preamble will add periods after the sections,
subsections, etc. in the document, provided that you haven’t redefined the
numbers for the Table of Contents (TOC) too.
```latex
\titlelabel{\thetitle.\quad}
```

The next few lines will add dots across the TOC from the entry to the page
number.
```latex
%For the dots across TOC
\renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}}
%For section TOC dots
\renewcommand\cftsecdotsep{\cftdot}
%For subsection TOC dots
\renewcommand\cftsubsecdotsep{\cftdot}
%For subsubsection TOC dots
\renewcommand\cftsubsubsecdotsep{\cftdot}
```

These lines will redefine the section (etc.) numbering in both the TOC and the
document to have a period.
```latex
% To add period after section number in TOC
\renewcommand{\thesection}{\arabic{section}.}
% Period subsection number TOC
\renewcommand{\thesubsection}{\thesection\arabic{subsection}.}
% Period subsubsection number TOC
\renewcommand{\thesubsubsection}{\thesubsection\arabic{subsubsection}.}
```

### Using minipage {#minipage}
Minipages are used to put pages side-by-side.
This is particularly useful for formatting images next to each other.
The first specified minipage is placed on the left, and the second is placed
on the right.

```latex
\begin{figure}
\begin{minipage}[t]{0.45\textwidth}
\includegraphics[width=\linewidth]{figure-one.png}
\caption{Caption for Figure 1.}
\label{fig:figure1}
\end{minipage}\hfill
\begin{minipage}[t]{0.45\textwidth}
\includegraphics[width=\linewidth]{figure-two.png}
\caption{Caption for Figure 2.}
\label{fig:figure2}
\end{
```

## Packages {#packages}

There are a LOT of LaTeX packages out there. Here, I've highlighted a few
that I either use all the time or that are more specific to chemistry.

### siunitx {#siunitx}
[`siunitx`](http://mirrors.ibiblio.org/CTAN/macros/latex/contrib/siunitx/siunitx.pdf)
is a package for formatting SI units.

New units can be defined for siunitx by adding lines like this to the preamble:
```latex
\DeclareSIUnit{\calorie}{cal}
\DeclareSIUnit{\kcal}{\kilo\calorie}
\DeclareSIUnit{\atm}{atm}
```

These new units would then be called with:
```latex
\SI{5}{\kcal\per\mole}
\SI[separate-uncertainty=true, multi-part-units=single]{25.3 \pm 0.5}{\atm}
\SIrange[range-phrase = --, range-units=single]{2}{64}{\calorie}
```

Resulting in:
{% include image.html file="other_skills/latex_siunitx_ex.png"
alt="5 kcal mol -1, 25.3 plus minus 0.5 atm, 2-64 cal."
caption="User-defined <code>siunitx</code> units." %}

Adding the following line to the preamble will change the default use of “per”
(such as in `\si{\meter\per\second}`) from -1 to /.
```latex
\sisetup{per-mode=symbol}
```

{% include image.html file="other_skills/latex_siunitx_table1.png"
alt="The LaTeX commands are on the left and the results are on the right."
caption="A list of different formats for the <code>siunitx</code> package." %}

The other specific features, such changing the units to be listed once with
`SIrange` and `SI`, separating uncertainty, or changing the range phrase can
all be added to the `sisetup` for global modification, or they can be modified
locally in the command itself.
```latex
\sisetup{per-mode=symbol, separate-uncertainty = true, multi-part-units = si
ngle, range-phrase = --, range-units=single}
```

{% include image.html file="other_skills/latex_siunitx_table2.png"
alt="Four columns. The LaTeX commands are in columns 1 and 3, and the symbols
are in columns 2 and 4."
caption="A list of different options and symbols for use with the
<code>siunitx</code> package." %}

### listings {#listings}
Code segments can be highlighted using the
[`listings`](http://ctan.mirrors.hoobly.com/macros/latex/contrib/listings/listings.pdf)
package.
Set-up for `listings` includes defining the specific code environment(s) in
the preamble.

The following preamble settings include P1 for colored Python, P2 for uncolored
Python, and latex for LaTeX code.
```latex
\lstdefinestyle{P1}{language=python,frame=tb,aboveskip=3mm,belowskip=3mm,
showstringspaces=false,columns=flexible,basicstyle={\small\ttfamily},
numbers=none,numberstyle=\tiny\color{gray},keywordstyle=\color{blue},
commentstyle=\color{dkgreen},stringstyle=\color{mauve},breaklines=true,
breakatwhitespace=true,tabsize=3,upquote=true}
\lstdefinestyle{P2} {language=python,frame=tb,aboveskip=3mm,belowskip=3mm,
showstringspaces=false,columns=flexible,basicstyle={\small\ttfamily},
numbers=none,breaklines=true,breakatwhitespace=true,tabsize=3,upquote=true}
\lstdefinestyle{latex} {
language=[LaTeX]TeX,frame=tb,aboveskip=3mm,belowskip=3mm,
showstringspaces=false,columns=flexible,breaklines=true,breakatwhitespace=true,
tabsize=3,basicstyle={\normalsize\ttfamily},keywordstyle=\color{blue},
identifierstyle=\color{red},upquote=true}
\lstset{language=python,frame=tb}
\lstset{language=python,frame=tb}
\lstset{language=[LaTeX]Tex,frame=tb}
```

Using one of these languages would the be evoked through something like:
```latex
\begin{lstlisting}[style=latex]
\usepackage{package-name}
\end{lstlisting}
```

The final portion of the `\lstdefinestyle, upquote=true`, is only available if
the [`textcomp`](https://ctan.org/pkg/textcomp?lang=en) package is also loaded.
Loading that package is helpful so that code with apostrophes or double
quotes is able to be copied correctly.

### pdfcomment {#pdfcomment}
[`pdfcomment`](http://mirror.utexas.edu/ctan/macros/latex/contrib/pdfcomment/doc/pdfcomment.pdf)
is a package that helps annotate PDFs.
It can thus be used to make PDFs more accessible, such as by adding alternative
text to images.

Loading in the package with the linewidth options specifies the line width in
annotations.
```latex
\usepackage[linewidth = 0]{pdfcomment}
```

```latex
{\pdftooltip
{\includegraphics[width=100mm]{image.png}}{This is the alternative text.}
}
```

Specific aspects of equations can be identified through the
`pdfmarkupcomment` command.

### sansmathfonts {#sansmathfonts}
[`sansmathfonts`](http://ctan.forsale.plus/fonts/sansmathfonts/doc/sansmathfonts.pdf)
is a package extends the general LaTeX sans serif font to small caps and math.

### textgreek {#textgreek}
The [`textgreek`](http://mirrors.ibiblio.org/CTAN/macros/latex/contrib/textgreek/textgreek.pdf)
package avoids the use of unnecessary math environments in formatting Greek
letters.

Instead of `$\kappa$`, you would use `\textkappa`.

### color (and xcolor) {#color}
The [`color`](http://mirror.its.dal.ca/ctan/macros/latex/required/graphics/color.pdf)
package allows users to define colors and use them throughout documents.
The [LaTeX color](http://latexcolor.com/) website has the definition lines for
hundreds of colors (and their associated HEX codes).

Colors can be defined by using `rgb` values (on a scale of 0–1), `RGB` values
(on the traditional 0–255 scale), HEX values (known to LATEX as `HTML`), or
`cmyk` values (on the 0 to 1 scale). Numbers can also be defined using `gray`
from 0 to 1.
These color definitions start by naming the color, specifying the color scale,
and then giving the range of values.
```latex
\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}
\definecolor{classicrose}{rgb}{0.98, 0.8, 0.91}
\definecolor{gray(x11gray)}{rgb}{0.75, 0.75, 0.75}
```

The [`xcolor`](http://ctan.mirror.rafal.ca/macros/latex/contrib/xcolor/xcolor.pdf)
package also exists and allows for color mixing. Original colors are still defined
using `\definecolor`, but mixed colors are defined using `\colorlet`.

To make a color called `purpling` that’s 40% blue and 60% red, the definition
line would be:
```latex
\colorlet{purpling}{blue40red}
```

### mhchem {#mhchem}
The [`mhchem`](http://ctan.math.ca/tex-archive/macros/latex/contrib/mhchem/mhchem.pdf)
package allows the formatting of chemical reactions.

The sentence "If you start with 25 g of Na<sub>2</sub>SO<sub>4</sub>, how many
grams of SO<sub>4</sub><sup>2-</sup> can be made?" would be properly rendered
with:
```latex
If you start with \SI{25}{\gram} of \ce{Na2SO4}, how many grams of \ce{SO4^2-} can be made?
```

### modiagram {#modiagram}
The [`modiagram`](http://ctan.mirror.rafal.ca/macros/latex/contrib/modiagram/modiagram_en.pdf)
package generates beautiful MO diagrams for s and p orbitals.

This example shows the molecular orbital energy diagram for
N<sub>2</sub><sup>+</sup>.
```latex
\begin{center}
\begin{MOdiagram}[labels,
labels-fs=\footnotesize,
names,
names-style = {
anchor=north,
text height = 1.5ex,
text depth = .25ex,
draw = black,
rounded corners}
]
 \atom[N]{left}{
      1s, 2s, 2p = {;up,up,up}
  }
  \atom[\ce{N+}]{right}{
      1s, 2s, 2p = {;up,up}
  }
  \molecule[\ce{N2+}]{
      1sMO, 2sMO, 2pMO = {;pair,pair,up}
  }
\end{MOdiagram}
\end{center}
```

### tikzorbital {#tikzorbital}
[`tikzorbital`](http://ctan.forsale.plus/graphics/pgf/contrib/tikzorbital/tikzorbital.pdf)
is a package that uses Tikz to generate s, p, and d orbitals, as well as MO
diagrams, with shading.

This example creates p<sub>y</sub> and a p<sub>z</sub> orbitals.
```latex
\begin{center}
\begin{tikzpicture}
%	\orbital[pos = {(0,3)}]{px}
%	\node[above] at (0,4) {p$_x$};
	\orbital[pos = {(2,3)}]{py}
	\node[above] at (2,4) {p$_y$};
	\orbital[pos = {(4,3)}]{pz}
	\node[above] at (4,4) {p$_z$};
\end{tikzpicture}
\end{center}
```

### chemfig {#chemfig}
[`chemfig`](http://ctan.mirror.rafal.ca/macros/generic/chemfig/chemfig-en.pdf)
is a package that creates chemical structures and reaction diagrams.
The package can be used to make schemes, and even color specific atoms.

This example makes a small, blue benzene become a larger, black benzene.
```latex
\begin{center}
\setchemfig{double bond sep=4pt}
\schemestart
\footnotesize \chemfig{*6((-H)-(-H)=(-H)-(-H)=(-H)-(-H)=(-H))}
\normalsize \arrow([blue]--[black]){<=>}
\chemfig{*6((-H)-(-H)=(-H)-(-H)=(-H)-(-H)=(-H))}
\schemestop
\end{center}
```

### chemstyle {#chemstyle}
The [`chemstyle`](http://ctan.forsale.plus/macros/latex/contrib/chemstyle/chemstyle.pdf)
package formats Latin phrases and has a symbol for standard state. Aptly, the
command for that is just `\standardstate`.

### xspace {#xspace}
The [`xspace`](http://muug.ca/mirror/ctan/macros/latex/required/tools/xspace.pdf)
package has a way to create the degree symbol.

Adding this:
```latex
\newcommand{\degree}{\ensuremath{{}^{\circ}}\xspace}
```
to the preamble will mean that using `\degree` will make the symbol.

### braket {#braket}
The [`braket`](http://ctan.math.ca/tex-archive/macros/latex/contrib/braket/braket.pdf)
package can be used to typeset Dirac notation and sets.
The [`physics`](http://mirror.its.dal.ca/ctan/macros/latex/contrib/physics/physics.pdf)
package does the same, but with substantially more features.

{% include links.html %}
