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
5.**Functions of the top 5 upregulated genes and top 5 downregulated genes**
                       **Upregulated gene** 
PI16 "    " GALNTL2 " " C4orf45 " " PDE1B "   " BCAN "   

**PI16**
•	enables protein binding
•	enables peptidase inhibitor activity
•	PI16 (Peptidase Inhibitor 16) is a Protein Coding gene

**GALNTL2**
•	GALNTL2, or Polypeptide N-acetylgalactosaminyltransferase-like protein 2, is a human enzyme encoded by the GALNTL2 gene that plays a key role in O-linked protein glycosylation by transferring N-acetylgalactosamine to serine and threonine residues on target proteins. 
•	This modification is crucial for protein function and is involved in various physiological processes, with GALNTL2 being widely expressed in tissues like the liver, brain, and heart. 
•	Protein Modification: This process is a critical form of protein glycosylation, which modifies protein structure and function. 

**C4orf45**
•	c4orf45, also known as chromosome 4 open reading frame 45, is a gene located on chromosome 4. 
•	It encodes a protein that is primarily involved in the regulation of gene expression. 
•	c4orf45 plays a crucial role in maintaining the normal functioning of cellular processes, particularly those related to neuronal development and the health of the nervous system.

**PDE1B**
•	Phosphodiesterase 1B - The protein encoded by this gene is a member of the cyclic nucleotide phosphodiesterase (PDE) family, specifically the PDE1 subfamily. 
•	Enzymes in the PDE1 group are calmodulin-dependent and activated by calcium–calmodulin complexes. 
•	This particular PDE can hydrolyse both cAMP and cGMP, though it shows a preference for cGMP as a substrate. Since cAMP and cGMP are critical second messengers, this enzyme plays an important role in regulating various key physiological processes.

**BCAN**
•	The BCAN (brevican) gene encodes a protein expressed in the brain and central nervous system that is essential for the formation and maintenance of the extracellular matrix (ECM), particularly in structures known as perineuronal nets. 
•	It may contribute to processes involved in postnatal development, including terminal differentiation of the nervous system. 
•	Additionally, brevican may help stabilize interactions between hyaluronan (HA) and other brain proteoglycans.

                         **Downregulated gene** 
ADM "      " COL2A1 "   " DYSF "     " CDC42EP5 " " ZNF391 "  

**ADM**
•	Adrenomedullin is a 52 aa peptide with several functions, including vasodilation, regulation of hormone secretion, promotion of angiogenesis, and antimicrobial activity.
•	The ADM gene codes for the precursor of the adrenomedullin (ADM) peptide, a multifunctional hormone with roles in cardiovascular homeostasis, such as vasodilation, promoting angiogenesis (blood vessel growth), regulating vascular integrity, and having antimicrobial properties. 
•	ADM also plays a role in glucose metabolism and insulin balance, as well as in normal pregnancy and growth.

**COL2A1**
•	The COL2A1 gene encodes the alpha-1(II) chain, a fundamental building block of type II collagen. 
•	Type II collagen provides structural support and strength to connective tissues and is crucial for the proper development of joints, eyes, and the inner ear. 
•	It also plays an essential role in embryonic skeletal formation, linear growth, and enabling cartilage to withstand compressive forces.

**DYSF (Dysferlin)**
•	The DYSF gene encodes dysferlin, a protein located in the sarcolemma, the membrane that surrounds muscle fibers. 
•	Dysferlin plays a critical role in calcium-dependent membrane fusion, which is essential for repairing and maintaining the sarcolemma after injury. 
•	In addition to its role in membrane repair, dysferlin may also contribute to muscle fiber regeneration and inflammatory processes. 
•	This protein interacts with caveolin-3, a key skeletal muscle membrane protein essential for the formation of caveolae.

**CDC42EP5**
•	Cytoskeleton regulation – Encodes a CDC42 effector protein (Borg family) that organizes the actin cytoskeleton, septins, and actomyosin bundles, driving cell shape changes and migration.
•	Protein interactions – Binds CDC42 (via CRIB domain) and interacts with SEPT9, influencing pseudopodia formation and higher-order cytoskeletal structures.
•	 Functional roles – Contributes to cell motility, invasion (e.g., melanoma), and can inhibit MAPK8/JNK signaling independently of CDC42.

**ZNF391**
•	Transcription Factor Activity:
ZNF391 acts as a transcription factor, meaning it can bind to DNA and influence the rate at which genes are transcribed into RNA.
•	DNA-Binding:
It possesses DNA-binding activity, which is crucial for its role in transcriptional regulation.
•	RNA Polymerase II Interaction:
The protein is predicted to interact with RNA polymerase II, the enzyme responsible for transcribing DNA into RNA in the cell.
•	Nuclear Localization:
ZNF391 is active in the nucleus, the cellular compartment where transcription and DNA regulation occur

6.**Click here to view the Full Script -https://github.com/Gargi28-sketch/Hackbio-R-Project-Submission-/blob/5f5b8a40fb70b2e9d653beae3da8ffecc5cb68e1/script.R**

7.**Click here to view the Volcano Plot- https://github.com/Gargi28-sketch/Hackbio-R-Project-Submission-/blob/5f5b8a40fb70b2e9d653beae3da8ffecc5cb68e1/volcano%20plot.png**

