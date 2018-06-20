#' Normalize amplicons
#' 
#' This function normalizes coverage data.
#' @export
#' @examples
#' normalizeAmplicons()

normalizeAmplicons <- function() {
  NORM=META$Mapped.Reads
  DFNORM=as.data.frame(t(apply(DF, 1, function(x) x/NORM*100000)))
  head(round(DFNORM, digits=2))
  DFNORM$gene.name=sapply(strsplit(rownames(DFNORM), "_"), "[", 2)
  assign("DFNORM", DFNORM, .GlobalEnv)
}

#' Normalize genes
#' 
#' This function extracts the normalized gene coverage from the dataframe.
#' @export
#' @examples
#' normalizeGenes()

normalizeGenes <- function() {
  DFNORMGENE=aggregate(.~gene.name, data=DFNORM, mean)
  rownames(DFNORMGENE)=DFNORMGENE$gene.name
  DFNORMGENE=DFNORMGENE[,-1]
  head(round(DFNORMGENE, digits=2))
  assign("DFNORMGENE", DFNORMGENE, .GlobalEnv)
}