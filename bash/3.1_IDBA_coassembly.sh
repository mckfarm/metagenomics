#!/bin/bash
#SBATCH --job-name="IDBA_coassembly"
#SBATCH -A b1042
#SBATCH -p genomicsguest
#SBATCH -t 24:00:00
#SBATCH -N 1
#SBATCH --ntasks-per-node=10
#SBATCH --mem-per-cpu=10G
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mckennafarmer2023@u.northwestern.edu
#SBATCH --output=outlog_IDBA.txt
#SBATCH --error=errorlog_IDBA.txt

module purge all
module load idba/2016_12

cd /projects/b1052/Wells_b1042/McKenna/SG_Metagenome/IDBA

#interleave the metagenome DNA reads
# fq2fa --merge --filter SG_01_11_2017_S17_R1_trimmed.fq SG_01_11_2017_S17_R2_trimmed.fq ../idba/interleaved_SG_01_11_2017.fa
# fq2fa --merge --filter SG_05_27_2016_S16_R1_trimmed.fq SG_05_27_2016_S16_R2_trimmed.fq ../idba/interleaved_SG_05_27_2016.fa

#mink means minimal kmer length, maxk means maximum kmer lenth, step means kmer length would increas from 21 bp t0 101 bp by 10 each time, you may modify these values according to your data, e.g., the PE length ect
idba_ud -r ./interleaved_SG_01_11_2017.fa -r ./interleaved_SG_05_27_2016.fa -o idba_coassembly --mink 20 --maxk 120 --step 10 --num_threads 10
