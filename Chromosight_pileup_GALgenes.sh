#!/bin/sh
subsample=24000000
thread=8
GAL2="_Genes/GAL2.bed2d" #file containing the coordinates of the GAL2 gene in bed2d format
genes="_Genes/GAL_genes.bed2d" #file containing the coordinates of the GAL-responsive genes in bed2d format
dir="/mnt/d/Science/Owncloud/Experiments/HiC/Chromosight/" #specify the directory where Chromosight input and output files are and will be located
dir_cool='/mnt/e/Science/HiC/Contact_files/Cool/S288c/' #specify the folder containing the matrices in cooler format binned at 1 kb
#Detection of loops from bed2d file generation above
#cooler balance -p3 $mat_cool'_1kb.cool';

sample=("AD636_S288c_DSB_chr3_rDNA_cutsite_q20" "AD638_S288c_DSB_chr3_rDNA_cutsite_q20" "AD639_S288c_DSB_chr3_rDNA_cutsite_q20")

for SAMP in "${sample[@]}" ; do
  chromosight quantify --pattern=borders --win-size=61 --perc-zero=100 --subsample=$subsample --threads=$thread $dir$genes $dir_cool$SAMP'_1kb.cool' $dir"_Genes/GAL_genes/"$SAMP'_GAL_genes_win_61kb_subsample_'$subsample;
  chromosight quantify --pattern=borders --win-size=61 --perc-zero=100 --subsample=$subsample --threads=$thread $dir$GAL2 $dir_cool$SAMP'_1kb.cool' $dir"_Genes/GAL_genes/"$SAMP'_GAL2_win_61kb_subsample_'$subsample;
done
