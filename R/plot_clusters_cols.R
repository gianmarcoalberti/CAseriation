#' plot.clusters.cols
#'
#' This function returns the Correspondence Analysis scatterplot of column categories, with points' colour according to the clusters to which points belong.
#' A tab delimited .txt file is also created (in the R working directory) containing the cluster membership for each colum category.
#' @param data: Dataframe containing the contingency table to be analysed.
#' @param x,y: The dimensions to be plotted (1st and 2nd by default).
#' @param bp: logical value (TRUE/FALSE). TRUE displays boxplots of column coordinates by cluster, in order to visually gauge the degree of separation between clusters. FALSE is default.
#' @param varwidth: logical value (TRUE/FALSE). TRUE sets the width of the boxplots proportional to the groups size. This helps in eyeballing the size of the clusters being compared. FALSE is default.
#' @keywords cluster, columns, correspondence analysis
#' @export
#' @examples
#' data("perfect_seriation"): load the dataset 'perfect_seriation'
#' plot.clusters.cols (perfect_seriation,2,3): plot the Correspondence Analysis scatterplot of column categories (using the 'perfect_seriation' dataframe), displaying the 2 and 3 dimensions.
#' plot.clusters.cols (cemetery,1,2,bp=TRUE,varwidth=TRUE): plot the Correspondence Analysis scatterplot of column categories (using the 'cemetery' dataframe), displaying the 1 and 2 dimension. Boxplots of column coordinates (on the selected dimensions) by cluster are also displayed, with size proportional to the size of the clusters.
plot.clusters.cols <- function (data,x=1,y=2,bp=FALSE,varwidth=FALSE){
nrows <- nrow(data)
ncols <- ncol(data)
numb.dim.cols<-ncol(data)-1
numb.dim.rows<-nrow(data)-1
a <- min(numb.dim.cols, numb.dim.rows) #dimensionality of the table
res.ca <- CA(data, ncp=a, axes=c(x, y), graph=FALSE)
resclust.cols<-HCPC(res.ca, nb.clust=-1, metric="euclidean", method="ward", order=TRUE, graph.scale="inertia", graph=FALSE, cluster.CA="columns")
plot(resclust.cols, axes=c(x,y), choice="map", draw.tree=FALSE, ind.names=TRUE, new.plot=TRUE)
write.table(resclust.cols$data.clust, "colClusters.txt", sep="\t")
if (bp==TRUE) {
df <- resclust.cols$data.clust
df$coord_dim_a <- res.ca$col$coord[,x]
df$coord_dim_b <- res.ca$col$coord[,y]
par(mfrow=c(2,1))
boxplot(df$coord_dim_a~df$clust, varwidth=varwidth, main="Boxplots of column coordinates by cluster", ylab=paste("Dim", x), sub="clusters")
boxplot(df$coord_dim_b~df$clust, varwidth=varwidth, ylab=paste("Dim", y), sub="clusters")
par(mfrow=c(1,1))
} else {
}
}