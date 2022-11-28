#!/bin/bash

#SBATCH --account=rsbaucom0
#SBATCH --job-name=Trinity_read_normalization_array
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=32
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=64GB
#SBATCH --time=2-00:00
#SBATCH --partition=standard
#SBATCH --output=Trinity_normalize-%A-%a.log
#SBATCH --array=1-20


module purge
module load Bioinformatics
module load trinity/2.12.0
module list 

file=$(ls /nfs/turbo/rsbaucom/lab/Hesperis_transcriptome_assemblies_2022/Trim_galore_*/*R1_val_1.fq.gz | sed -n ${SLURM_ARRAY_TASK_ID}p)
basefile=${file%_R1_val_1.fq.gz}
samplename=$(basename "$file" _R1_val_1.fq.gz)


echo $file
echo $basefile
echo $samplename

Trinity --just_normalize_reads --seqType fq --max_memory 64G --left $basefile\_R1_val_1.fq.gz --right $basefile\_R2_val_2.fq.gz --output $samplename\_trinity_out --verbose --full_cleanup