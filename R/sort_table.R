#' sort.table
#'
#' This function allows to sort the input contingency table according to the score of row and column categories on the selected Correspondence Analysis dimension.
#' Two plots are returned, displaying the sorted contingency table. Note that the two plots are the same, except for the fact that one is the transposed version of the other. A battleship plot for the seriated table is also provided.
#' Two tab delimited .txt files are also created in the R working directory, containing the sorted table and the sorted table converted into presence/absence data.
#' @param data: Dataframe containing the contingency table to be analysed.
#' @param dim: The dimensions (1st default) to be used to sort the contingency table (i.e., to perfom the seriation).
#' @param plot: logic value (TRUE/FALSE); if set to TRUE, two seriation plots (i.e., a Bertin plot) are returned, one the reverse of the other. FALSE is default.
#' @param battlshp: logic value (TRUE/FALSE); if set to TRUE, two 'battleship' plots are returned, one the reverse of the other. FALSE is default.
#' @keywords sort, contingency table, scores, correspondence analysis
#' @export
#' @examples
#' data("perfect_seriation"): load the dataset 'perfect_seriation'
#' sort.table (perfect_seriation,1): sort the contingency table (contained in the 'perfect_seriation' dataframe) according to the score of row and column categories on the 1 dimension of Correspondence Analysis.
#' sort.table (perfect_seriation,1, plot=TRUE, battlshp=TRUE): sort the contingency table (contained in the 'perfect_seriation' dataframe) according to the score of row and column categories on the 1 dimension of Correspondence Analysis. Seriation plots (Bertin plot) and battleship plots are also returned.
sort.table <- function (data,dim=1,plot=FALSE,battlshp=FALSE){
  nrows <- nrow(data)
  ncols <- ncol(data)
  numb.dim.cols <- ncol(data) - 1
  numb.dim.rows <- nrow(data) - 1
  a <- min(numb.dim.cols, numb.dim.rows)
  res.ca <- ca(data, nd = a)
  row.c <- res.ca$rowcoord[, dim]
  col.c <- res.ca$colcoord[, dim]
  print(sorted.table <- data[order(row.c), order(col.c)])
  print(sorted.table.PA <- apply(sorted.table, 2, function(x) ifelse(x > 0, 1, 0)))
  write.table(sorted.table, "sorted_table.txt", sep = "\t")
  write.table(sorted.table.PA, "sorted_table_PA.txt", sep = "\t")
  outp_dir <- getwd()
  print(paste("NOTE: two output .txt file have been exported to the following location:", outp_dir))
  if (plot==TRUE){
    bertinplot(as.matrix(sorted.table.PA), options = list(panel = panel.squares,spacing = 0, frame = TRUE))
    bertinplot(as.matrix(sorted.table.PA), options = list(panel = panel.squares,spacing = 0, frame = TRUE, reverse = TRUE))
  } else {
  }
  if (battlshp==TRUE){
    battleship.plot(sorted.table)
    battleship.plot(t(sorted.table))
  } else {
  }
}