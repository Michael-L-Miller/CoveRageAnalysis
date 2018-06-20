#' Log analysis
#' 
#' Logs analysis for future reference.
#' @export
#' @examples
#' logAnalysis()

logAnalysis <- function() {
   cat(paste(PROJECTID, AUTHOR, FILE, SAMPLES, sep=","),sep="\n", file="CoveRageAnalysis.csv.log", append=TRUE)
}