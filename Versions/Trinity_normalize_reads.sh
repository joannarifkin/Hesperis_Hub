#!/bin/bash

#SBATCH --account=rsbaucom0
#SBATCH --job-name=Trinity_read_normalization
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=32
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=64GB
#SBATCH --time=2-00:00
#SBATCH --partition=standard
#SBATCH --output=Trinity_normalize-%A-%a.log

module purge
module load Bioinformatics
module load trinity/2.12.0
module list 

Trinity --just_normalize_reads --seqType fq --max_memory 64G --left /scratch/rsbaucom_root/rsbaucom0/jlrifkin/Trinity_assemblies/Hesp_R1_val_all.fq.gz  --right /scratch/rsbaucom_root/rsbaucom0/jlrifkin/Trinity_assemblies/Hesp_R2_val_all.fq.gz  --verbose --full_cleanup