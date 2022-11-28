#!/bin/bash


#SBATCH --account=rsbaucom0
#SBATCH --job-name=Trinity_Rifkin_Hesperis_leaf
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=32
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=64GB 
#SBATCH --time=14-00:00
#SBATCH --partition=standard
#SBATCH --output=Trinity_all-%A-%a.log

module purge
module load Bioinformatics
module load trinity/2.12.0
module list 


Trinity --seqType fq --max_memory 48G --output /scratch/rsbaucom_root/rsbaucom0/jlrifkin/Trinity_assemblies/trinity_$samplename --left $file --right $samplename_tmp\_R2_trimmed.fq.gz --verbose --full_cleanup

--just_normalize_reads       

 Trinity --genome_guided_bam rnaseq.coordSorted.bam \
         --genome_guided_max_intron 10000 \
         --max_memory 10G --CPU 10 