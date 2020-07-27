# Metagenomics analysis on Quest

This document is meant to be a resource for learning the basics of metagenomics analysis using a high performance computing cluster like Northwestern's [**Quest**](https://www.it.northwestern.edu/research/user-services/quest/). This document heavily relies on the pipeline documented by Yubo Wang as well as notes from Morgan Petrovich and Jim Griffin.  

This document contains the following sections:

[Getting started](#getting-started) - Information about Quest, programming, and other things you should know   
[Quest basics](#quest-basics) - Submitting a job, basic commands, and supplementary programs  
[Metagenomics pipeline](#metagenomics-pipeline) - Steps and programs needed to turn raw data into assembled genomes  
[Other analyses](#other-analyses) - More things to do besides assembling genomes  
[Resources](#resources) - Resources for learning more about metagenomics and programming  

---

## Getting started   

---
## Quest basics   

---
## Metagenomics pipeline  

1) Check quality of raw metagenome sequence data using [**FastQC**](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
- Available as a Quest module, load it in using `module load fastqc/0.11.5`

2) Trim sequences to a certain length using [**fastx toolkit**](http://hannonlab.cshl.edu/fastx_toolkit/), convert from fq to fa if needed  
- Available as a Quest module, load it in using `module load fastx_toolkit/0.0.14`

3)  Assemble metagenome DNA raw reads to contigs using [**IDBA**](https://github.com/loneknightpy/idba), [**metaSPAdes**](https://github.com/ablab/spades) (part of the SPAdes package), or [**megahit**](https://github.com/voutcn/megahit)
- IDBA is available as a Quest module, load it in using `module load idba/2016_12`
- metaSPAdes is installed in the group Quest node and requires far more memory

4) Evaluate assembly results with [**quast**](http://quast.sourceforge.net/)
- QUAST is installed locally in the group node
- Make sure to load in these dependencies  
&nbsp;&nbsp;`module load python/anaconda3.6`  
&nbsp;&nbsp;`module load boost/1.56.0`    

5) Map the reads using [**bowtie**](http://bowtie-bio.sourceforge.net/bowtie2/index.shtml), can also normalize the length of the contigs using a RPKM script
- Available as a module in Quest. Make sure to load in bowtie2 and all dependencies.  
&nbsp;&nbsp;`module load bowtie2/2.2.6`  
&nbsp;&nbsp;`module load samtools/1.2`  
&nbsp;&nbsp;`module load perl/5.16`  

6) Bin genomes using [**metabat**](https://bitbucket.org/berkeleylab/metabat) or [**mmgenome**](http://madsalbertsen.github.io/mmgenome/)
- I've used metabat, which requires two separate steps. Metabat is available as a Quest module, while mmgenome is an R package.
- Load in metabat using `module load metabat/0.32.4`

7) Check draft genome bin quality using [**CheckM**](https://ecogenomics.github.io/CheckM/)
- Available as a Quest module, load in using `module load checkm/1.0.7`

8) Annotate the genome for potential functional roles using [**prokka**](https://github.com/tseemann/prokka) or [**kegg**](https://www.genome.jp/kegg/)
- So far I've used prokka, which is installed in the group Quest node. I think I've updated it properly, but some versions may have issues with the current perl version or the tbl2asn package within prokka. Couldn't figure out the perl version issue, but it would be good to check back in with the repo to see if it gets fixed in the next update. The tbl2asn issue can be fixed by installing [tbl2asn-forever](https://anaconda.org/bioconda/tbl2asn-forever) through conda.
- Load in these dependencies from Quest  
&nbsp;&nbsp;`module load python/anaconda3.6`  
&nbsp;&nbsp;`module load perl`

9) Annotate the phylogeny of the draft genome bins using [**GTDBTk**](https://github.com/Ecogenomics/GTDBTk) with prokka annotation
- There are some issues with newer versions of GTDBTk, specifically on high performance computers like Quest, where the classify step runs out of memory due to issues with the dependency pplacer. I'm still troubleshooting some of the suggestions from the devs using the `--scratch_dir` tag in the code (https://github.com/Ecogenomics/GTDBTk/issues/238).

10) Optional analyses (FastANI, sequence alignment, phylogentic tree, prodigal ORF annotation, Blast sequence annotation, remove ribosome RNA sequences)
- FastTree is available on Quest, though I haven't used it yet. Load it in using `module load fasttree/2.1.10`
- Blast is available on Quest, though I haven't used it yet. Load it in using `module load blast/2.7.1`

---
## Other analyses  

Can directly run raw reads through Blast to see if genes of interest are there



---
## Resources  
Helpful links:

Quest

[Quest KB home](https://kb.northwestern.edu/72406)

[KB modules management](https://kb.northwestern.edu/70718)

[KB job management](https://kb.northwestern.edu/page.php?id=70710)

Manuals

[Bowtie2](http://bowtie-bio.sourceforge.net/bowtie2/manual.shtml)
