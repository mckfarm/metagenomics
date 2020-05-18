#!/bin/bash
#SBATCH --job-name="convert_fq_to_fa"
#SBATCH -A b1042
#SBATCH -p genomicsguest
#SBATCH -t 10:00:00
#SBATCH -N 1
#SBATCH --ntasks-per-node=10
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mckennafarmer2023@u.northwestern.edu
#SBATCH --output=outlog_convert_fq_to_fa
#SBATCH --error=errorlog_convert_fq_to_fa

# can load the fastx module
# module purge all
# module load fastx_toolkit/0.0.14

# or change the home directory to your own software file path
export PATH=$PATH:/home/mmf8608/software/bin/

cd /projects/b1052/Wells_b1042/McKenna/training/SG_Metagenome/clean_reads

fastq_to_fasta -Q33 -v -i ./SG_01_11_2017_S17_R1_trimmed.fq -o ./fa/SG_01_11_2017.1.fa
fastq_to_fasta -Q33 -v -i ./SG_01_11_2017_S17_R2_trimmed.fq -o ./fa/SG_01_11_2017.2.fa
fastq_to_fasta -Q33 -v -i ./SG_05_27_2016_S16_R1_trimmed.fq -o ./fa/SG_05_27_2016.1.fa
fastq_to_fasta -Q33 -v -i ./SG_05_27_2016_S16_R2_trimmed.fq -o ./fa/SG_05_27_2016.2.fa
