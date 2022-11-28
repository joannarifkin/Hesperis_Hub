#!/bin/bash


#SBATCH --account=rsbaucom0
#SBATCH --job-name=FastQC_Rifkin_Hesperis_flower
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=1GB 
#SBATCH --time=200:00
#SBATCH --partition=standard
#SBATCH --output=FastQC-%A-%a.log
#SBATCH --array=1-20

module load Bioinformatics
module load Bioinformatics  gcc/10.3.0-k2osx5y
module load fastqc/0.11.9-p6ckgle

mkdir -p ./FastQC_flower/
file=$(ls /nfs/turbo/rsbaucom/lab/Hesperis/floral/*.fastq.gz | sed -n ${SLURM_ARRAY_TASK_ID}p)
fastqc -o ./FastQC_flower/ $file
