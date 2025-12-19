#!/bin/bash
inputdir="" #provide the path to the directory containing matrices binned at 1kb in cooler format
outputdir="" #provide an output path to output the matrix in pdf format
sample=("AD161_S288c_DSB_chr3_rDNA_cutsite_q20")
for SAMP in "${sample[@]}" ; do
  hicstuff view -b 1kb -m -4 -M -2 -T log10 -c YlOrBr -n -r chr3 -N 10 -o $outputdir$SAMP"_chr3_1kb_log_N10_m4M1.5.pdf" $inputdir$SAMP"_1kb.cool";
  hicstuff view -b 2kb -m -4 -M -2 -T log10 -c YlOrBr -n -r chr4:605000-920000 -N 10 -o $outputdir$SAMP"_chr4-605-920kb_2kb_log_N10_m4M2.pdf" $inputdir$SAMP"_1kb.cool";
  hicstuff view -b 2kb -m -4 -M -2 -T log10 -c YlOrBr -n -r chr12 -N 10 -o $outputdir$SAMP"_chr12_2kb_log_N10_m4M2.pdf" $inputdir$SAMP"_1kb.cool";
  hicstuff view -b 15kb -m -4 -M -1.5 -T log10 -c YlOrBr -n -N 10 -o $outputdir$SAMP"_WG_15kb_log_N10_m4M1.5.pdf" $inputdir$SAMP"_1kb.cool";
done
