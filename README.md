# RNA-Seq Transcriptomic Profiling Pipeline

## Saccharomyces cerevisiae Oxidative Stress Analysis

**Author:** Mimansa Kulshrestha  
**Degree:** MSc Bioinformatics

---

## Project Overview

This project implements an **automated RNA-seq analysis pipeline** to study transcriptomic changes in *Saccharomyces cerevisiae* under oxidative stress conditions.

Oxidative stress occurs when **reactive oxygen species (ROS)** such as hydrogen peroxide accumulate and damage cellular components including proteins, lipids, and DNA. Yeast cells respond to oxidative stress through activation of antioxidant enzymes, metabolic rewiring, and stress-response pathways.

The pipeline processes raw sequencing reads obtained from the **NCBI Sequence Read Archive (SRA)** and generates gene-level expression counts for downstream **differential expression analysis**.

The workflow automates major RNA-seq processing steps using **Bash scripting and standard bioinformatics tools in a Linux environment**.

---

## Dataset Information

**Organism:** *Saccharomyces cerevisiae*  

**Data Source:** NCBI Sequence Read Archive (SRA)

### Samples Used

| Sample ID | Condition |
|-----------|-----------|
| SRR30570749 | Treatment |
| SRR30570750 | Treatment |
| SRR30570751 | Control |
| SRR30570752 | Control |

Treatment samples represent yeast exposed to oxidative stress conditions, while control samples represent normal parental yeast strains.

---

## RNA-Seq Pipeline Workflow


SRA Download
FastQC (Quality Control)
Trimmomatic (Adapter & Quality Trimming)
HISAT2 (Genome Alignment)
SAMtools (BAM Processing)
featureCounts (Gene Quantification)
Gene Count Matrix Generation
DESeq2 (Differential Expression Analysis)
Visualization (Volcano Plot, Heatmap, MA Plot)


---

## Tools Used

| Tool | Purpose |
|------|--------|
| **SRA Toolkit** | Download sequencing data |
| **FastQC** | Quality control of sequencing reads |
| **Trimmomatic** | Adapter removal and quality trimming |
| **HISAT2** | Alignment of reads to reference genome |
| **SAMtools** | SAM/BAM file processing and indexing |
| **featureCounts** | Gene-level read quantification |
| **DESeq2** | Differential gene expression analysis |
| **R (ggplot2, pheatmap)** | Visualization and statistical analysis |

---

## Repository Structure


rna-seq-yeast-oxidative-stress-pipeline
│
├── README.md
├── .gitignore
│
├── scripts
│ ├── rnaseq_pipeline_full.sh
│ ├── feature_counts.sh
│ └── post_align.sh
│
├── qc_reports
│ ├── pretrim
│ └── posttrim
│
├── results
│ ├── counts_filtered
│ ├── counts_ppb
│ └── deseq2_analysis.R
│
└── metadata
└── sample_info.txt


---

## Automation

The RNA-seq workflow is automated using **Bash scripts executed in a Linux environment**.

### Example pipeline execution

```bash
bash scripts/rnaseq_pipeline_full.sh

This script performs the following steps automatically:

Download raw FASTQ files from SRA

Perform quality control using FastQC

Trim adapters using Trimmomatic

Align reads to the yeast reference genome using HISAT2

Convert and sort alignment files using SAMtools

Quantify gene-level reads using featureCounts

Perform differential expression analysis using DESeq2 in R

Differential Expression Analysis

Differential expression analysis was performed using the DESeq2 package in R.

Analysis Steps

Load filtered gene count matrix

Create sample metadata

Construct DESeq2 dataset

Run differential expression testing

Filter significant genes

Filtering Criteria
Adjusted p-value < 0.05
|log2FoldChange| > 1
Visualization

Multiple visualizations were generated to interpret gene expression changes:

Volcano plots

Heatmaps of differentially expressed genes

MA plots for global expression changes

Violin plots for gene expression distribution

These plots help identify genes significantly regulated during oxidative stress.

Key Outcome

The analysis identifies genes whose expression levels significantly change in response to oxidative stress in Saccharomyces cerevisiae.

These results provide insights into stress-response pathways and cellular adaptation mechanisms.

Data Availability

Due to GitHub file size limitations, the following files are not included in this repository:

Raw FASTQ files

Alignment BAM files

Reference genome files

These datasets can be downloaded from NCBI SRA using the accession numbers listed above.

Skills Demonstrated

RNA-seq data analysis

Linux-based bioinformatics workflows

Bash scripting for pipeline automation

NGS data processing

Differential gene expression analysis

Biological data visualization and interpretation

Author

Mimansa Kulshrestha
MSc Bioinformatics
