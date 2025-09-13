# Load data
data <- read.csv("C:/Users/OneDrive/Desktop/Dataset.csv")  


# Make a volcano plot
with(data, plot(log2FoldChange , -log10(pvalue),
                pch=20, main="Volcano Plot",
                xlab="log2FoldChange", ylab="-Log10(p-value)"))

# Add threshold lines
abline(v=c(-1,1), col="blue", lty=2)     # Log2FC cutoff
abline(h=-log10(0.01), col="red", lty=2) # p-value cutoff



##Identify Up-regulated Genes
upregulated <- subset(data, log2FoldChange > 1 & pvalue < 0.01)
head(upregulated)


##
##Identify down regulated Genes
downregulated <- subset(data, log2FoldChange < -1 & pvalue < 0.01)
head(downregulated)



# Sort by p-value (or abs(log2FC))
top5_up <- head(upregulated[order(upregulated$pvalue), ], 5)
top5_down <- head(downregulated[order(downregulated$pvalue), ], 5)

top5_up$Gene
top5_down$Gene


