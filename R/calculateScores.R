#' Calculate scores
#' 
#' This function calculates z-scores from normalized coverage matrix.
#' @return Table of z-scores.
#' @export
#' @examples
#' calculateScores()

calculateScores <- function() {
  ZSCORES=data.frame(Gene=MERGEREF[,1:1])
  ZSCORES=cbind(Gene.Names=MERGEREF[,1:1],((MERGEREF[,2:LEN] - MERGEREF$Mean)/MERGEREF$Std..Deviation), deparse.level = 0)
  tableZSCORES=ZSCORES
  row.names(tableZSCORES)=ZSCORES$Gene.Names
  tableZSCORES=tableZSCORES[,-1]
  assign("ZSCORES", ZSCORES, .GlobalEnv)
  return(tableZSCORES)
}