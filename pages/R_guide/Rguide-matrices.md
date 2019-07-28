---
title: Matrices
sidebar: Rguide_sidebar
permalink: Rguide-matrices.html
folder: R_guide
---

<link rel="stylesheet" href="css/theme-pink.css">

\subsubsection{Filling Matrices}
To make a 4x5 matrix filled with zeroes, it would look like:
```R
> matrix(0, 4, 5)
	[,1]	[,2]	[,3]	[,4]	[,5]
[1,]	0	0	0	0	0
[2,]	0	0	0	0	0
[3,]	0	0	0	0	0
[4,]	0	0	0	0	0
```
If you wanted to have a matrix with values specified, store those values as a
[vector](Rguide-vectors.html) first.
The following example specifies a vector, `a`, as a sequence from 1 to 20,
and then stores it as a matrix.
```R
> a <- 1:20
> matrix(a, 4, 5)
	[,1]	[,2]	[,3]	[,4]	[,5]
[1,]	1	5	9	13	17
[2,]	2	6	10	14	18
[3,]	3	7	11	15	19
[4,]	4	8	12	16	20
```

## Determinants and Eigen-stuff {#det-and-eigen}

The determinant can be taken on a matrix. If the variable has been defined,
but not yet placed in a matrix, both steps must be done at once.
```R
> a<-1:25
> det(matrix(a,5,5))
[1] 0
```
The `eigen` function (I know, I'm laughing too) computes both eigenvalues and
eigenvectors. If the matrix is symmetric, then include `symmetric=TRUE` to
skip the symmetry check.
```R
> eigen(matrix(a,5,5))
eigen() decomposition
$values
[1]  6.864208e+01+0.000000e+00i -3.642081e+00+0.000000e+00i
[3]  4.257350e-15+0.000000e+00i -1.270981e-16+4.588876e-16i
[5] -1.270981e-16-4.588876e-16i

$vectors
             [,1]           [,2]           [,3]                  [,4]
[1,] 0.3800509+0i -0.76703416+0i  0.54621260+0i  0.1175132+0.0459634i
[2,] 0.4124552+0i -0.48590617+0i -0.27228461+0i  0.4017692+0.0065072i
[3,] 0.4448594+0i -0.20477817+0i -0.66418830+0i -0.7435988+0.0000000i
[4,] 0.4772637+0i  0.07634982+0i -0.03961996+0i -0.1881630-0.2033750i
[5,] 0.5096680+0i  0.35747782+0i  0.42988027+0i  0.4124793+0.1509044i
                      [,5]
[1,]  0.1175132-0.0459634i
[2,]  0.4017692-0.0065072i
[3,] -0.7435988+0.0000000i
[4,] -0.1881630+0.2033750i
[5,]  0.4124793-0.1509044i
```

## Matrix Multiplication {#mat-mult}

For element-wise multiplication, simply use the `A*B` format.
To multiply matrices, you would use the `%*%` symbol. The outer product
(AB') can be obtained using the `%o%` symbol.
```R
> a <- 1:20
> b <- 21:40
> matrix(a, 4, 5)
	[,1]	[,2]	[,3]	[,4]	[,5]
[1,]	1	5	9	13	17
[2,]	2	6	10	14	18
[3,]	3	7	11	15	19
[4,]	4	8	12	16	20
> matrix(b, 5, 4)
     [,1] [,2] [,3] [,4]
[1,]   21   26   31   36
[2,]   22   27   32   37
[3,]   23   28   33   38
[4,]   24   29   34   39
[5,]   25   30   35   40
> a%*%b
     [,1]
[1,] 7070
```

## Other Matrix Operations {#other-mat}

Different formats are given, where `A` and `B` are matrices, and `k` is a
scalar.

### Table: Formats for Matrices {#table}

| Command                | Function |
| ---------------------- | -------- |
| `t(A)`                 | transpose |
| `crossprod(A,B)`       | A'B |
| `crossprod(A)`         | A'A |
| `solve(A)`             | Inverse of A (if A is a square matrix) |
| `solve(A, b)`          | Returns x vector in b = Ax equation |
| `diag(A)`              | Vector with elements of principal diagonal |
| `diag(K)`              | Creates the k x k identity matrix |
| `rowMeans(A)`          | Vector of row means |
| `rowSums(A)`           | Vector of row sums |
| `columnMeans(A)`       | Vector of column means |
| `columnSums(A)`        | Vector of column sums |
| `rowbind(A,B,...)` | Combines matrices or vectors vertically, returning a matrix |
| `cbind(A,B,...)` | Combines matrices or vectors horizontally, returning a matrix |

## Writing Information to a File {#write-info}

Data, usually matrix data, are written to a file using the `write` command.
In it, the original data vector is specified, then the file name, and then the
delimiter. Tabs are specified through `\t`, but other separators can be used if
placed in the quotes.
```R
> write(mydata, "mydata.txt", sep="\t")
```
Files can also be written using `write.csv()` and `write.table()`.

{% include links.html %}
