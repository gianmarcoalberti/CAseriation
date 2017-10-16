#' evaluate
#'
#' This function returns the Correspondence Analysis scatterplot of row/column categories with a 2nd order polynomial fit. The Rsquared value is reported in the plot's subtitle. 
#' The function allows gauging to what extent the seriation structure (if any) embedded in the data approximates to a 'perfect' seriation.
#' @param data: Dataframe containing the contingency table to be analysed.
#' @param x,y: The dimensions to be plotted (1st and 2nd by default).
#' @param which: use R for rows, C for colums.
#' @keywords evaluation, seriation, 2nd order polynomial, fit
#' @export
#' @examples
#' data("cemetery"): load the dataset 'cemetery'
#' evaluate(cemetery,1,2,which='R'): plot the Correspondence Analysis scatterplot of row categories (using the 'cemetery' dataset), displaying the 1 and 2 dimensions; a 2nd order polynomial fit is displayed and the Rsquared value is reported.
#' 
evaluate <- function (data, x=1, y=2, which){
  nrows <- nrow(data)
  ncols <- ncol(data)
  numb.dim.cols<-ncol(data)-1
  numb.dim.rows<-nrow(data)-1
  a <- min(numb.dim.cols, numb.dim.rows) #dimensionality of the table
  res <- CA(data, ncp=a, graph=FALSE)
  if (which=='R') {
    scores1 <- res$row$coord[,x]
    scores2 <- res$row$coord[,y]
    pnt_labls <- rownames(data)
    plot.title = "CA rows scatterplot with 2nd order polynomial fit"
  } else {
    scores1 <- res$col$coord[,x]
    scores2 <- res$col$coord[,y]
    pnt_labls <- colnames(data)
    plot.title = "CA columns scatterplot with 2nd order polynomial fit"
  }
  fit2 <- lm(scores2 ~ scores1 + I(scores1^2))
  rsquared <- summary(fit2)$r.squared
  dataf <-as.data.frame(cbind(scores1,scores2))
  plot.subtitle = paste("Rsquared", round(rsquared, digit=3))
  p <- ggplot(dataf, aes(x = scores1, y = scores2)) + geom_point() + stat_smooth(method = "lm", formula = y ~ x + I(x^2), size = 1) + xlab(paste("Dim.",x)) + ylab(paste("Dim.", y)) + geom_hline(yintercept=0, colour="black", line) + geom_vline(xintercept=0, colour="black", line) + ggtitle(bquote(atop(.(plot.title), atop(italic(.(plot.subtitle)), ""))))
  print(p)
}