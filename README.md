# CoveRageAnalysis

## General Purpose

These scripts, written in BASH and *R*, are designed to convert next-generation sequencing data, specifically read-coverage from a Hotspot panel, into z-scores that are then used to identify focal gene amplification and intragenic deletions, such as EGFR and EGFRvIII, respectively.

## Components
* CoverageAnalysisWrapper.sh – Wrapper shell script that organizes files and defines variables used for downstream analysis by R.
* CoverageAnalysisTemplate.Rnw – Template tex file with embedded *R* commands that contains the bulk, or static components, of the coverage analysis.

## General Usage Instructions
* Input: Two Excel files (preferably in ``.xlsx`` format) generated from Ion Torrent containing (1) coverage matrix and (2) sample metadata with at least total mapped reads (used for normalization).
  - Excel files, located in the data directory (``$DATADIR``), must have filenames with:
    1. matching prefix
    2. "bcmatrix" to indicate matrix and "bc_summary" to indicate metadata.
  - Reference data as tab-separated values filenamed RefValues.tsv within the script directory (``$SCRIPTDIR``)
  - Base Knitr file (either .Rnw or .Rmd) within the script directory (``$SCRIPTDIR``)
* Output: Directory containing data-tables (comma-separated values) and report with results (tex and PDF if latex is available, see below, else markdown).
* Recommended workflow:
  - Place script and Excel files into a single location and run shell script with ``-S`` (or ``--silent-all``) option to suppress all prompts and execute with default settings.
  - Execute shell script with ``-h`` or ``--help`` option for additional instructions.

## Dependencies
* *R* (tested on R version 3.3.2 (2016-10-31) -- "Sincere Pumpkin Patch")
  - stargazer (tested with v5.2.1)
  - RColorBrewer (tested with v1.1-2)
  - formatR (tested with v1.5)
  - gdata (tested with v2.18.0)
  - knitr (tested with v1.20)
  - Heatmap.3.R (included in repository, forked from obigriffith/biostar-tutorials)
* Latex (tested on pdfTeX 3.14159265-2.6-1.40.18, TeX Live 2017)

## Disclaimer
**These scripts are made available as-is for educational purposes only.** Use outside of that scope is at the sole discretion of the end-user but must follow the software license.

## Versioning
* Wrapper and Knitr files are tracked together. See Knitr file for detailed information.
