#!/bin/bash
#SBATCH --job-name="tar_m"
#SBATCH -A b1042
#SBATCH -p genomicsguest
#SBATCH -t 24:00:00
#SBATCH -N 1
#SBATCH --mem=15G
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mckennafarmer2023@u.northwestern.edu
#SBATCH --output=out_tar_m.txt
#SBATCH --error=err_tar_m.txt

# tar -czf morgan.tar.gz Morgan
# tar -czf jim.tar.gz Jim

cd /projects/b1052/Wells_b1042/Morgan
for dir in */
do
  base=$(basename "$dir")
  tar -czf "${base}.tar.gz" "$dir"
done
