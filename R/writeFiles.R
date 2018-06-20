#' Write results files
#' 
#' This function writes comma-separated files to the project directory.
#' @return The directory containing exported files.
#' @export
#' @examples
#' writeFiles()

writeFiles <- function() {
  write.csv(MERGEREF, paste(WDIR, PROJECTID, "data", "normalized-data.csv", sep="/"), quote=F, row.names=F)
  write.csv(GENE.SCORES, paste(WDIR, PROJECTID, "data", "gene.z-scores.csv", sep="/"), quote=F, row.names=F)
  write.csv(AMPLICON.SCORES, paste(WDIR, PROJECTID, "data", "amplicon.z-scores.csv", sep="/"), quote=F, row.names=F)
  write.csv(EGFRvIII.SCORES, paste(WDIR, PROJECTID, "data", "egfrviii.z-scores.csv", sep="/"), quote=F, row.names=F)
  sink(paste(WDIR, PROJECTID, "generatePDF.bat", sep="/"), append=FALSE)
  cat(paste("xelatex -output-directory=", '"', WDIR,"/",PROJECTID,'"', sep=""), paste('"', WDIR,"/",PROJECTID,"/report-",PROJECTID,".tex",'"',sep=""), sep=" ", file=paste(WDIR, PROJECTID, "generatePDF.bat", sep="/"), append=FALSE)
  sink()
  return(paste(WDIR, PROJECTID, "data/", sep="/"))
}