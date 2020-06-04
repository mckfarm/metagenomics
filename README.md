# Metagenomics

Workflow and codes for metagenomics pipeline using Quest HPC and other programs

---
Workflow as follows (from Yubo)

1) Check quality of raw metagenome sequence data using [**FastQC**](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
- Available as a Quest module, load it in using `module load fastqc/0.11.5`

2) Trim sequences to a certain length using [**fastx toolkit**](http://hannonlab.cshl.edu/fastx_toolkit/), convert from fq to fa if needed  
- Available as a Quest module

3)  Assemble metagenome DNA raw reads to contigs using [**IDBA**](https://github.com/loneknightpy/idba), [**metaSPAdes**](https://github.com/ablab/spades) (part of the SPAdes package), or [**megahit**](https://github.com/voutcn/megahit)

4) Evaluate assembly results with [**quast**](http://quast.sourceforge.net/)

5) Map the reads using [**bowtie**](http://bowtie-bio.sourceforge.net/bowtie2/index.shtml), can also normalize the length of the contigs using a RPKM script

6) Bin genomes using [**metabat**](https://bitbucket.org/berkeleylab/metabat) or [**mmgenome**](http://madsalbertsen.github.io/mmgenome/)
- I've used metabat, which requires two separate steps. Metabat is available as a Quest module, while mmgenome is an R package.

7) Check draft genome bin quality using [**CheckM**](https://ecogenomics.github.io/CheckM/)
- Available as a Quest module

8) Annotate the genome for potential functional roles using [**prokka**](https://github.com/tseemann/prokka) or [**kegg**](https://www.genome.jp/kegg/)
- So far I've used prokka, which is installed in the group Quest node. I think I've updated it properly, but some versions may have issues with the current perl version or the tbl2asn package within prokka. Couldn't figure out the perl version issue, but it would be good to check back in with the repo to see if it gets fixed in the next update. The tbl2asn issue can be fixed by installing [tbl2asn-forever](https://anaconda.org/bioconda/tbl2asn-forever) through conda.

9) Annotate the phylogeny of the draft genome bins using [**GTDB**](https://github.com/Ecogenomics/GTDBTk) with prokka annotation

10) Optional analyses (FastANI, sequence alignment, phylogentic tree, prodigal ORF annotation, Blast sequence annotation, remove ribosome RNA sequences)

---
Helpful links:

Quest

[Quest KB home](https://kb.northwestern.edu/72406)

[KB modules management](https://kb.northwestern.edu/70718)

[KB job management](https://kb.northwestern.edu/page.php?id=70710)

Manuals

[Bowtie2](http://bowtie-bio.sourceforge.net/bowtie2/manual.shtml)
