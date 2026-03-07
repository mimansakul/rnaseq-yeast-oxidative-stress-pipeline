# Load DESeq2 package
if (!requireNamespace("BiocManager", quietly=TRUE))
    install.packages("BiocManager")
BiocManager::install("DESeq2")
library(DESeq2)

# Read filtered counts matrix (adjust path as needed)
counts <- read.table("counts_filtered.txt", header=TRUE, row.names=1, check.names=FALSE)

# Extract expression matrix (counts start at column 7)
count_matrix <- counts[, 7:ncol(counts)]

# Define sample metadata (change conditions as per your experiment)
sample_info <- data.frame(
    row.names = colnames(count_matrix),
    condition = factor(c("control", "control", "treated", "treated"))
)

# Create DESeqDataSet
dds <- DESeqDataSetFromMatrix(countData=count_matrix, colData=sample_info, design=~condition)

# Prefilter genes with low counts (optional, since already filtered)
keep <- rowSums(counts(dds)) >= 10
dds <- dds[keep, ]

# Run DESeq differential expression pipeline
dds <- DESeq(dds)

# Extract results and summary
res <- results(dds)
summary(res)

# Save significant genes (adjust alpha as needed)
sig_genes <- subset(res, padj < 0.05)
write.csv(as.data.frame(sig_genes), "DESeq2_significant_genes.csv")

# Generate basic plots
plotMA(res, ylim=c(-5,5))
rld <- rlog(dds, blind=FALSE)
plotPCA(rld, intgroup="condition")
