---
output:
  md_document:
    variant: markdown_github
---

[![DOI](https://zenodo.org/badge/129794506.svg)](https://zenodo.org/badge/latestdoi/129794506)

!-- README.md is generated from README.Rmd. Please edit README.Rmd  -->

```{r, echo = FALSE}
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "README-"
)
```

# CoveRageAnalysis

The goal of CoveRageAnalysis is to convert read coverage from targeted next-generation sequencing data, specifically derived from the Ion Torrent AmpliSeq Cancer Hotspot Panel V2, into z-scores that are then used to identify focal gene amplification and EGFRvIII.

# Standard Operating Procedure

## Installing Package
* Install Strawberry Perl for Windows
* Install MikTex for Windows
* Install *R* and RStudio for Windows
* Open *R*, install the following required packages, then Build package source with RStudio ()
```{r installation}
 # install.packages(c("RColorBrewer","formatR","gdata","knitr"))
 # setwd("/path/to/package-directory/")
 # Select "Tools > New Terminal Window"
 # R CMD build CoveRageAnalysis
```
* Manually install CoveRageAnalysis.tar.gz from 

## Executing Package

* Open *R* and execute the following commands:
  # Filenames and folders should not contain spaces. Only use short alphanumeric strings with underscores.
  library(CoveRageAnalysis)
  setwd("/path/to/workingDirectory")
  runAnalysis()
* Navigate to each project folder within the working directory and run "generatePDF.bat"
