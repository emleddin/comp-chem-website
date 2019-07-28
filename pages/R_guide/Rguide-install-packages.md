---
title: "Installing, Using, and Removing Packages"
sidebar: Rguide_sidebar
permalink: Rguide-install-packages.html
folder: R_guide
---

<link rel="stylesheet" href="css/theme-pink.css">

Packages are basically code bundles that enable certain functions and data sets
to be used. If you know the name of the package that you wish to install,
(in this example that package is `car`), then use:
```R
> install.packages("car")
```
Once the package is installed, it can be referenced by using `library` to call
it.
```R
> library(car)
```
The active packages can be checked by using:
```R
> (.packages())
```
Removing packages is known as "detaching" them. The following example removes
the `car` package.
```R
> detach("package:car")
```

{% include links.html %}
