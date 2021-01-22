#!/bin/bash
#SBATCH --job-name="checkM"
#SBATCH -A b1042
#SBATCH -p genomicsguest
#SBATCH -t 10:00:00
#SBATCH -N 1
#SBATCH --ntasks-per-node=10
#SBATCH --mem-per-cpu=7G
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mckennafarmer2023@u.northwestern.edu
#SBATCH --output=checkM_outlog.txt
#SBATCH --error=checkM_errorlog.txt

module purge all
module load checkm/1.0.7

cd /projects/b1052/Wells_b1042/McKenna/SG_Metagenome/

#you need the bin_dir folder as input, the output directory is "checkM_results"
checkm lineage_wf -t 10 -x fa ./bins_dir ./checkM_results

#the quality of each genome bin is in the file of checkM_outlog
