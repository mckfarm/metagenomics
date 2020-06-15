#!/bin/bash
#SBATCH --job-name="gtdb"
#SBATCH -A b1042
#SBATCH -p genomicsguest
#SBATCH -t 05:00:00
#SBATCH -N 1
#SBATCH --ntasks-per-node=10
#SBATCH --mem-per-cpu=11G
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mckennafarmer2023@u.northwestern.edu
#SBATCH --output=outlog_gtdb
#SBATCH --error=errorlog_gtdb


module load python/anaconda3.6

# export PATH=”$PATH：/projects/b1052/pythonenvs/python3.6/gtdb/site-packages/gtdbtk/“
# pip install scipy
# pip install matplotlib
# pip install numpy

source activate /projects/b1052/pythonenvs/python3.6/gtdb

cd /projects/b1052/Wells_b1042/McKenna/training/SG_Metagenome

gtdbtk classify_wf --debug -x fa --cpus 15 --pplacer_cpus 1 --genome_dir ./bins_final --out_dir ./gtdbtk_bins
