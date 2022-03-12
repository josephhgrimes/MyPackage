#' Normal distribution plotting function
#'
#' This function will create a normal distribution given then mean and standard deviation,
#' and will calculate area under the distribution from negative infinity to a, a user-input parameter.
#'
#' @param mu decimal or integer center of distribution
#' @param sigma decimal or integer standard deviation
#' @param a upper limit for the area under the distribution
#'
#' @examples
#' myNormCurve(2, 3, 1)
#' myNormCurve(4, 1, 5)
#'
#' @importFrom stats dnorm pnorm
#'
#' @export
myNormCurve = function(mu, sigma, a){
  # Creating null x variable for use in curve function
  x <- NULL
  # Creating curve from parameters
  curve(dnorm(x, mean = mu, sd = sigma), xlim = c(mu - 3*sigma, mu + 3*sigma), ylab = "Density")
  # Creating polygon
  xcurve <- seq(mu - 3*sigma,  a, length = 1000)
  ycurve <- dnorm(xcurve, mu, sigma)
  polygon(c(mu - 3*sigma, xcurve, a), c(0, ycurve, 0), col = "Green")
  # Calculating density (area)
  area = pnorm(a, mu, sigma)
  arear = round(area, 4)
  # Outputting area to command line
  return(paste0("Area = ", arear))
}
