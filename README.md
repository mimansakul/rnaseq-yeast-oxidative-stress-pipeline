## RNA-seq Pipeline Workflow

SRA Download  
↓  
Quality Control (FastQC)  
↓  
Adapter & Quality Trimming (Trimmomatic)  
↓  
Alignment to Reference Genome (HISAT2)  
↓  
SAM/BAM Processing (SAMtools)  
↓  
Gene Read Counting (featureCounts)  
↓  
Gene Count Matrix Generation  
↓  
Differential Expression Analysis (DESeq2)  
↓  
Visualization (Volcano Plot, Heatmap, MA Plot)
Or use a simple code block (looks cleaner on GitHub)
SRA Download
   │
   ▼
FastQC (Quality Control)
   │
   ▼
Trimmomatic (Adapter Trimming)
   │
   ▼
HISAT2 (Alignment)
   │
   ▼
SAMtools (Sorting & Indexing)
   │
   ▼
featureCounts (Gene Counting)
   │
   ▼
Count Matrix
   │
   ▼
DESeq2 (Differential Expression)
   │
   ▼
Visualization
This is actually enough for recruiters

They will immediately see you know the standard RNA-seq pipeline:

FastQC

Trimmomatic

HISAT2

SAMtools

featureCounts

DESeq2

That already demonstrates bioinformatics pipeline knowledge.

One more thing (important for your repo)

Add this section too in README:

## Automation

The RNA-seq pipeline is automated using Bash scripts.

Key scripts:

scripts/rnaseq_pipeline_full.sh  
scripts/feature_count.sh  
scripts/post_align.sh

This highlights your automation skills, which companies care about.

If you want, I can also show you one small README section that makes your GitHub project look much more professional for bioinformatics job applications (it takes 30 seconds to add but impresses recruiters a lot).

give me full readme now

Below is a complete README.md you can paste directly into your repository.
It is written the way bioinformatics GitHub projects are usually presented, highlighting pipeline, tools, and reproducibility — which helps when recruiters review your profile.

README.md
# RNA-Seq Transcriptomic Profiling Pipeline  
## Saccharomyces cerevisiae Oxidative Stress Analysis

**Author:** Mimansa Kulshrestha  
MSc Bioinformatics  

---

# Project Overview

This project implements an automated RNA-seq analysis pipeline to study transcriptomic changes in *Saccharomyces cerevisiae* under oxidative stress conditions.

Oxidative stress occurs when reactive oxygen species (ROS) such as hydrogen peroxide accumulate and damage cellular components including proteins, lipids, and DNA. Yeast cells respond to oxidative stress through activation of antioxidant enzymes, metabolic rewiring, and stress response pathways.

This pipeline processes raw sequencing reads obtained from the NCBI Sequence Read Archive (SRA) and generates gene-level expression counts for downstream differential expression analysis.

The workflow automates major RNA-seq processing steps using Bash scripting and standard bioinformatics tools in a Linux environment.

---

# Dataset Information

Organism: *Saccharomyces cerevisiae*

Data Source: NCBI Sequence Read Archive (SRA)

Samples used in the analysis:

| Sample ID | Condition |
|-----------|-----------|
| SRR30570749 | Treatment |
| SRR30570750 | Treatment |
| SRR30570751 | Control |
| SRR30570752 | Control |

Treatment samples represent yeast exposed to oxidative stress conditions, while control samples represent normal parental yeast strains.

---

# RNA-Seq Pipeline Workflow


SRA Download
│
▼
FastQC (Quality Control)
│
▼
Trimmomatic (Adapter & Quality Trimming)
│
▼
HISAT2 (Genome Alignment)
│
▼
SAMtools (BAM Processing)
│
▼
featureCounts (Gene Quantification)
│
▼
Gene Count Matrix
│
▼
DESeq2 (Differential Expression Analysis)
│
▼
Visualization (Volcano Plot, Heatmap, MA Plot)


---

# Tools Used

The pipeline integrates widely used bioinformatics tools:

| Tool | Purpose |
|-----|------|
| SRA Toolkit | Download sequencing data |
| FastQC | Quality control of sequencing reads |
| Trimmomatic | Adapter removal and quality trimming |
| HISAT2 | Alignment of reads to reference genome |
| SAMtools | SAM/BAM file processing and indexing |
| featureCounts | Gene-level read counting |
| DESeq2 | Differential gene expression analysis |
| R (ggplot2, pheatmap) | Visualization and statistical analysis |

---

# Repository Structure


rna-seq-yeast-oxidative-stress-pipeline
│
├── README.md
├── .gitignore
│
├── scripts
│ ├── rnaseq_pipeline_full.sh
│ ├── feature_count.sh
│ └── post_align.sh
│
├── qc_reports
│ ├── pretrim
│ └── posttrim
│
├── results
│ ├── counts_filtered
│ ├── counts_pPB
│ └── deseq2_analysis.R
│
├── metadata
│ └── sample_info.txt


---

# Automation

The RNA-seq workflow is automated using Bash scripts executed in a Linux environment.

Example pipeline execution:

```bash
bash scripts/rnaseq_pipeline_full.sh

This script performs the following steps automatically:

Download raw FASTQ files from SRA

Run FastQC quality control

Perform adapter trimming using Trimmomatic

Align reads to the yeast reference genome using HISAT2

Convert and sort alignment files using SAMtools

Quantify gene-level reads using featureCounts

Differential Expression Analysis

Differential expression analysis was performed using the DESeq2 package in R.

Analysis steps include:

Loading filtered gene count matrix

Creating sample metadata

Constructing DESeq2 dataset

Running differential expression testing

Filtering significant genes

Filtering criteria:

Adjusted p-value < 0.05
|log2FoldChange| > 1
Visualization

Multiple visualizations were generated to interpret gene expression changes:

• Volcano plots
• Heatmaps of differentially expressed genes
• MA plots for global expression changes
• Violin plots for gene expression distribution

These plots help identify genes significantly regulated during oxidative stress.

Key Outcome

The analysis identifies genes whose expression levels significantly change in response to oxidative stress in Saccharomyces cerevisiae. These genes may play important roles in stress response pathways, antioxidant defense mechanisms, and cellular adaptation processes.

Note on Data Availability

Due to GitHub file size limitations, the following files are not included in this repository:

• Raw FASTQ files
• Alignment BAM files
• Reference genome files

These can be downloaded from NCBI SRA using the accession numbers listed above.

Skills Demonstrated

This project demonstrates practical experience in:

• RNA-seq data analysis
• Linux-based bioinformatics workflows
• Bash scripting for pipeline automation
• NGS data processing
• Differential gene expression analysis
• Data visualization and interpretation

Author

Mimansa Kulshrestha
MSc Bioinformatics
