# RNA-Seq Pipeline for Saccharomyces cerevisiae Oxidative Stress

Author: Mimansa Kulshrestha

## Project Overview
This project implements an automated RNA-seq analysis pipeline to study transcriptomic changes in Saccharomyces cerevisiae under oxidative stress conditions.

## Pipeline Steps
1. Download reads from SRA
2. Quality control using FastQC
3. Adapter trimming using Trimmomatic
4. Alignment to yeast genome using HISAT2
5. BAM processing using SAMtools
6. Gene quantification using featureCounts
7. Differential expression analysis using DESeq2

## Tools Used
FastQC  
Trimmomatic  
HISAT2  
SAMtools  
featureCounts  
DESeq2  

## Dataset
Organism: Saccharomyces cerevisiae

Treatment:
SRR30570749  
SRR30570750  

Control:
SRR30570751  
SRR30570752  

## Output
Gene count matrix and differential expression analysis results.

Note: Raw FASTQ and BAM files are not included due to large file size.
