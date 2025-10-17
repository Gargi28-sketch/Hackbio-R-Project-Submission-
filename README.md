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


5.**Click here to view the Full Script -https://github.com/Gargi28-sketch/Hackbio-R-Project-Submission-/blob/f8834e2dfd4f753de82c545aba686a48963f9bdb/script.R**


6.**Click here to view the Volcano Plot- https://github.com/Gargi28-sketch/Hackbio-R-Project-Submission-/blob/d5413eecc72c15675e536543c8ef1f39588b5a54/Volcano%20Plot.pdf**


7.**Functions of the top 5 upregulated genes and top 5 downregulated genes**
                      
                       **Upregulated gene** 
" EMILIN2 "   " POU3F4 "    " LOC285954 " " VEPH1 "     " DTHD1 "    

**EMILIN2**

- Elastin Microfibril Interfacer 2
-Predicted to enable extracellular matrix constituent conferring elasticity. Involved in several processes, including positive regulation of angiogenesis; positive regulation of Défense response to bacterium; and positive regulation of platelet aggregation.
- Located in extracellular region. EMILIN2 is an extracellular matrix (ECM) glycoprotein that has roles in various biological processes, including vascular stability, bone marrow function, and cell signaling. It is also known as elastin microfibril interface 2 and has been found to act as a Tumor suppressor in some contexts by promoting apoptosis and inhibiting cell growth. Its expression is frequently down-regulated in several types of cancer, such as colorectal, gastric, and breast cancer. 

**POU3F4**

- POU Class 3 Homeobox 4
-POU3F4 is a gene that provides instructions for making a protein, a type of transcription factor, crucial for neural and inner ear development. This family member plays a role in inner ear development. The protein is thought to be involved in the mediation of epigenetic signals which induce striatal neuron-precursor differentiation. Mutations in this gene are associated with X chromosome-linked nonsyndromic mixed deafness. Probable transcription factor which exert its primary action widely during early neural development and in a very limited set of neurons in the mature brain.

**LOC285954**

- INHBA Antisense RNA 1
-INHBA-AS1 (INHBA Antisense RNA 1) is an RNA Gene, and is affiliated with the lncRNA class. Diseases associated with INHBA-AS1 include Colorectal Cancer.

**VEPH1**

- Ventricular Zone Expressed PH Domain Containing 1 
-Enable phosphatidylinositol-5-phosphate binding activity. Involved in negative regulation of SMAD protein signal transduction and negative regulation of transforming growth factor beta receptor signaling pathway. Predicted to be located in endomembrane system and membrane and  active in plasma membrane.

**DTHD1**
  
- Death Domain Containing 1
- This gene encodes a protein which contains a death domain. Death domain-containing proteins function in signaling pathways and formation of signaling complexes, as well as the apoptosis pathway. Alternative splicing results in multiple transcript variants. 


                         **Downregulated gene** 
 " TBX5 "   " IFITM1 " " LAMA2 "  " CAV2 "   " TNN "
 
**TBX5**

- T-Box Transcription Factor 5
-This gene is a member of a phylogenetically conserved family of genes that share a common DNA-binding domain, the T-box. T-box genes encode transcription factors involved in the regulation of developmental processes. 
-This gene is closely linked to related family member T-box 3 (ulnar mammary syndrome) on human chromosome 12. The encoded protein may play a role in heart development and specification of limb identity. Mutations in this gene have been associated with Holt-Oram syndrome, a developmental disorder affecting the heart and upper limbs. 
-Several transcript variants encoding different isoforms have been described for this gene. DNA-binding protein that regulates the transcription of several genes and is involved in heart development and limb pattern formation.

**IFITM1**
  
- Interferon Induced Transmembrane Protein 1 
- Interferon-induced transmembrane (IFITM) proteins are a family of interferon induced antiviral proteins. The family contains five members, including IFITM1, IFITM2 and IFITM3 that belong to the CD225 superfamily. The protein encoded by this gene restricts cellular entry by diverse viral pathogens, such as influenza A virus, Ebola virus and Sars-CoV-2. 
- IFN-induced antiviral protein which inhibits the entry of viruses to the host cell cytoplasm, permitting endocytosis, but preventing subsequent viral fusion and release of viral contents into the cytosol. Active against multiple viruses, including influenza A virus, SARS coronaviruses (SARS-CoV and SARS-CoV-2), Marburg virus (MARV), Ebola virus (EBOV), Dengue virus (DNV), West Nile virus (WNV), human immunodeficiency virus type 1 (HIV-1) and hepatitis C virus (HCV)

**LAMA2**
  
- Laminin Subunit Alpha 2 
- Laminin, an extracellular protein, is a major component of the basement membrane. It is thought to mediate the attachment, migration, and organization of cells into tissues during embryonic development by interacting with other extracellular matrix components.
- It is composed of three subunits, alpha, beta, and gamma, which are bound to each other by disulfide bonds into a cross-shaped molecule. This gene encodes the alpha 2 chain, which constitutes one of the subunits of laminin 2 (merosin) and laminin 4 (s-merosin). 
-Mutations in this gene have been identified as the cause of congenital merosin-deficient muscular dystrophy. Two transcript variants encoding different proteins have been found for this gene.
- Binding to cells via a high affinity receptor, laminin is thought to mediate the attachment, migration and organization of cells into tissues during embryonic development by interacting with other extracellular matrix components. 

**CAV2**

- Caveolin 2 
- The protein encoded by this gene is a major component of the inner surface of caveolae, small invaginations of the plasma membrane, and is involved in essential cellular functions, including signal transduction, lipid metabolism, cellular growth control and apoptosis. 
-This protein may function as a Tumor suppressor. This gene and related family member (CAV1) are located next to each other on chromosome 7, and express colocalizing proteins that form a stable hetero-oligomeric complex. Alternatively spliced transcript variants encoding different isoforms have been identified for this gene.
- Additional isoforms resulting from the use of alternate in-frame translation initiation codons have also been described, and shown to have preferential localization in the cell.
-May act as a scaffolding protein within caveolar membranes and Interacts directly with G-protein alpha subunits and can functionally regulate their activity.
Acts as an accessory protein in conjunction with CAV1 in targeting to lipid rafts and driving caveolae formation. The Ser-36 phosphorylated form has a role in modulating mitosis in endothelial cells.
- Positive regulator of cellular mitogenesis of the MAPK signaling pathway.
Required for the insulin-stimulated nuclear translocation and activation of MAPK1 and STAT3, and the subsequent regulation of cell cycle progression (By similarity).

**TNN**
  
- Tenascin N
- Predicted to enable integrin binding activity. Involved in positive regulation of sprouting angiogenesis; regulation of cell adhesion; and regulation of cell migration. 
- During endochondral bone formation, inhibits proliferation and differentiation of proteoblasts mediated by canonical WNT signaling.
- Expressed in most mammary tumors, may facilitate tumorigenesis by supporting the migratory behavior of breast cancer cells 










## Author
- Gargi Durbude
- Contact: gauridilip2001@gmail.com
  
