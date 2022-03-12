#' Read in CSV files
#'
#' This function will read in CSV files in a way that is preferable to use in
#' class.
#'
#' @param csv Alphanumeric file path
#'
#' @examples \dontrun{myRead("SPRUCE.csv")}
#'
#' @importFrom utils read.table
#'
#' @export
myRead=function(csv){
  dird = paste(getwd(),"/",sep = "")
  fl = paste(dird,csv,sep = "")
  read.table(fl,header=TRUE,sep = ",")
}
