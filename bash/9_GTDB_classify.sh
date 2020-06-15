#!/bin/bash
#SBATCH --job-name="gtdb_classify"
#SBATCH -A b1042
#SBATCH -p genomicsguest
#SBATCH -t 07:00:00
#SBATCH -N 1
#SBATCH --mem=100G
#SBATCH --ntasks-per-node=1
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mckennafarmer2023@u.northwestern.edu
#SBATCH --output=outlog_gtdb_cla
#SBATCH --error=errorlog_gtdb_cla


module load python/anaconda3.6

# export PATH=”$PATH：/projects/b1052/pythonenvs/python3.6/gtdb/site-packages/gtdbtk/“
# pip install scipy
# pip install matplotlib
# pip install numpy

source activate /projects/b1052/pythonenvs/python3.6/gtdb

cd /projects/b1052/Wells_b1042/McKenna/training/SG_Metagenome

gtdbtk classify --debug --align_dir ./gtdbtk_bins --cpus 1 --extension fa --genome_dir ./bins_final --out_dir ./gtdbtk_bins
