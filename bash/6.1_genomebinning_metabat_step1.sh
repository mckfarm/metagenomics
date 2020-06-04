#!/bin/bash
#SBATCH --job-name="metabat_step1"
#SBATCH -A b1042
#SBATCH -p genomics
#SBATCH -t 10:00:00
#SBATCH -N 1
#SBATCH --ntasks-per-node=10
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mckennafarmer2023@u.northwestern.edu
#SBATCH --output=outlog_metabat_step1
#SBATCH --error=errorlog_metabat_step1

module purge all
export PATH=$PATH:/projects/b1052/berkeleylab-metabat-cc5ccff537e8/metabat

#you need the sorted.bam files generated from the bowtie mapping step, map the contigs to two metagenome datasets

cd /projects/b1052/Wells_b1042/McKenna/training/SG_Metagenome/bowtie_alignment

jgi_summarize_bam_contig_depths --outputDepth depth1.txt SG_05_27_2016.bowtie2.sorted.bam
jgi_summarize_bam_contig_depths --outputDepth depth2.txt SG_01_11_2017.bowtie2.sorted.bam
