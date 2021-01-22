#!/bin/bash
#SBATCH --job-name="prokka"
#SBATCH -A b1042
#SBATCH -p genomicsguest
#SBATCH -t 20:00:00
#SBATCH -N 1
#SBATCH --ntasks-per-node=10
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mckennafarmer2023@u.northwestern.edu
#SBATCH --output=outlog_prokka.txt
#SBATCH --error=errorlog_prokka.txt

module purge all
module load python/anaconda3.6
source activate /projects/b1052/pythonenvs/python3.6/prokka
module load perl/5.26

cd /projects/b1052/Wells_b1042/McKenna/training/SG_Metagenome/bins_final

# for loop to iterate over all the bins in the final bins folder
# prokka --outdir prokka_an --prefix bin1 --metagenome --cpus 10

for F in *.fa; do
  N=$(basename $F .fa) ;
  prokka $F --outdir $N --prefix $N --metagenome --cpus 10;
done
