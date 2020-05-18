#!/bin/bash
#SBATCH --job-name="fastx_trimmer"
#SBATCH -A b1042
#SBATCH -p genomicsguest
#SBATCH -t 24:00:00
#SBATCH -N 1
#SBATCH --ntasks-per-node=10
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mckennafarmer2023@u.northwestern.edu
#SBATCH --output=outlog_fastx_trimmer
#SBATCH --error=errorlog_fastx_trimmer

# can load the fastx module
module purge all
module load fastx_toolkit/0.0.14

# or change the home directory to your own software file path
# export PATH=$PATH:/home/mmf8608/software/bin/

cd /projects/b1052/Wells_b1042/McKenna/training/SG_Metagenome/raw_data

#trim the sequences to a certain length, sequences trimmed to 120bp, modify according to the quality of sequence data;
#in cases where the quality is good enough, you can skip this trimming step (in other words, no trimming is needed)

fastx_trimmer -Q33 -f 1 -l 120 -i SG_01_11_2017_S17_R1_trimmed.fq -o ./fastx_trimmed/SG_01_11_2017_S17_R1_trimmed.fq
fastx_trimmer -Q33 -f 1 -l 120 -i SG_01_11_2017_S17_R2_trimmed.fq -o ./fastx_trimmed/SG_01_11_2017_S17_R2_trimmed.fq
fastx_trimmer -Q33 -f 1 -l 120 -i SG_05_27_2016_S16_R1_trimmed.fq -o ./fastx_trimmed/SG_05_27_2016_S16_R1_trimmed.fq
fastx_trimmer -Q33 -f 1 -l 120 -i SG_05_27_2016_S16_R2_trimmed.fq -o ./fastx_trimmed/SG_05_27_2016_S16_R2_trimmed.fq
