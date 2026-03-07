
#!/bin/bash

# --- CONFIGURATION ---
SRRS=(SRR30570749 SRR30570750 SRR30570751 SRR30570752)
ALIGNMENTS="/home/mimansa/RNA_PROJECT/alignments"
GTF_ANNOTATION="/home/mimansa/RNA_PROJECT/whole_genome/Saccharomyces_cerevisiae.R64-1-1.115.gtf"
RESULTS="/home/mimansa/RNA_PROJECT/results"

mkdir -p "$ALIGNMENTS" "$RESULTS"

# --- STEP 1: Sort and index BAM files ---
echo "Step 1: BAM conversion, sorting, and indexing"
for srr in "${SRRS[@]}"; do
    samtools sort -o "$ALIGNMENTS/${srr}.sorted.bam" "$ALIGNMENTS/${srr}.sam"
    samtools index "$ALIGNMENTS/${srr}.sorted.bam"
done

# --- STEP 2: featureCounts paired-end counting ---
echo "Step 2: Counting with featureCounts"
featureCounts -p -B -a "$GTF_ANNOTATION" -o "$RESULTS/counts.txt" "$ALIGNMENTS"/*.sorted.bam

echo "All done! Final gene counts table: $RESULTS/counts.txt"
