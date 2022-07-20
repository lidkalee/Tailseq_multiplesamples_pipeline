#!/bin/bash

# Declare an array of string with type#
declare -a StringArray=('deltacid1_clone1_S77_' 'deltacid1_clone2_S78_' 'deltacid1deltadis32_clone1_S85_' 'deltacid1deltadis32_clone2_S86_' 'deltacid1deltadis32deltalsm1_clone1_S97_' 'deltacid1deltadis32deltalsm1_clone2_S98_' 'deltacid1deltadis32deltaski2_clone1_S99_' 'deltacid1deltadis32deltaski2_clone2_S100_' 'deltacid1deltalsm1_clone1_S87_' 'deltacid1deltalsm1_clone2_S88_' 'deltacid1deltalsm1deltaski2_clone1_S101_' 'deltacid1deltalsm1deltaski2_clone2_S102_' 'deltacid1deltaski2_clone1_S89_' 'deltacid1deltaski2_clone2_S90_' 'deltadis32_clone1_S79_' 'deltadis32_clone2_S80_' 'deltadis32deltalsm1_clone1_S91_' 'deltadis32deltalsm1_clone2_S92_' 'deltadis32deltalsm1deltaski2_clone1_S103_' 'deltadis32deltalsm1deltaski2_clone2_S104_' 'deltadis32deltaski2_clone1_S93_' 'deltadis32deltaski2_clone2_S94_' 'deltalsm1_clone1_S81_' 'deltalsm1_clone2_S82_' 'deltalsm1deltaski2_clone1_S95_' 'deltalsm1deltaski2_clone2_S96_' 'deltaski2_clone1_S83_' 'deltaski2_clone2_S84_' 'Wild_type_clone1_TS_S75_' 'Wild_type_clone2_TS_S76_')

# Iterate the string array using for loop
# Align R1 using salmon. Generate counttable and sam file as output.
for val in ${StringArray[@]}; do 
	echo "sample_${val}"; grep A00805 "R2_allsamples/alignmentR1/${val}R1_salmon.sam" > "R2_allsamples/alignmentR1/${val}R1_onlyreads.sam";  sam2bed < "R2_allsamples/alignmentR1/${val}R1_onlyreads.sam" > "R2_allsamples/alignmentR1/${val}R1_onlyreads.bed"; gzip "R2_allsamples/alignmentR1/${val}R1_salmon.sam"; awk -F"\t" '{print $1,$4,$6,$7}' "R2_allsamples/alignmentR1/${val}R1_onlyreads.bed" > "R2_allsamples/alignmentR1/${val}R1b.bed"; awk -F"\t" '{print $1,$2,$3}' "R2_allsamples/alignmentR1/${val}R1_onlyreads.sam" > "R2_allsamples/alignmentR1/${val}R1b.sam"; 
done


