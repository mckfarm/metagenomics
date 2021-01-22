#!/bin/bash
#SBATCH --job-name="fastqc"
#SBATCH -A b1042
#SBATCH -p genomicsguest
#SBATCH -t 10:00:00
#SBATCH -N 1
#SBATCH --ntasks-per-node=10
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mckennafarmer2023@u.northwestern.edu
#SBATCH --output=outlog_fastqc.txt
#SBATCH --error=errorlog_fastqc.txt

module purge all
module load fastqc

cd /projects/b1052/Wells_b1042/McKenna/training/SG_Metagenome/clean_reads

fastqc SG_01_11_2017_S17_R1_trimmed.fq SG_01_11_2017_S17_R2_trimmed.fq SG_05_27_2016_S16_R1_trimmed.fq SG_05_27_2016_S16_R2_trimmed.fq
