#!/bin/bash
#SBATCH --job-name="blast_amoA"
#SBATCH -A b1042
#SBATCH -p genomicsguest
#SBATCH -t 10:00:00
#SBATCH -N 1
#SBATCH --ntasks-per-node=10
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mckennafarmer2023@u.northwestern.edu
#SBATCH --output=outlog_blast.txt
#SBATCH --error=errorlog_blast.txt

module load blast/2.7.1

# cd /projects/b1052/Wells_b1042/yuboer/fungene/amoA/comammox_amoA

#make blast database from amoA gene fasta file
# makeblastdb -in s_amoA_daims_genbank_aa.fasta -parse_seqids -dbtype nucl -title "amoA_db"

cd /projects/b1052/Wells_b1042/McKenna/training/SG_Metagenome/bins_final

tblastn -query ./bin1_7.fa -db /projects/b1052/Wells_b1042/yuboer/fungene/amoA/comammox_amoA/s_amoA_daims_genbank_aa.fasta -num_threads 10 -evalue 1e-5 -max_target_seqs 1 -outfmt 6 -out ./blast_bin1_7.txt
tblastn -query ./bin1_8.fa -db /projects/b1052/Wells_b1042/yuboer/fungene/amoA/comammox_amoA/s_amoA_daims_genbank_aa.fasta -num_threads 10 -evalue 1e-5 -max_target_seqs 1 -outfmt 6 -out ./blast_bin1_8.txt
tblastn -query ./bin1_9.fa -db /projects/b1052/Wells_b1042/yuboer/fungene/amoA/comammox_amoA/s_amoA_daims_genbank_aa.fasta -num_threads 10 -evalue 1e-5 -max_target_seqs 1 -outfmt 6 -out ./blast_bin1_9.txt
tblastn -query ./bin1_17.fa -db /projects/b1052/Wells_b1042/yuboer/fungene/amoA/comammox_amoA/s_amoA_daims_genbank_aa.fasta -num_threads 10 -evalue 1e-5 -max_target_seqs 1 -outfmt 6 -out ./blast_bin1_17.txt
tblastn -query ./bin1_18.fa -db /projects/b1052/Wells_b1042/yuboer/fungene/amoA/comammox_amoA/s_amoA_daims_genbank_aa.fasta -num_threads 10 -evalue 1e-5 -max_target_seqs 1 -outfmt 6 -out ./blast_bin1_18.txt
tblastn -query ./bin1_20.fa -db /projects/b1052/Wells_b1042/yuboer/fungene/amoA/comammox_amoA/s_amoA_daims_genbank_aa.fasta -num_threads 10 -evalue 1e-5 -max_target_seqs 1 -outfmt 6 -out ./blast_bin1_20.txt
tblastn -query ./bin1_21.fa -db /projects/b1052/Wells_b1042/yuboer/fungene/amoA/comammox_amoA/s_amoA_daims_genbank_aa.fasta -num_threads 10 -evalue 1e-5 -max_target_seqs 1 -outfmt 6 -out ./blast_bin1_21.txt
tblastn -query ./bin1_24.fa -db /projects/b1052/Wells_b1042/yuboer/fungene/amoA/comammox_amoA/s_amoA_daims_genbank_aa.fasta -num_threads 10 -evalue 1e-5 -max_target_seqs 1 -outfmt 6 -out ./blast_bin1_24.txt
tblastn -query ./bin1_26.fa -db /projects/b1052/Wells_b1042/yuboer/fungene/amoA/comammox_amoA/s_amoA_daims_genbank_aa.fasta -num_threads 10 -evalue 1e-5 -max_target_seqs 1 -outfmt 6 -out ./blast_bin1_26.txt
tblastn -query ./bin1_28.fa -db /projects/b1052/Wells_b1042/yuboer/fungene/amoA/comammox_amoA/s_amoA_daims_genbank_aa.fasta -num_threads 10 -evalue 1e-5 -max_target_seqs 1 -outfmt 6 -out ./blast_bin1_28.txt
tblastn -query ./bin1_34.fa -db /projects/b1052/Wells_b1042/yuboer/fungene/amoA/comammox_amoA/s_amoA_daims_genbank_aa.fasta -num_threads 10 -evalue 1e-5 -max_target_seqs 1 -outfmt 6 -out ./blast_bin1_34.txt
tblastn -query ./bin1_43.fa -db /projects/b1052/Wells_b1042/yuboer/fungene/amoA/comammox_amoA/s_amoA_daims_genbank_aa.fasta -num_threads 10 -evalue 1e-5 -max_target_seqs 1 -outfmt 6 -out ./blast_bin1_43.txt
tblastn -query ./bin2_18.fa -db /projects/b1052/Wells_b1042/yuboer/fungene/amoA/comammox_amoA/s_amoA_daims_genbank_aa.fasta -num_threads 10 -evalue 1e-5 -max_target_seqs 1 -outfmt 6 -out ./blast_bin2_18.txt
tblastn -query ./bin2_21.fa -db /projects/b1052/Wells_b1042/yuboer/fungene/amoA/comammox_amoA/s_amoA_daims_genbank_aa.fasta -num_threads 10 -evalue 1e-5 -max_target_seqs 1 -outfmt 6 -out ./blast_bin2_21.txt
tblastn -query ./bin2_23.fa -db /projects/b1052/Wells_b1042/yuboer/fungene/amoA/comammox_amoA/s_amoA_daims_genbank_aa.fasta -num_threads 10 -evalue 1e-5 -max_target_seqs 1 -outfmt 6 -out ./blast_bin2_23.txt
tblastn -query ./bin2_34.fa -db /projects/b1052/Wells_b1042/yuboer/fungene/amoA/comammox_amoA/s_amoA_daims_genbank_aa.fasta -num_threads 10 -evalue 1e-5 -max_target_seqs 1 -outfmt 6 -out ./blast_bin2_34.txt
tblastn -query ./bin2_38.fa -db /projects/b1052/Wells_b1042/yuboer/fungene/amoA/comammox_amoA/s_amoA_daims_genbank_aa.fasta -num_threads 10 -evalue 1e-5 -max_target_seqs 1 -outfmt 6 -out ./blast_bin2_38.txt
