#!/bin/bash
#SBATCH --job-name="metabat_step2"
#SBATCH -A b1042
#SBATCH -p genomicsguest
#SBATCH -t 10:00:00
#SBATCH -N 1
#SBATCH --ntasks-per-node=10
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mckennafarmer2023@u.northwestern.edu
#SBATCH --output=outlog_metabat_step2
#SBATCH --error=errorlog_metabat_step2

module purge all
export PATH=$PATH:/projects/b1052/berkeleylab-metabat-cc5ccff537e8/metabat

cd /projects/b1052/Wells_b1042/McKenna/training/SG_Metagenome/

metabat2 -i ./IDBA/assembly_SG_05_27_2016/scaffold_05_27_2016.fa -a ./bowtie_alignment/depth1.txt -o bins_dir/bin1
metabat2 -i ./IDBA/assembly_SG_01_11_2017/scaffold_01_11_2017.fa -a ./bowtie_alignment/depth2.txt -o bins_dir/bin2
