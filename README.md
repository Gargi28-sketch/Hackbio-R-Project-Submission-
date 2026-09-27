# RNA-seq Differential Expression Analysis

**Objective:** To identify differentially expressed genes (DEGs), generate a volcano plot, and interpret the top significant genes.

---

## Dataset

The input dataset used for this analysis is:

**[Dataset.csv](https://github.com/Gargi28-sketch/Hackbio-R-Project-Submission-/blob/e09c71a3d4bca0dc5761d7f797bda8f3114802e4/Dataset.csv)**

---

## Analysis Workflow

### 1. Data Transformation

The dataset was imported into R, and the `log2FoldChange` and `pvalue` columns were converted to numeric values.

A new column, `negLog10Pvalue`, was calculated as:

`-log10(pvalue)`

This transformation was used to visualize statistical significance in the volcano plot.

Genes were classified using the following thresholds:

| Category | Condition |
|----------|-----------|
| **Upregulated** | `log2FoldChange > 1` and `pvalue < 0.01` |
| **Downregulated** | `log2FoldChange < -1` and `pvalue < 0.01` |
| **Not Significant** | All other genes |

---

### 2. Count of Upregulated and Downregulated Genes

The R script calculates and prints the number of:

- Upregulated genes
- Downregulated genes

These counts are based on the specified fold-change and p-value thresholds.

---

### 3. Top Differentially Expressed Genes

The genes classified as upregulated and downregulated are extracted separately.

The **top 5 upregulated genes** and **top 5 downregulated genes** are identified by sorting the genes according to their p-value. Genes with smaller p-values are considered more statistically significant within the set of genes meeting the DEG criteria.

For each top gene, the R script reports:

- Gene name
- Log2 fold change
- P-value

---

### 4. Exported Gene Lists

The identified upregulated and downregulated genes were exported as separate CSV files.

**Columns included:**

`Gene`, `log2FoldChange`, `pvalue`, `negLog10Pvalue`, `Significance`

**Upregulated Genes:**  
[Upregulated_Genes.csv](https://github.com/Gargi28-sketch/Hackbio-R-Project-Submission-/blob/8cea4c1864e9bf63b39484a511f0c61f086091bf/Upregulated_Genes.csv)

**Downregulated Genes:**  
[Downregulated_Genes.csv](https://github.com/Gargi28-sketch/Hackbio-R-Project-Submission-/blob/c91af0f62a11f583f15daa03c6d3fca28ccdb10c/Downregulated_Genes.csv)

A summary table containing the total number and percentage of genes in each category was also generated:


**DEG Summary Table:**  
[DEG_Summary.csv](https://github.com/Gargi28-sketch/Hackbio-R-Project-Submission--RNA-seq-Differential-Expression-Analysis/blob/2810d07d9b1b01f314bd3150d5357100e0887eec/DEG_Summary.csv)

**DEG Summary Plot:**  
[DEG plot.pdf](https://github.com/Gargi28-sketch/Hackbio-R-Project-Submission--RNA-seq-Differential-Expression-Analysis/blob/2810d07d9b1b01f314bd3150d5357100e0887eec/DEG%20plot.pdf)
---

### 5. Volcano Plot

A volcano plot was generated to visualize gene expression changes and statistical significance.

**[View Volcano Plot](https://github.com/Gargi28-sketch/Hackbio-R-Project-Submission-/blob/a3522b5f830a04c01d8d2c43e5b1c863373345a4/Volcano%20Plot.png)**

The plot contains:

- **X-axis:** `log2FoldChange`
- **Y-axis:** `-log10(pvalue)`

#### Color Coding

- 🔴 **Red:** Upregulated
- 🔵 **Blue:** Downregulated
- ⚪ **Grey:** Not Significant

The dashed vertical lines represent the fold-change thresholds of `-1` and `+1`. The horizontal dashed line represents the p-value threshold of `0.01`.

---

## Column Explanations

| Column | Description |
|--------|-------------|
| **Gene** | Name or identifier of the gene being analyzed. |
| **log2FoldChange** | Log2-transformed fold change in gene expression between treated and diseased samples. Positive values indicate increased expression, while negative values indicate decreased expression. |
| **pvalue** | Raw p-value indicating the statistical significance of the observed expression change. Smaller values indicate stronger statistical evidence for differential expression. |
| **negLog10Pvalue** | Negative log10 transformation of the p-value (`-log10(pvalue)`), used for visualization in the volcano plot. |
| **Significance** | Classification of each gene as Upregulated, Downregulated, or Not Significant based on the specified fold-change and p-value thresholds. |

---

## 6. Functional Interpretation

The known biological functions of the top significant genes were investigated using **[GeneCards](https://www.genecards.org/)**.

The following genes were identified among the top upregulated and downregulated genes.

---

## Top 5 Upregulated Genes

**EMILIN2, POU3F4, LOC285954, VEPH1, DTHD1**

### EMILIN2

**Full name:** Elastin Microfibril Interfacer 2

- EMILIN2 encodes an extracellular matrix glycoprotein.
- It is associated with extracellular matrix structure and cellular signaling.
- It has been reported to participate in processes including angiogenesis, defense responses, and platelet aggregation.
- EMILIN2 has also been studied in relation to cell growth and tumor biology.

### POU3F4

**Full name:** POU Class 3 Homeobox 4

- POU3F4 encodes a transcription factor involved in developmental processes.
- It has an important role in neural and inner-ear development.
- Variants in POU3F4 are associated with X-linked nonsyndromic hearing loss.
- The gene is involved in regulation of gene expression during neural development.

### LOC285954

**Also known as:** INHBA-AS1

- INHBA-AS1 is a long non-coding RNA (lncRNA).
- It is classified as an antisense RNA associated with the INHBA gene.
- It has been studied in relation to gene regulation and cancer biology.
- Its expression has been investigated in studies of colorectal cancer.

### VEPH1

**Full name:** Ventricular Zone Expressed PH Domain Containing 1

- VEPH1 is involved in cellular signaling.
- It has been associated with regulation of SMAD protein signaling.
- It can negatively regulate transforming growth factor beta (TGF-β) receptor signaling.
- The protein is associated with membrane-related cellular processes.

### DTHD1

**Full name:** Death Domain Containing 1

- DTHD1 encodes a protein containing a death domain.
- Death domains are involved in protein-protein interactions and signaling complexes.
- Proteins containing death domains can participate in cellular signaling and apoptosis-related pathways.
- Alternative splicing produces multiple transcript variants.

---

## Top 5 Downregulated Genes

**TBX5, IFITM1, LAMA2, CAV2, TNN**

### TBX5

**Full name:** T-Box Transcription Factor 5

- TBX5 encodes a transcription factor belonging to the conserved T-box family.
- It is involved in developmental processes.
- TBX5 has important roles in heart development and limb specification.
- Mutations in TBX5 are associated with Holt-Oram syndrome.

### IFITM1

**Full name:** Interferon Induced Transmembrane Protein 1

- IFITM1 belongs to the interferon-induced transmembrane protein family.
- It is involved in antiviral cellular defense.
- IFITM1 can restrict the entry of several viral pathogens into cells.
- Its expression and activity are associated with interferon-mediated responses.

### LAMA2

**Full name:** Laminin Subunit Alpha 2

- LAMA2 encodes the alpha-2 subunit of laminin.
- Laminins are important components of the extracellular matrix and basement membranes.
- LAMA2 contributes to cell attachment, migration, and tissue organization.
- Mutations in LAMA2 are associated with congenital muscular dystrophy.

### CAV2

**Full name:** Caveolin 2

- CAV2 encodes a protein associated with caveolae, which are specialized structures in the plasma membrane.
- It is involved in cellular signaling, lipid metabolism, and regulation of cellular growth.
- CAV2 interacts with CAV1 and contributes to caveolar membrane organization.
- It has also been studied in relation to MAPK signaling and cell-cycle regulation.

### TNN

**Full name:** Tenascin N

- TNN encodes an extracellular matrix protein.
- It is associated with cell adhesion and cell migration.
- TNN has been linked to integrin binding and angiogenesis-related processes.
- Its expression has also been investigated in cancer biology and tumor-associated cellular behavior.

---

## 7. Full R Script

The complete R script used for the analysis is available here:

### R Script
**[View Full R Script](https://github.com/Gargi28-sketch/Hackbio-R-Project-Submission-/blob/d465f70c837c584d6c55b6d349d331b9d1d753f9/RNA-seq-Differential-Expression-Analysis/Script.R)**

The script includes:

1. Package loading
2. Dataset import
3. Data transformation
4. DEG classification
5. Counting of upregulated and downregulated genes
6. Extraction of DEG lists
7. Export of DEG CSV files
8. Identification of the top 5 significant genes
9. Volcano plot generation
10. Saving the volcano plot

---

## 8. Conclusion

This analysis identified differentially expressed genes using predefined thresholds of `|log2FoldChange| > 1` and `pvalue < 0.01`.

The results were visualized using a volcano plot, and the most statistically significant upregulated and downregulated genes were further investigated using GeneCards to review their known biological functions.

---

## Author

**Gargi Durbude**  
📧 Email: gauridilip2001@gmail.com
