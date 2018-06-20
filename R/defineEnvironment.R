#' Define files
#' 
#' This function defines environmental files.
#' @export
#' @param FILE name of *.bcmatrix.xlsx in current working directory
#' @examples
#' defineFiles("/path/to/bcmatric.xlsx")

defineFiles <- function(FILE=FILE) {
  #FILE=grep("*.bcmatrix.xlsx", list.files(), value=T)
  #ifelse(length(FILE)==1, paste("Found datafile:", FILE), q("no", status=1))
  assign("WDIR", getwd(), .GlobalEnv)
  DF=gdata::read.xls(paste(WDIR, FILE, sep="/"), sheet = 1, header = TRUE, stringsAsFactors=F) 
  SUMMARY=gsub("bcmatrix", "bc_summary", FILE)
  #ifelse(length(grep(SUMMARY, list.files(), value=T))==1, paste("Found metafile:", SUMMARY), q("no", status=1))
  META=gdata::read.xls(paste(WDIR, SUMMARY, sep="/"), sheet = 1, header = TRUE, stringsAsFactors=F) 
  #rownames(REFVALUES)=REFVALUES$Sample
  AMPLICONS=as.character(DF$Target)
  row.names(DF)=AMPLICONS
  DF=DF[,-1:-2]
  SAMPLES=as.vector(META$Sample.Name)
  colnames(DF)=SAMPLES
  assign("LEN", length(SAMPLES)+1, .GlobalEnv)
  #NORM=META$Mapped.Reads
  #assign("REFVALUES", REFVALUES, .GlobalEnv)
  assign("FILE", FILE, .GlobalEnv)
  assign("SUMMARY", SUMMARY, .GlobalEnv)
  assign("DF", DF, .GlobalEnv)
  assign("SAMPLES", SAMPLES, .GlobalEnv)
  assign("META", META, .GlobalEnv)
}

#' Define variables
#' 
#' This function defines environmental variables.
#' @export
#' @examples
#' defineVariables()

defineVariables <- function() {
  assign("TIME", format(Sys.time(), "%H:%M:%S"), .GlobalEnv)
  assign("DATE", format(Sys.time(), "%Y-%m-%d"), .GlobalEnv)
  assign("PROJECTID", paste(DATE, gsub(":", "", TIME), sep="-"), .GlobalEnv)
  dir.create(paste(PROJECTID, "data", sep="/"), showWarnings = FALSE, recursive = TRUE)
  dir.create(paste(PROJECTID, "figures", sep="/"), showWarnings = FALSE, recursive = TRUE)
}