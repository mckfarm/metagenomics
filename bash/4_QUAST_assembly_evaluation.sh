#!/bin/bash
#SBATCH --job-name="QUAST"
#SBATCH -A b1042
#SBATCH -p genomicsguest
#SBATCH -t 04:00:00
#SBATCH -N 1
#SBATCH --ntasks-per-node=5
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mckennafarmer2023@u.northwestern.edu
#SBATCH --output=outlog_QUAST.txt
#SBATCH --error=errorlog_QUAST.txt

module purge all
module load python

cd /projects/b1052/Wells_b1042/McKenna/SG_Metagenome/

# you can evalute as many assembly results as you like, specify the path to your assembly files as below

python /projects/b1052/shared/quast-5.0.2/quast.py ./IDBA/idba_coassembly/ -o quast
