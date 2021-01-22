#!/bin/bash
#SBATCH --job-name="bowtie2"
#SBATCH -A b1042
#SBATCH -p genomicsguest
#SBATCH -t 20:00:00
#SBATCH -N 1
#SBATCH --ntasks-per-node=10
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mckennafarmer2023@u.northwestern.edu
#SBATCH --output=outlog_bowtie2.txt
#SBATCH --error=errorlog_bowtie2.txt

BASENAME="SG_01_11_2017"

module purge all
module load bowtie2/2.2.6
module load samtools/1.2
module load perl/5.16

cd /projects/b1052/Wells_b1042/McKenna/training/SG_Metagenome/

#building mapping files from your contigs assembled
bowtie2-build ./IDBA/assembly_SG_01_11_2017/scaffold_01_11_2017.fa ./mapped_reads/$BASENAME

#bowtie mapping
bowtie2 --threads 10 -q -x ./mapped_reads/$BASENAME -1 ./clean_reads/$BASENAME.1.trimmed.fq -2 ./clean_reads/$BASENAME.2.trimmed.fq -S $BASENAME.bowtie2.sam
samtools view -bS $BASENAME.bowtie2.sam > $BASENAME.bowtie2.bam
samtools sort $BASENAME.bowtie2.bam $BASENAME.bowtie2.sorted
samtools depth $BASENAME.bowtie2.sorted.bam > $BASENAME.depth.txt
#end mapping

#to generate the coverage and length info of each contig based on the mapping results
#the coverage info generated could be used to calculate the abundance of each genome bin obtained; and the ratio of reads used to generate the contigs assembled; and the DNA/RBA RPKM values of each gene or genome
perl ./scripts/calc.coverage.in.bam.depth.pl -i $BASENAME.depth.txt -o $BASENAME.coverage.length.csv
