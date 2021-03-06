#' @title Residual vs Fitted Plot
#' @description It is a scatter plot of residuals on the y axis and fitted values on the x axis to 
#' detect non-linearity, unequal error variances, and outliers.
#' @param model an object of class \code{lm}
#' details Characteristics of a well behaved residual vs fitted plot:
#'
#' \itemize{
#'   \item The residuals spread randomly around the 0 line indicating that the relationship is linear.
#'   \item The residuals form an approximate horizontal band around the 0 line indicating homogeneity of error variance.
#'   \item No one residual is visibly away from the random pattern of the residuals indicating that there are no outliers.
#' }
#'
#' @examples
#' model <- lm(mpg ~ disp + hp + wt, data = mtcars)
#' ols_rvsp_plot(model)
#' @export
#'
ols_rvsp_plot <- function(model) {

	if (!all(class(model) == 'lm')) {
    stop('Please specify a OLS linear regression model.', call. = FALSE)
  }

	predicted <- NULL
	resid <- NULL

  d <- rvspdata(model)
	p <- ggplot(d, aes(x = predicted, y = resid))
	p <- p + geom_point(shape = 1, colour = 'blue')
	p <- p + xlab('Fitted Value') + ylab('Residual')
	p <- p + ggtitle('Residual vs Fitted Values')
	p <- p + geom_hline(yintercept = 0, colour = 'red')
	print(p)

}