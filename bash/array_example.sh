#!/bin/bash

#SBATCH -J humann2_results
#SBATCH -A e31333
#SBATCH -p normal
#SBATCH -N 1
#SBATCH -n 4
#SBATCH -t 48:00:00
#SBATCH --mem=48G
#SBATCH --array=1-15%4
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mckennafarmer2023@u.northwestern.edu
#SBATCH --output=humann2_array_%A_%a.txt
#SBATCH --error=humann2_array_%A_%a.txt

module purge all
module load singularity

echo "Starting Humann2 job"

file=$(ls /projects/e31333/mckenna/humann2/kneaddata_output/*kneaddata.fastq | sed -n ${SLURM_ARRAY_TASK_ID}p)

singularity exec -B /projects/e31333 -B /projects/e31333/mckenna/humann2/kneaddata_output -B /projects/e31333/humann2_ref_data /projects/e31333/biobakery_diamondv0822.sif humann2 --input ${file} --output /projects/e31333/mckenna/humann2/ --resume --threads 4 --nucleotide-database /projects/e31333/humann2_ref_data/chocophlan --protein-database /projects/e31333/humann2_ref_data/uniref50

echo "Finishing Humann2 job"
