# RNA-seq Differential Expression Analysis

This repository contains the analysis of RNA-seq data comparing a **diseased cell line** and the same cell line **treated with compound X**.  
The goal of this project is to identify **differentially expressed genes (DEGs)**, visualize them, and interpret their biological functions.

---

## 📊 Dataset
- Input: Quantified gene expression dataset from RNA-seq.
- Columns include:
  - **Gene** – Gene name/identifier  
  - **Log2FC** – Log2 fold change (treated vs diseased)  
  - **pvalue** – Statistical significance of expression change
  - **padj** - (Adjusted p-value / FDR) Corrected version of the p-value that accounts for multiple hypothesis testing.

---

## 🚀 Tasks Performed
1. **Volcano Plot Generation**
   - Visualized Log2FC vs. -log10(p-value)  
   - Highlighted significantly **upregulated** (red) and **downregulated** (blue) genes  

2. **Identification of Differentially Expressed Genes**
   - **Upregulated genes**: `Log2FC > 1` and `pvalue < 0.01`  
   - **Downregulated genes**: `Log2FC < -1` and `pvalue < 0.01`
   - **Red points = Upregulated | Blue points = Downregulated** 

3. **Top DEGs**
   - Extracted the **top 5 upregulated** and **top 5 downregulated** genes based on fold change.  

4. **Functional Interpretation**
   - Queried **[GeneCards](https://www.genecards.org/)** to annotate functions of the top DEGs.  

---

5.**Click here to view the Full Script -https://github.com/Gargi28-sketch/Hackbio-R-Project-Submission-/blob/5f5b8a40fb70b2e9d653beae3da8ffecc5cb68e1/script.R**

6.**Click here to view the Volcano Plot- https://github.com/Gargi28-sketch/Hackbio-R-Project-Submission-/blob/5f5b8a40fb70b2e9d653beae3da8ffecc5cb68e1/volcano%20plot.png**

