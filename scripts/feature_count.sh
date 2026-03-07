#!/bin/bash

# --- CONFIGURATION ---
SRRS=(SRR30570749 SRR30570750 SRR30570751 SRR30570752)
ALIGNMENTS="/home/mimansa/RNA_PROJECT/alignments"
GTF_ANNOTATION="/home/mimansa/RNA_PROJECT/whole_genome/Saccharomyces_cerevisiae.R64-1-1.115.gtf"
RESULTS="/home/mimansa/RNA_PROJECT/results"

mkdir -p "$RESULTS"

# --- BAM files assumed already sorted and indexed ---

# --- Counting with featureCounts for paired-end data ---
echo "Counting with featureCounts in paired-end mode"
featureCounts -p -B -a "$GTF_ANNOTATION" -o "$RESULTS/counts.txt" "$ALIGNMENTS"/*.sorted.bam

echo "All done! Final gene counts table: $RESULTS/counts.txt"
