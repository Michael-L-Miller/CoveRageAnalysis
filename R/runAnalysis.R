#' Run analysis
#' 
#' Wrapper function that prepares environment, performs analysis and logs summary.
#' @export
#' @examples
#' runAnalysis()

runAnalysis <- function() {
  assign("AUTHOR", as.list(Sys.info())$user, .GlobalEnv)
  assign("hmcol", colorRampPalette(RColorBrewer::brewer.pal(9, "GnBu"))(100), .GlobalEnv)
  FILELIST=grep("*.bcmatrix.xlsx", list.files(), value=T)
  for (FILE in FILELIST) {
    CoveRageAnalysis::defineFiles(FILE)
    CoveRageAnalysis::defineVariables()
    REPORT=system.file("extdata", "report.Rnw", package = "CoveRageAnalysis")
    file.copy(from=REPORT, to=paste(getwd(),"/",PROJECTID,"/report-",PROJECTID,".Rnw",sep=""))
    setwd(PROJECTID)
    knitr::knit(paste("report-",PROJECTID,".Rnw",sep=""))
    commandPDF=paste("xelatex ",WDIR,"/",PROJECTID,"/report-",PROJECTID,".tex",sep="")
    setwd("..")
    CoveRageAnalysis::logAnalysis()
    message("To generate PDF report, execute generatePDF.bat in project directory:")
    message('-- "',commandPDF,'"')
  }
}