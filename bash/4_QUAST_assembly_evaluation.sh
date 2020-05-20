#!/bin/bash
#SBATCH --job-name="QUAST"
#SBATCH -A b1042
#SBATCH -p genomicsguest
#SBATCH -t 05:00:00
#SBATCH -N 1
#SBATCH --ntasks-per-node=10
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mckennafarmer2023@u.northwestern.edu
#SBATCH --output=outlog_QUAST
#SBATCH --error=errorlog_QUAST

module purge all
module load python/anaconda3.6
module load boost/1.56.0

cd /projects/b1052/Wells_b1042/McKenna/training/SG_Metagenome/

# you can evalute as many assembly results as you like, specify the path to your assembly files as below

python /projects/b1052/shared/quast-4.6.3/quast.py ./IDBA/assembly_SG_05_27_2016/scaffold_05_27_2016.fa ./IDBA/assembly_SG_01_11_2017/scaffold_01_11_2017.fa -o quast
