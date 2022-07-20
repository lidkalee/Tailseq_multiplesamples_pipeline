#!/bin/bash

# Declare an array of string with type#
declare -a StringArray=( 'deltacid1deltalsm1_clone1_S87_' )

# Iterate the string array using for loop
# Align R1 using salmon. Generate counttable and sam file as output.
for val in ${StringArray[@]}; do 
	echo "sample_${val}"; gunzip "data/${val}R2_001.fastq.gz" "R2_allsamples/alignmentR1/${val}R1_salmon_mapped.fastq"; fastq_pair "R2_allsamples/alignmentR1/${val}R1_salmon_mapped.fastq" "data/${val}R2_001.fastq"; gzip "data/${val}R2_001.fastq" "R2_allsamples/alignmentR1/${val}R1_salmon_mapped.fastq"; rm "R2_allsamples/alignmentR1/${val}R1_salmon_mapped.fastq.paired.fq" "R2_allsamples/alignmentR1/${val}R1_salmon_mapped.fastq.single.fq" "data/${val}R2_001.fastq.single.fq"; 
done




