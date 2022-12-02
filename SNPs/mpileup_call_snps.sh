#!/bin/bash

#SBATCH --account=rsbaucom0
#SBATCH --job-name=call_SNPs_Hesperis_transcriptome
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=2
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=32GB
#SBATCH --time=4-00:00
#SBATCH --output=mpileup-%A-%a.log
#SBATCH --partition=standard

#Call raw SNPs from all RNAseq samples

#Use either the Baucom lab bcftools module, with version 1.16, or the GL one, with version 1.12
module purge
module use /nfs/turbo/rsbaucom/lab/Lmod
module load bcftools_module
module list
export BCFTOOLS_PLUGINS=/nfs/turbo/rsbaucom/lab/SOFTWARE/bcftools/plugins

#module purge
#module load Bioinformatics
#module load Bioinformatics gcc/10.3.0-k2osx5y
#module load bcftools/1.12-g4b275e
#module list

bcftools mpileup --threads 10 -a AD,DP -Ou --max-depth 1000 -f /nfs/turbo/rsbaucom/lab/Hesperis_Dovetail/Hi-Rise_Assembly_September_2022/Hesperis_assembly.fasta \
-b Transcriptome_alignment_file_list.txt | bcftools call --threads 10 -mv -O z -f gq -o Raw_Hesperis_transcriptome_calls_12-2.vcf.gz 