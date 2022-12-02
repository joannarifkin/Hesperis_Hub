#!/bin/bash


#SBATCH --account=rsbaucom0
#SBATCH --job-name=Trinity_Rifkin_Hesperis_leaf
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH --mem=96GB
#SBATCH --time=14-00:00
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
   --genome_guided_bam \
   --samples_file genome_guide_sample.txt 