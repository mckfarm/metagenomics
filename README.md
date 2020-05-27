# Metagenomics

Workflow and codes for metagenomics pipeline using Quest HPC and other programs

---
Workflow as follows (from Yubo)

1) Check quality of raw metagenome sequence data using **FastQC**  

2) Trim sequences to a certain length using **fastx toolkit**, convert from fq to fa if needed  

3)  Assemble metagenome DNA raw reads to contigs using **IDBA**, **metaspades**, or **megahit**

4) Evaluate assembly results with **quast**

5) Map the reads using **bowtie**, also need to normalize the length of the contigs using a RPKM script

6) Bin genomes using **metabat** or **mmgenome**

7) Check draft genome bin quality using **CheckM**

8) Annotate the genome for potential functional roles using **kegg**, **kbase**, or **prokka**

9) Annotate the phylogeny of the draft genome bins using **GTDB** with prokka annotation

10) Optional analyses (FastANI, sequence alignment, phylogentic tree, prodigal ORF annotation, Blast sequence annotation, remove ribosome RNA sequences)

---
Helpful links:

Quest


[Quest KB home](https://kb.northwestern.edu/72406)

[KB modules management](https://kb.northwestern.edu/70718)

[KB job management](https://kb.northwestern.edu/page.php?id=70710)

Manuals

[Bowtie2](http://bowtie-bio.sourceforge.net/bowtie2/manual.shtml)
