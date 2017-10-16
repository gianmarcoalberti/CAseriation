\name{CAseriation-package}
\alias{CAseriation-package}
\alias{CAseriation}
\docType{package}
\title{
Contingency table seriation by means of Correspondence Analysis
}
\description{
CAseriation allows to sort the rows and columns of the input contingency table according to the scores of rows and columns on the Correspondence Analysis' dimension selected by the user. The package also allows to plot the CA scatterplot of selected dimensions, and to seek for clusters in the dataset. As for seriation, two plots are returned,  displaying the sorted contingency table. The results are also exported into tab delimited .txt files.
}
\details{
\tabular{ll}{
Package: \tab CAseriation\cr
Type: \tab Package\cr
Version: \tab 0.2\cr
Date: \tab 2016-09-12\cr
License: \tab GPL\cr
}
In archaeology there is often the need to seriate contingency tables in order to devise a relative chronology of different types of contexts (e.g., graves). Different approaches exists in literature to achieve a best ordering. The method implemented in the 'CAseriation' package is the ordination of rows and columns of a contingency table according to their scores on the Correspondence Analysis' dimension selected by the user. 

The ideal workflow for the use of the package would be: 

(a) fed the contingency table into R; 

(b) inspect the Correspondence Analysis scatterplot in search of a seriation structure (i.e., presence of the 'horseshoe' effect); 

(c) sort the table according to the dimension the user is interesting in; 

(d) additionally, formally assess the existence of clusters in the data.


Implemented functions to achieve the above goals:

(b) check.ca.plo()

(c) sort.table()

(d) plot.clusters.rows(); plot.clusters.rows()

The package provides the facility to assess to what extent the seriation structure (if any) embedded in the data approximates to a 'perfect' seriation. This can be accomplished by means of the evaluate() function, which returns the Correspondence Analysis scatterplot for row/column categories and add a 2nd order polynomial fit. The Rsquared value is reported in the plot's subtitle.

As for the clustering rationale, see the documentation that comes with the FactoMineR package or, also, see Alberti 2013 (cited below).
}
\author{
Gianmarco ALBERTI

Maintainer: Gianmarco ALBERTI <gianmarcoalberti@tin.it><gianmarco.alberti@um.edu.mt>
}
\references{
Alberti G. 2013, An R script to facilitate Correspondence Analysis. A guide to the use and the interpretation of results from an archaeological perspective, Archeologia e Calcolatori 24, 25-54.

Baxter M.J. 1994, Exploratory Multivariate Analysis in Archaeology, Edinburgh, Edinburgh University Press.

Shennan S. 1997, Quantifying Archaeology, Edinburgh, Edinburg University Press.
}
\keyword{ package }
\seealso{
ca,FactoMineR,seriation
}
\examples{
load("perfect_seriation") #loads the sample dataset
check.ca.plot(perfect_seriation,1,2) #plot the Correspondence Analysis scatterplot of the first 2 dimensions in order to inspect data structure (e.g., seeking for the horseshoe effect).
sort.table(perfect_seriation,1) #sort the input contigency table accorging to the scores of rows and columns categories on the 1 CA dimension
plot.clusters.rows(perfect_seriation,1,2) #displays the CA scatterplot for row categories, with different clusters of points being given different colours
plot.clusters.cols(perfect_seriation,1,2) # the same as the preceding function, but applies to colum categories
load("cemetery") #loads the sample dataset
evaluate(cemetery,1,2,which='R') #plot the CA scatterplot for row categories, and add a 2order polynomial fit. The Rsquared value is also reported.
}
