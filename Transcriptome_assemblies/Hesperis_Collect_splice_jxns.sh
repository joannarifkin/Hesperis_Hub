#!/bin/bash

mkdir -p /nfs/turbo/rsbaucom/lab/Hesperis_transcriptome_assemblies_2022/STAR/Pass1/pass1SJ
for i in /nfs/turbo/rsbaucom/lab/Hesperis_transcriptome_assemblies_2022/STAR/Pass1/*SJ.out.tab
do 
	awk '{ if ($7 >= 3) print $0}' $i > $i.filtered
	mv $i.filtered /nfs/turbo/rsbaucom/lab/Hesperis_transcriptome_assemblies_2022/STAR/Pass1/pass1SJ/
done
cat /nfs/turbo/rsbaucom/lab/Hesperis_transcriptome_assemblies_2022/STAR/Pass1/pass1SJ/*SJ.out.tab.filtered > /nfs/turbo/rsbaucom/lab/Hesperis_transcriptome_assemblies_2022/STAR/SJ.all.tab
