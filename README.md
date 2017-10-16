# CAseriation
ver 0.2

CAseriation allows to sort the rows and columns of the input contingency table according to the scores of rows and columns on the Correspondence Analysis' dimension selected by the user. The package also allows to plot the CA scatterplot of selected dimensions, and to seek for clusters in the dataset. As for seriation, two plots are returned, displaying the sorted contingency table. The results are also exported into an Excel spreadsheet.

In archaeology there is often the need to seriate contingency tables in order to devise a relative chronology of different types of contexts (e.g., graves). Different approaches exists in literature to achieve a best ordering. The method implemented in the 'CAseriation' package is the ordination of rows and columns of a contingency table according to their scores on the Correspondence Analysis' dimension selected by the user.

The ideal workflow for the use of the package would be:

(a) fed the contingency table into R;

(b) inspect the Correspondence Analysis scatterplot in search of a seriation structure (i.e., presence of the 'horseshoe' effect);

(c) sort the table according to the dimension the user is interesting in;

(d) additionally, formally assess the existence of clusters in the data.

Implemented functions to achieve the above goals:

(b) check.ca.plot()

(c) sort.table()

(d) plot.clusters.rows(); plot.clusters.rows()

The package provides the facility to assess to what extent the seriation structure (if any) embedded in the data approximates to a 'perfect' seriation. This can be accomplished by means of the evaluate() function, which returns the Correspondence Analysis scatterplot for row/column categories and add a 2nd order polynomial fit. The Rsquared value is reported in the plot's subtitle.


## List of implemented functions
to load the sample datasets:
```r
data("perfect_seriation")
data("cemetery")
```

to plot the Correspondence Analysis scatterplot of the first 2 dimensions in order to inspect data structure (e.g., seeking for the horseshoe effect):
```r
check.ca.plot(perfect_seriation,1,2) 
```

to sort the input contingency table according to the scores of rows and columns categories on the 1 CA dimension; two seriation plots and a 'battleship' plot for the sorted table are also produced:
```r
sort.table(perfect_seriation,1)
```

to display the CA scatterplot for row categories, with different clusters of points being given different colors:
```r
plot.clusters.rows(perfect_seriation,1,2) 
```

the same as the preceding function, but applies to column categories:
```r
plot.clusters.cols(perfect_seriation,1,2) 
```

to plot the CA rows scatterplot of the first two dimensions and add a second order polynomial fit; the Rsquared value is also reported:
```r
evaluate(perfect_seriation,1,2, which='R') 
evaluate(cemetery,1,2, which='R')
```


## Installation
To install the package  in R, just follow the few steps listed below:

1) install the 'devtools' package:  
```r
install.packages("devtools", dependencies=TRUE)
```
2) load that package: 
```r
library(devtools)
```
3) download the 'CAseriation' package  from GitHub via the 'devtools''s command: 
```r
install_github("gianmarcoalberti/CAseriation")
```
4) load the package: 
```r
library(CAinterprTools)
```
5) enjoy!

NOTE:
Unlike version 0.1, this new version does not rely on the 'xlsx' package and therefore does not export the seriation results into Excel files. This decision has been taken due to some annoying issues experienced during the package installation, for which one of the dependencies of 'xlsx' package (namely, rJava) was responsible. To make users' life easier, I decided to drop the use of 'xlsx' package altoghether, and to export the seriation results into a more manageable .txt format. The latter can in fact be imported into any further stats program quite easily.

## Companion website
[Correspondence Analysis in Archaeology](http://cainarchaeology.weebly.com)
