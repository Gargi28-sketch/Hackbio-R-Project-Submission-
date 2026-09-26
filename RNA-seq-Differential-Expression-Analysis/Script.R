
# ============================================================
# RNA-seq Differential Expression Analysis
# ============================================================
# Aim:
# To identify differentially expressed genes (DEGs),
# generate a volcano plot, and identify the top significant genes.
# ============================================================


# ------------------------------------------------------------
# STEP 1: Install and Load Required Packages
# ------------------------------------------------------------

# Run install.packages() only if the packages are not already installed.
# install.packages("ggplot2")
# install.packages("dplyr")

library(ggplot2)
library(dplyr)


# ------------------------------------------------------------
# STEP 2: Import Dataset
# ------------------------------------------------------------

data <- read.csv("Dataset.csv")

# View the first few rows
head(data)

# Check the structure of the dataset
str(data)


# ------------------------------------------------------------
# STEP 3: Data Transformation
# ------------------------------------------------------------

# Convert log2FoldChange and pvalue to numeric
data$log2FoldChange <- as.numeric(data$log2FoldChange)
data$pvalue <- as.numeric(data$pvalue)

# Calculate -log10(p-value) for the volcano plot
data$negLog10Pvalue <- -log10(data$pvalue)


# ------------------------------------------------------------
# STEP 4: Classify Genes
# ------------------------------------------------------------

# Define differentially expressed genes using:
# Upregulated: log2FC > 1 and p-value < 0.01
# Downregulated: log2FC < -1 and p-value < 0.01
# Not Significant: all other genes

data$Significance <- ifelse(
  data$log2FoldChange > 1 & data$pvalue < 0.01,
  "Upregulated",
  ifelse(
    data$log2FoldChange < -1 & data$pvalue < 0.01,
    "Downregulated",
    "Not Significant"
  )
)


# ------------------------------------------------------------
# STEP 5: Count Upregulated and Downregulated Genes
# ------------------------------------------------------------

num_up <- sum(data$Significance == "Upregulated")
num_down <- sum(data$Significance == "Downregulated")

cat("Number of Upregulated Genes:", num_up, "\n")
cat("Number of Downregulated Genes:", num_down, "\n")


# ------------------------------------------------------------
# STEP 6: Extract Upregulated and Downregulated Genes
# ------------------------------------------------------------

up_genes <- data[data$Significance == "Upregulated", ]

down_genes <- data[data$Significance == "Downregulated", ]


# ------------------------------------------------------------
# STEP 7: Save DEG Lists as CSV Files
# ------------------------------------------------------------

write.csv(
  up_genes,
  "Upregulated_Genes.csv",
  row.names = FALSE
)

write.csv(
  down_genes,
  "Downregulated_Genes.csv",
  row.names = FALSE
)


# ------------------------------------------------------------
# STEP 8: Identify and Print Top 5 Significant Genes
# ------------------------------------------------------------

# Rank upregulated genes by smallest p-value
top_up_genes <- up_genes %>%
  arrange(pvalue) %>%
  head(5)

# Rank downregulated genes by smallest p-value
top_down_genes <- down_genes %>%
  arrange(pvalue) %>%
  head(5)

# Print top 5 upregulated genes
cat("\nTop 5 Upregulated Genes:\n")
print(top_up_genes[, c("Gene", "log2FoldChange", "pvalue")])

# Print top 5 downregulated genes
cat("\nTop 5 Downregulated Genes:\n")
print(top_down_genes[, c("Gene", "log2FoldChange", "pvalue")])


# ------------------------------------------------------------
# STEP 9: Generate Volcano Plot
# ------------------------------------------------------------

volcano <- ggplot(
  data,
  aes(
    x = log2FoldChange,
    y = negLog10Pvalue,
    color = Significance
  )
) +
  geom_point(alpha = 0.8, size = 2) +
  
  # Vertical lines showing fold-change thresholds
  geom_vline(
    xintercept = c(-1, 1),
    linetype = "dashed"
  ) +
  
  # Horizontal line showing p-value threshold
  geom_hline(
    yintercept = -log10(0.01),
    linetype = "dashed"
  ) +
  
  # Set colors for each category
  scale_color_manual(
    values = c(
      "Upregulated" = "red",
      "Downregulated" = "blue",
      "Not Significant" = "grey"
    )
  ) +
  
  # Add plot labels
  labs(
    title = "Volcano Plot of Differentially Expressed Genes",
    x = "Log2 Fold Change",
    y = "-Log10(p-value)",
    color = "Significance"
  ) +
  
  # Use a clean theme
  theme_minimal()


# Display the volcano plot
print(volcano)


# ------------------------------------------------------------
# STEP 10: Save the Volcano Plot
# ------------------------------------------------------------

ggsave(
  "Volcano_Plot.png",
  plot = volcano,
  width = 8,
  height = 6,
  dpi = 300
)



# ------------------------------------------------------------
# STEP 11: DEG Summary
# ------------------------------------------------------------

total_genes <- nrow(data)
num_up <- sum(data$Significance == "Upregulated")
num_down <- sum(data$Significance == "Downregulated")
num_ns <- sum(data$Significance == "Not Significant")

deg_summary <- data.frame(
  Category = c(
    "Total Genes",
    "Upregulated",
    "Downregulated",
    "Not Significant"
  ),
  Count = c(
    total_genes,
    num_up,
    num_down,
    num_ns
  )
)

# Calculate percentages
deg_summary$Percentage <- round(
  (deg_summary$Count / total_genes) * 100,
  2
)

cat("\nDEG Summary:\n")
print(deg_summary)

# Save summary table
write.csv(
  deg_summary,
  "DEG_Summary.csv",
  row.names = FALSE
)

# ------------------------------------------------------------
# STEP 12: Top 10 Differentially Expressed Genes
# ------------------------------------------------------------

# Select the 10 most significant DEGs based on p-value
top_10_deg <- data %>%
  filter(Significance != "Not Significant") %>%
  arrange(pvalue) %>%
  head(10)

cat("\nTop 10 Differentially Expressed Genes:\n")
print(top_10_deg[, c("Gene", "log2FoldChange", "pvalue", "Significance")])


# Create bar plot
top_deg_plot <- ggplot(
  top_10_deg,
  aes(
    x = reorder(Gene, log2FoldChange),
    y = log2FoldChange,
    fill = Significance
  )
) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Top 10 Differentially Expressed Genes",
    x = "Gene",
    y = "Log2 Fold Change",
    fill = "Significance"
  ) +
  theme_minimal()

# Display plot
print(top_deg_plot)

# Save plot
ggsave(
  "Top_10_DEGs.png",
  plot = top_deg_plot,
  width = 8,
  height = 6,
  dpi = 300
)

# ------------------------------------------------------------
# STEP 13: Statistical Summary
# ------------------------------------------------------------

cat("\nLog2 Fold Change Summary:\n")
print(summary(data$log2FoldChange))

cat("\nP-value Summary:\n")
print(summary(data$pvalue))

# ============================================================
# End of RNA-seq Differential Expression Analysis
# ============================================================
