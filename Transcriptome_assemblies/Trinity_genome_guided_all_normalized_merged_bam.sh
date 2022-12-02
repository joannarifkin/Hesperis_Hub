#!/bin/bash


#SBATCH --account=rsbaucom0
#SBATCH --job-name=Trinity_Rifkin_Hesperis_combined_genome_guided
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH --mem=96GB
#SBATCH --time=7-00:00
#SBATCH --partition=standard
#SBATCH --output=Trinity_all_genome_guided-%A-%a.log

module purge
module load Bioinformatics
module load trinity/2.12.0
module list 

Trinity \
   --max_memory 96G \
   --genome_guided_max_intron 10000 \
   --full_cleanup \
   --verbose \
   --genome_guided_bam /nfs/turbo/rsbaucom/lab/Hesperis_transcriptome_assemblies_2022/STAR/Normalized/Pass2/merged_Hesperis_reads.bam