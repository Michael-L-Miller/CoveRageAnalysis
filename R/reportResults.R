#' Report focal amplification
#' 
#' This function prints summary of focal amplification z-scores.
#' @return List of samples with focal gene amplification.
#' @export
#' @examples
#' reportAmplifications()

reportAmplifications <- function() {
  GENE.SCORES=ZSCORES[grep("_", ZSCORES$Gene.Names, invert=T),]
  row.names(GENE.SCORES)=GENE.SCORES$Gene.Names
  s.gene.amp=vector("list", length(SAMPLES)) 
  gene.amp=vector()
  names(s.gene.amp)=SAMPLES
  for (s in 1:length(SAMPLES)){
      s.gene.scores=GENE.SCORES[,c(SAMPLES[s])]
      s.gene.amp[[c(SAMPLES[s])]]=grep("FALSE", ifelse(s.gene.scores >= 5, paste(row.names(GENE.SCORES), round(s.gene.scores,2), sep=", "), "FALSE"), invert=T, value=T)
      gene=grep("FALSE", ifelse(s.gene.scores >= 5, row.names(GENE.SCORES), "FALSE"), invert=T, value=T)
      gene.amp=unique(c(gene, gene.amp))
      if(length(s.gene.amp[[c(SAMPLES[s])]]) == 0){
      s.gene.amp[[c(SAMPLES[s])]]="NEGATIVE for focal amplification -- none detected"
      }
  }
  geneOrder=as.numeric(c("34", "37", "3", "25", "13", "50", "33", "10", "39", "18", "38", "30", "29", "15", "4", "9", "36", "11", "32", "46", "6", "14", "16", "27", "8", "21", "1", "35", "43", "40", "17", "24", "5", "31", "41", "23", "19", "42", "2", "26", "7", "49", "12", "44", "48", "20", "28", "47", "22", "45"))
  CoveRageAnalysis::heatmap3(as.matrix(GENE.SCORES[geneOrder ,-1]), trace="none", col=hmcol, dendrogram=c("none"), Rowv=FALSE, Colv=FALSE, key=F, margins=c(9,10), cexRow=0.5, cexCol=0.7)
  egfr.amp.label=ifelse(GENE.SCORES[grep("EGFR", row.names(GENE.SCORES)),] >= 5, "gray", "white")
  ## List containing genes and z-scores at least 5 SDs above reference mean.
  assign("egfr.amp.label", egfr.amp.label, .GlobalEnv)
  assign("GENE.SCORES", GENE.SCORES, .GlobalEnv)
  return(s.gene.amp)
}

#' Report EGFRvIII
#' 
#' This function prints summary of EGFRvIII intragenic deletion z-scores.
#' @return List of samples with EGFRvIII
#' @export
#' @examples
#' reportV3()

reportV3 <- function() {
  AMPLICON.SCORES=ZSCORES[grep("_", ZSCORES$Gene.Names, invert=F),]
  EGFR.SCORES=AMPLICON.SCORES[grep("EGFR", AMPLICON.SCORES$Gene.Names, invert=F),]
  row.names(EGFR.SCORES)=EGFR.SCORES$Gene.Names
  EGFR.SCORES=EGFR.SCORES[,2:LEN]
  EGFR.SCORES$Position=grepl("_[3-8]$", row.names(EGFR.SCORES))
  EGFR.POS=aggregate(.~Position, data=EGFR.SCORES, mean)
  EGFR.SCORES=EGFR.SCORES[,1:length(SAMPLES)]
  row.names(EGFR.POS$Position)
  EGFR.POS=EGFR.POS[,2:LEN]
  EGFRvIII=rbind(EGFR.SCORES, diff.EGFR2.7=EGFR.POS[2:2,]-EGFR.POS[1:1,])
  MERGEREF=merge(EGFRvIII, REFVALUES, by.x=0, by.y=0)
  EGFRvIII.SCORES=cbind(Amplicon=MERGEREF[,1:1],((MERGEREF[,2:LEN] - MERGEREF$Mean)/MERGEREF$Std..Deviation),deparse.level = 0)[-1:-8,]
  row.names(EGFRvIII.SCORES)=EGFRvIII.SCORES$Amplicon
  s.egfrviii.amp=vector("list", length(SAMPLES)) 
  names(s.egfrviii.amp)=SAMPLES
  for (s in 1:length(SAMPLES)){
      s.egfrviii.scores=EGFRvIII.SCORES[,c(SAMPLES[s])]
      s.egfrviii.amp[[c(SAMPLES[s])]]=grep("FALSE", ifelse(s.egfrviii.scores >= 10, paste(row.names(EGFRvIII.SCORES), round(s.egfrviii.scores,2), sep=", "), "FALSE"), invert=T, value=T)
      if(length(s.egfrviii.amp[[c(SAMPLES[s])]]) == 0){
      s.egfrviii.amp[[c(SAMPLES[s])]]="NEGATIVE for EGFRvIII -- not detected"
      }
  }
  egfr.label=rbind(ifelse(EGFRvIII.SCORES >= 10, "gray", "white"),egfr.amp.label)[,-1]
  CoveRageAnalysis::heatmap3(as.matrix(EGFR.SCORES), trace="none", col=hmcol, dendrogram=c("none"), Rowv=FALSE, Colv=FALSE, key=F, keysize=1, margins=c(30,10), ColSideColors=t(egfr.label), ColSideColorsSize=2, cexRow=1, cexCol=0.7)
  ## Listing of samples with EGFRvIII deletion (z-scores at least 10 SDs above reference mean).
  assign("AMPLICON.SCORES", AMPLICON.SCORES, .GlobalEnv)
  assign("EGFRvIII.SCORES", EGFRvIII.SCORES, .GlobalEnv)
  return(s.egfrviii.amp)
}