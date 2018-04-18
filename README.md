# CoveRageAnalysis

## General Purpose

This set of scripts, written in BASH and *R*, are designed to convert next-generation sequencing data, specifically read-coverage from a Hotspot panel, into z-scores that are then used to identify focal gene amplification and intragenic deletions, such as EGFR and EGFRvIII, respectively.

## Components
* CoverageAnalysisWrapper.sh – Wrapper shell script that organizes files and defines variables used for downstream analysis by R.
* CoverageAnalysisTemplate.Rnw – Template tex file with embedded R commands that contains the bulk, or static components, of the coverage analysis.

## General Usage Instructions
* Input: Two Excel files (preferably in .xlsx format) generated from Ion Torrent containing (1) coverage matrix and (2) sample metadata with at least total mapped reads (used for normalization).
* Output: Directory containing data-tables (comma-separated values) and report with results (tex and PDF if latex is available, see below, else markdown). 

## Dependencies
* R (tested on R version 3.3.2 (2016-10-31) -- "Sincere Pumpkin Patch")
- stargazer (tested with v5.2.1)
- RColorBrewer (tested with v1.1-2)
- formatR (tested with v1.5)
- gdata (tested with v2.18.0)
- knitr (tested with v1.20)
- Heatmap.3.R (included in repository, forked from obigriffith/biostar-tutorials)
* Latex (tested on pdfTeX 3.14159265-2.6-1.40.18, TeX Live 2017)

## Disclaimer
**These scripts are made available for educational purposes only.** Use outside of that scope is at the sole discretion of the end-user but must follow the license.
