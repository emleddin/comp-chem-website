---
title: Mode
sidebar: Rguide_sidebar
permalink: Rguide-mode.html
folder: R_guide
---

<link rel="stylesheet" href="css/theme-pink.css">

Unlike the other areas of central tendency, R doesn't have a straightforward
way to calculate the mode. Never fear: the following has an example for both 
numeric and character vectors.
```R
# Create the function.
getmode <- function(spidersconsumed) {
   uniq <- unique(spidersconsumed)
   uniq[which.max(tabulate(match(spidersconsumed, uniq)))]
}

# Create the vector with numbers.
spidersconsumed <- c(0,0,0,0,0,0,0,0,0,30)

# Calculate the mode using the user function.
result <- getmode(spidersconsumed)
print(result)
[1] "0"

# Create the vector with characters.
students <- c("Susie", "Jessica", "Sally", "Henry", "George", "Alex", "Alex", "Olive", "Patrick", "Meorg")

# Calculate the mode using the user function.
result2 <- getmode(students)
print(result2)
[1] "Alex"
```

{% include links.html %}
