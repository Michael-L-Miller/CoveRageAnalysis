#' .onLoad function
#' 
#' This function generates the package's instructional welcome message using packageStartupMessage().
#' @export

.onLoad <- function(...) {
  packageStartupMessage("CoveRageAnalysis Loaded.\n")
  packageStartupMessage("Execute the following commands to run the analysis:")
  packageStartupMessage('setwd("G:\\Molec_Path_Lab/EGFRvIII/CoverageFiles/wdir")')
  packageStartupMessage('runAnalysis()')
}