# ---------------------------
# STEP 1: Load Required Packages
# ---------------------------
# Install packages once if not already installed
# install.packages(c("ggplot2", "dplyr"))

install.packages("ggplot2")
library(ggplot2)  # for visualization
install.packages("dplyr")
library(dplyr)    # for data manipulation

# ---------------------------
# STEP 2: Import the Dataset
# ---------------------------
# Replace with your actual CSV path
data <- read.csv("C:/Users/dgdur/OneDrive/Desktop/Dataset.csv")

# Quick check
head(data)
colnames(data)  # Should show: Gene, log2FoldChange, pvalue, padj

# ---------------------------
# STEP 3: Basic Data Transformation
# ---------------------------
# Ensure numeric columns
data$log2FoldChange <- as.numeric(data$log2FoldChange)
data$pvalue <- as.numeric(data$pvalue)

# Transform p-values for volcano plot (-log10)
data$negLog10P <- -log10(data$pvalue)

# ---------------------------
# STEP 4: Classify Significance
# ---------------------------
# Upregulated: Log2FC > 1 & pvalue < 0.01
# Downregulated: Log2FC < -1 & pvalue < 0.01
data$Significance <- ifelse(data$log2FoldChange > 1 & data$pvalue < 0.01, "Upregulated",
                            ifelse(data$log2FoldChange < -1 & data$pvalue < 0.01, "Downregulated",
                                   "Not Significant"))

# Check how many in each category
table(data$Significance)

# ---------------------------
# STEP 5: Extract Upregulated and Downregulated Genes
# ---------------------------
up_genes <- data %>% filter(Significance == "Upregulated")
down_genes <- data %>% filter(Significance == "Downregulated")

# ---------------------------
# STEP 6: Print Top 5 Gene Names (upregulate and downregulate)  
# ---------------------------
cat("Top 5 Upregulated Genes:\n")
print(head(up_genes$Gene, 5))

cat("\nTop 5 Downregulated Genes:\n")
print(head(down_genes$Gene, 5))

# ---------------------------
# STEP 7: Volcano Plot
# ---------------------------
volcano <- ggplot(data, aes(x=log2FoldChange, y=negLog10P, color=Significance)) +
  geom_point(alpha=0.8, size=2) +
  scale_color_manual(values=c("Upregulated"="red",
                              "Downregulated"="blue",
                              "Not Significant"="grey")) +
  geom_vline(xintercept=c(-1,1), linetype="dashed") +
  geom_hline(yintercept=-log10(0.01), linetype="dashed") +
  theme_minimal() +
  labs(title="Volcano Plot of RNA-seq Data",
       x="Log2 Fold Change",
       y="-Log10(p-value)") +
  theme(plot.title = element_text(hjust=0.5))

# Display the volcano plot
print(volcano)

# ---------------------------
# STEP 8: Save Full Lists 
# ---------------------------
write.csv(up_genes, "Upregulated_Genes.csv", row.names=FALSE)
write.csv(down_genes, "Downregulated_Genes.csv", row.names=FALSE)





