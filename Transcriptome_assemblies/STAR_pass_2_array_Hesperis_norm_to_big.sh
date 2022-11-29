#!/bin/bash

#SBATCH --account=rsbaucom0
#SBATCH --job-name=STAR_pass_2_Rifkin_Hesperis_normalized
#SBATCH --mail-user=jlrifkin@umich.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --cpus-per-task=32
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=64GB
#SBATCH --time=2-00:00
#SBATCH --partition=standard
#SBATCH --output=Hesperis_STAR_pass_2_normalized-%A-%a.log
#SBATCH --array=1-20


module purge
#module load Bioinformatics #To use the GL version, use these lines. 
#module load Bioinformatics gcc/10.3.0-k2osx5y
#module load star/2.7.6a-aekjdpr

module use /nfs/turbo/rsbaucom/lab/Lmod #To use the Baucom lab version, use these lines. To use a local version you add to your path, omit them.
module load STAR_module
module list

file=$(ls /nfs/turbo/rsbaucom/lab/Hesperis_transcriptome_assemblies_2022/Trinity_normalize/Normalized_reads/*R1_val_1_normalized.fq.gz | sed -n ${SLURM_ARRAY_TASK_ID}p)
basefile=${file%_R1_val_1_normalized.fq.gz}
samplename=$(basename "$file" _R1_val_1_normalized.fq.gz)


echo $file
echo $basefile
echo $samplename

mkdir -p ./STAR/Normalized/
mkdir -p ./STAR/Normalized/Pass2/

STAR --runThreadN 6 \
--genomeDir /nfs/turbo/rsbaucom/lab/Hesperis_Dovetail/Hi-Rise_Assembly_September_2022/Hesperis_assembly_big_contigs \
--readFilesIn $basefile\_R1_val_1_normalized.fq.gz $basefile\_R2_val_2_normalized.fq.gz \
--readFilesCommand zcat \
--outFileNamePrefix ./STAR/Normalized/Pass2/$samplename \
--outSAMtype BAM SortedByCoordinate \
--sjdbFileChrStartEnd STAR/Normalized_SJ.all.tab

