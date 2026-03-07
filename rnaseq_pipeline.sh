#!/bin/bash

# --- CONFIGURATION ---

# Control samples
CTRL=(SRR30570751 SRR30570752)
# Treatment samples (oxidative stress)
TRMT=(SRR30570749 SRR30570750)
# All samples
SRRS=(SRR30570749 SRR30570750 SRR30570751 SRR30570752)

GENOME_INDEX="/home/mimansa/RNA_PROJECT/whole_genome/yeast_reference_index"
GTF_ANNOTATION="/home/mimansa/RNA_PROJECT/whole_genome/Saccharomyces_cerevisiae.R64-1-1.115.gtf"
RAW_READS="/home/mimansa/RNA_PROJECT/raw_reads"
QC_PRE="/home/mimansa/RNA_PROJECT/fastqc_reports/pretrim"
QC_POST="/home/mimansa/RNA_PROJECT/fastqc_reports/posttrim"
TRIMMED_READS="/home/mimansa/RNA_PROJECT/trimmed_reads"
ALIGNMENTS="/home/mimansa/RNA_PROJECT/alignments"
RESULTS="/home/mimansa/RNA_PROJECT/results"
TRIMGALORE="/home/mimansa/RNA_PROJECT/tools/TrimGalore-master/trim_galore"

mkdir -p $RAW_READS $QC_PRE $QC_POST $TRIMMED_READS $ALIGNMENTS $RESULTS

# --- STEP 1: Download SRA FASTQ files (gzip) ---
echo "Step 1: Downloading FASTQ files from SRA"
for srr in "${SRRS[@]}"; do
    fastq-dump --split-files --gzip -O $RAW_READS $srr
done

# --- STEP 2: QC raw reads (FastQC) ---
echo "Step 2: FastQC on raw FASTQ"
fastqc -o $QC_PRE $RAW_READS/*_1.fastq.gz $RAW_READS/*_2.fastq.gz

# --- STEP 3: Trimming (Trim Galore) ---
echo "Step 3: Adapter and quality trimming"
for srr in "${SRRS[@]}"; do
    $TRIMGALORE --paired --illumina -o $TRIMMED_READS \
        $RAW_READS/${srr}_1.fastq.gz $RAW_READS/${srr}_2.fastq.gz
done

# --- STEP 4: QC after trimming (FastQC) ---
echo "Step 4: FastQC on trimmed FASTQ"
fastqc -o $QC_POST $TRIMMED_READS/*_val_1.fq.gz $TRIMMED_READS/*_val_2.fq.gz

# --- STEP 5: Alignment to reference (HISAT2) ---
echo "Step 5: Alignment (HISAT2)"
for srr in "${SRRS[@]}"; do
    hisat2 -x $GENOME_INDEX \
        -1 $TRIMMED_READS/${srr}_1_val_1.fq.gz \
        -2 $TRIMMED_READS/${srr}_2_val_2.fq.gz \
        -S $ALIGNMENTS/${srr}.sam
done

# --- STEP 6: Convert SAM to BAM, sort, index (samtools) ---
echo "Step 6: BAM conversion, sorting, indexing"
for srr in "${SRRS[@]}"; do
    samtools view -bS $ALIGNMENTS/${srr}.sam | samtools sort -o $ALIGNMENTS/${srr}.sorted.bam
    samtools index $ALIGNMENTS/${srr}.sorted.bam
done

# --- STEP 7: Counting (featureCounts) ---
echo "Step 7: Counting with featureCounts"
featureCounts -a $GTF_ANNOTATION -o $RESULTS/counts.txt $ALIGNMENTS/*.sorted.bam

echo "Pipeline complete. Gene counts table: $RESULTS/counts.txt"
