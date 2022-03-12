#' Project 1 myDDT function
#'
#' This function was created for Project 1, and manipulates the data within the
#' DDT dataframe to provide a plot and information within the console based on
#' a user-input value for fish species.
#' @param ddt ddt dataframe
#' @param speciesType string value indiciating the fish species type
#'
#' @import ggplot2
#' @import dplyr
#' @importFrom utils write.csv
#'
#' @export

myDDT <- function(ddt, speciesType){
  LENGTH <- WEIGHT <- SPECIES <- RIVER <- NULL

  # Manipulating the data with dplyr
  ddtAltered <- ddt %>%
    dplyr::select(c(LENGTH, WEIGHT, SPECIES, RIVER)) %>%
    dplyr::filter(SPECIES == speciesType)

  # Creating ggplot of LENGTH vs WEIGHT with a quadratic curve from the data
  ddtPlot <- ggplot(ddtAltered, aes(LENGTH, WEIGHT)) +
    geom_point(aes(color = RIVER)) +
    stat_smooth(aes(LENGTH, WEIGHT), method = "lm", formula = y ~ x + I(x^2)) +
    labs(title = "Joseph Grimes")

  # Printing ggplot
  print(ddtPlot)

  # The names of the ddt dataframe used to make the plot, ddtAltered,
  # and the ddt dataframe before subsetting, ddt
  name1 <- "ddt"
  name2 <- "ddtAltered"

  # Relative freuency table for RIVERS in DDT before subsetting
  relativeFreqTab <- table(ddt$RIVER)/length(ddt$RIVER)

  # Print the dataframe names and relative frequency table to the console
  print(list(name1, name2, round(relativeFreqTab, 5)))

  # Write dataframe used to make plot to CSV
  csvFileName = paste0("LvsWfor",speciesType)
  write.csv(ddtAltered, csvFileName, row.names = TRUE)
}


