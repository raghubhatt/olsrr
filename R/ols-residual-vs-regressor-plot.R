#' @title Residual vs Regressors Plot
#' @description Graph to determine whether we should add a new predictor to the model already containing other predictors.
#' The residuals from the model is regressed on the new predictor and if the plot shows non random pattern, 
#' you should consider adding the new predictor to the model.
#' @param model an object of class \code{lm}
#' @param variable new predictor to be added to the \code{model}
#' @examples
#' model <- lm(mpg ~ disp + hp + wt, data = mtcars)
#' ols_rvsr_plot(model, mtcars$drat)
#' @export
#'
ols_rvsr_plot <- function(model, variable) {

	if (!all(class(model) == 'lm')) {
    stop('Please specify a OLS linear regression model.', call. = FALSE)
  }

	x <- NULL
	y <- NULL
	d <- rvsrdata(model)
	v <- l(deparse(substitute(variable)))
	k <- data.frame(x = variable, y = model$residuals)

	p <- ggplot(k, aes(x = x, y = y)) +
		geom_point(shape = 1, colour = 'blue') +
		xlab(paste(v)) + ylab('Residual') +
		ggtitle(paste("Residual vs", v)) +
		geom_hline(yintercept = 0, colour = 'red')
		
	print(p)

}