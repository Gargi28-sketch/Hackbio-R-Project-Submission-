
# STEP 1: Load Required Packages
# Install once if not done:

install.packages("ggplot2")
library(ggplot2)  # for visualization
install.packages("dplyr")
library(dplyr)    # for data manipulation


# STEP 2: Import the Dataset
data <- read.csv("C:/Users/dgdur/OneDrive/Desktop/Dataset.csv")

# Check the first few rows
head(data)

# Check column names
colnames(data)

# STEP 3: Basic Data Transformation

# Ensure the columns are numeric
data$log2FoldChange <- as.numeric(data$log2FoldChange)
data$pvalue <- as.numeric(data$pvalue)

# Transform p-values for volcano plot visualization
data$negLog10P <- -log10(data$pvalue)


# STEP 4: Define Significance 
data$Significance <- ifelse(data$log2FoldChange > 1 & data$pvalue < 0.01, "Upregulated",
                            ifelse(data$log2FoldChange < -1 & data$pvalue < 0.01, "Downregulated",
                                   "Not Significant"))

#Step 5: Check if it worked
table(data$Significance)


# STEP 6: Volcano plot
volcano <- ggplot(data, aes(x=log2FoldChange, y=negLog10P, color=Significance)) +
  geom_point(alpha=0.8, size=2) +
  scale_color_manual(values=c("Upregulated"="red",
                              "Downregulated"="blue",
                              "Not Significant"="grey")) +
  geom_vline(xintercept=c(-1,1), linetype="dashed") +
  geom_hline(yintercept=-log10(0.01), linetype="dashed") +
  theme_minimal() +
  labs(title="Volcano Plot", x="Log2 Fold Change", y="-Log10(p-value)") +
  theme(plot.title = element_text(hjust=0.5))

# Display plot in RStudio / R plot window
print(volcano)

# STEP 6: Extract Up/Downregulated Genes
up_genes <- data %>% filter(log2FoldChange > 1 & pvalue < 0.01)
down_genes <- data %>% filter(log2FoldChange < -1 & pvalue < 0.01)

head(up_genes, 5)
head(down_genes, 5)

# Top 5 upregulated genes (names only)
cat("Top 5 Upregulated Genes:\n")
print(head(up_genes$Gene, 5))   # Replace 'Gene' with your column name if different

# Top 5 downregulated genes (names only)
cat("\nTop 5 Downregulated Genes:\n")
print(head(down_genes$Gene, 5)) # Replace 'Gene' with your column name if different


# STEP 7: Save the Results 
write.csv(up_genes, "Upregulated_Genes.csv", row.names = FALSE)
write.csv(down_genes, "Downregulated_Genes.csv", row.names = FALSE)






