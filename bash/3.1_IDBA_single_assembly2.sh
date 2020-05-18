#!/bin/bash
#SBATCH --job-name="IDBA_assembly_date2"
#SBATCH -A b1042
#SBATCH -p genomicsguest
#SBATCH -t 10:00:00
#SBATCH -N 1
#SBATCH --ntasks-per-node=24
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mckennafarmer2023@u.northwestern.edu
#SBATCH --output=outlog_IDBA2
#SBATCH --error=errorlog_IDBA2

# export PATH=$PATH:/home/mmf8608/software/idba/bin
module purge all
module load idba/2016_12

cd /projects/b1052/Wells_b1042/McKenna/training/SG_Metagenome/clean_reads

#step1. the pair-end reads of this one metagenome dataset need to be interleaved before assembly

fq2fa --merge --filter SG_01_11_2017_S17_R1_trimmed.fq SG_01_11_2017_S17_R2_trimmed.fq ../IDBA/interleaved_SG_01_11_2017.fa

cd /projects/b1052/Wells_b1042/McKenna/training/SG_Metagenome/IDBA

#step2. assembly
#mink means minimal kmer length, maxk means maximum kmer lenth, step means kmer length would increas from 21 bp to 51 bp by 10 each time, you may modify these values according to your data, e.g., the PE length ect
idba_ud -r ./interleaved_SG_01_11_2017.fa -o ./assembly_SG_01_11_2017 --mink 21 --maxk 51 --step 10 --num_threads 24
