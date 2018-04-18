# CoveRageAnalysis

## General Purpose

This set of scripts, written in BASH and *R*, are designed to convert next-generation sequencing data, specifcally read-coverage from a Hotspot panel, into z-scores that are then used to identify focal gene amplification and intragenic deletions, such as EGFR and EGFRvIII, respectively.

## Components
* CoverageAnalysisWrapper.sh – wrapper shell script that organizes files and defines variables used for downstream analysis by R.
* CoverageAnalysisTemplate-v1.Rnw – Template tex file with embedded R commands that contains the bulk, or static components, of the coverage analysis.

## General Useage Instructions
