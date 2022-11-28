#!/bin/bash


#SBATCH --account=rsbaucom0
#SBATCH --job-name=Trinity_Rifkin_Hesperis_leaf
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=4
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=16GB 
#SBATCH --time=14-00:00
#SBATCH --partition=standard
#SBATCH --output=Trinity_leaf-%A-%a.log
#SBATCH --array=1-10%2

module purge
module load Bioinformatics
module load trinity/2.12.0
module list 

file=$(ls /nfs/turbo/rsbaucom/lab/Hesperis_transcriptome_assemblies_2022/Trim_galore_leaf/*R1_trimmed.fq.gz | sed -n ${SLURM_ARRAY_TASK_ID}p)
echo $file
printf "\n"
samplename_tmp=${file%\_R1_trimmed.fq.gz}
samplename=$(basename "$samplename_tmp")
echo $samplename_tmp
#samplename=${samplename_tmp##floral}
echo $samplename


Trinity --seqType fq --max_memory 48G --output /scratch/rsbaucom_root/rsbaucom0/jlrifkin/Trinity_assemblies/trinity_$samplename --left $file --right $samplename_tmp\_R2_trimmed.fq.gz --verbose --full_cleanup
