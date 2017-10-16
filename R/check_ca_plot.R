#' check.ca.plot
#'
#' This function returns the Correspondence Analysis scatterplot of both row and column categories.
#' @param data: Dataframe containing the contingency table to be analysed.
#' @param x,y: The dimensions to be plotted (1st and 2nd by default).
#' @keywords correspondence analysis, plot
#' @export
#' @examples
#' data("perfect_seriation"): load the dataset 'perfect_seriation'
#' check.ca.plot (perfect_seriation,1,3): plot the Correspondence Analysis scatterplot of the 'perfect_seriation' dataframe, displaying the 1 and 3 dimensions.
#' 
check.ca.plot <- function (data, x=1, y=2){
nrows <- nrow(data)
ncols <- ncol(data)
numb.dim.cols<-ncol(data)-1
numb.dim.rows<-nrow(data)-1
a <- min(numb.dim.cols, numb.dim.rows) #dimensionality of the table
CA(data, ncp=a, axes=c(x, y))
}