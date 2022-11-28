#!/bin/bash

#SBATCH --account=rsbaucom0
#SBATCH --job-name=Trinity_read_normalization_array
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=32
#SBATCH --nodes=3
#SBATCH --ntasks-per-node=1
#SBATCH --mem=96GB
#SBATCH --time=2-00:00
#SBATCH --partition=standard
#SBATCH --output=Trinity_normalize-%A-%a.log
#SBATCH --array=1-3


module purge
module load Bioinformatics
module load trinity/2.12.0
module list 

file=$(ls /nfs/turbo/rsbaucom/lab/Hesperis_transcriptome_assemblies_2022/Trim_galore_*/*{13,15,16}.Hesp*R1_val_1.fq.gz | sed -n ${SLURM_ARRAY_TASK_ID}p)
basefile=${file%_R1_val_1.fq.gz}
samplename=$(basename "$file" _R1_val_1.fq.gz)


echo $file
echo $basefile
echo $samplename

Trinity --just_normalize_reads --seqType fq --max_memory 96G --left $basefile\_R1_val_1.fq.gz --right $basefile\_R2_val_2.fq.gz --output $samplename\_trinity_out --verbose --full_cleanup

#Files to match with glob 
#/nfs/turbo/rsbaucom/lab/Hesperis_transcriptome_assemblies_2022/Trim_galore_leaf/HI.0286.001.Index_13.Hesp1_R1_val_1.fq.gz'
#/nfs/turbo/rsbaucom/lab/Hesperis_transcriptome_assemblies_2022/Trim_galore_leaf/HI.0286.001.Index_15.Hesp10_R1_val_1.fq.gz'
#/nfs/turbo/rsbaucom/lab/Hesperis_transcriptome_assemblies_2022/Trim_galore_leaf/HI.0286.001.Index_16.Hesp2_R1_val_1.fq.gz'
