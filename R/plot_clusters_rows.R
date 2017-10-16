#' plot.clusters.rows
#'
#' This function returns the Correspondence Analysis scatterplot of row categories, with points' colour according to the clusters to which points belong.
#' A tab delimited .txt file is also created (in the R working directory) containing the cluster membership for each row category.
#' @param data: Dataframe containing the contingency table to be analysed.
#' @param x,y: The dimensions to be plotted (1st and 2nd by default).
#' @param bp: logical value (TRUE/FALSE). TRUE displays boxplots of row coordinates by cluster, in order to visually gauge the degree of separation between clusters. FALSE is default.
#' @param varwidth: logical value (TRUE/FALSE). TRUE sets the width of the boxplots proportional to the groups size. This helps in eyeballing the size of the clusters being compared. FALSE is default.
#' @keywords cluster, columns, correspondence analysis
#' @examples
#' data("perfect_seriation"): load the dataset 'perfect_seriation'
#' plot.clusters.rows (perfect_seriation,1,3): plot the Correspondence Analysis scatterplot of row categories (using the 'perfect_seriation' dataframe), displaying the 1 and 3 dimensions.
#' plot.clusters.rows (cemetery,1,2,bp=TRUE,varwidth=TRUE): plot the Correspondence Analysis scatterplot of row categories (using the 'cemetery' dataframe), displaying the 1 and 2 dimension. Boxplots of row coordinates (on the selected dimensions) by cluster are also displayed, with size proportional to the size of the clusters.
plot.clusters.rows <- function (data,x=1,y=2,bp=FALSE,varwidth=FALSE){
nrows <- nrow(data)
ncols <- ncol(data)
numb.dim.cols<-ncol(data)-1
numb.dim.rows<-nrow(data)-1
a <- min(numb.dim.cols, numb.dim.rows) #dimensionality of the table
res.ca <- CA(data, ncp=a, axes=c(x, y), graph=FALSE)
resclust.rows<-HCPC(res.ca, nb.clust=-1, metric="euclidean", method="ward", order=TRUE, graph.scale="inertia", graph=FALSE, cluster.CA="rows")
plot(resclust.rows, axes=c(x,y), choice="map", draw.tree=FALSE, ind.names=TRUE, new.plot=TRUE)
write.table(resclust.rows$data.clust, "rowClusters.txt", sep="\t")
if (bp==TRUE) {
  df <- resclust.rows$data.clust
  df$coord_dim_a <- res.ca$row$coord[,x]
  df$coord_dim_b <- res.ca$row$coord[,y]
  par(mfrow=c(2,1))
  boxplot(df$coord_dim_a~df$clust, varwidth=varwidth, main="Boxplots of row coordinates by cluster", ylab=paste("Dim", x), sub="clusters")
  boxplot(df$coord_dim_b~df$clust, varwidth=varwidth, ylab=paste("Dim", y), sub="clusters")
  par(mfrow=c(1,1))
} else {
}
}