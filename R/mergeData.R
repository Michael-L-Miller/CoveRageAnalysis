#' Merge data
#' 
#' This function merges amplicon- and gene-wise coverage data.
#' @export
#' mergeData()

mergeData <- function() {
  DFNORM=as.data.frame(t(DFNORM)[grep("gene.name", rownames(t(DFNORM)), invert=TRUE),], stringsAsFactors=F)
  MERGED=merge(DFNORM,t(DFNORMGENE),by.x=0,by.y=0)
  row.names(MERGED)=MERGED$Row.names
  MERGED=as.data.frame(t(MERGED[,2:258]), stringsAsFactors=F)
  MERGED[,1:dim(MERGED)[2]]=sapply(MERGED[,1:dim(MERGED)[2]], as.numeric)
  MERGEREF=merge(MERGED, REFVALUES, by.x=0, by.y=0)
  assign("MERGEREF", MERGEREF, .GlobalEnv)
}