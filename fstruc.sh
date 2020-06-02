#!/bin/bash 

# you may need to run the following line once to make the .sh file executable
## chmod u+x fstruc.sh

# the following line is what you would use to submit this job to the queue once you have added the file names
## bsub -q short -W 4:00 -n 1 -R rusage[mem=10000] -o fastStructure.out -e fastStructure.err ./fstruc.sh

module load python3/3.5.0 fastStructure/v1.0-4-ge47212f R/3.3.1 plink/1.07 vcftools/0.1.14

input_vcf=<insert filtered vcf file name here>
output_name=<insert name for output files here>
date=<insert date here in format 20181102>

# convert vcf file to plink format
vcftools --vcf $input_vcf --out $output_name --chrom-map chrom-map.txt --plink

# convert plink .ped files to .bed format
plink --file $output_name --make-bed --noweb --out plink$output_name

# run FastStructure to loop through 2 to 10 populations (this number can be changed)
for i in {2..10};
	do 
	bsub -q short -W 4:00  -R rusage[mem=10000]  -n 1 -o fastStructure_$i.out -e fastStructure_$i.err python /share/pkg/fastStructure/v1.0-4-ge47212f/structure.py -K $i --input=plink$output_name --output=$date --full; 
done

# run the following line separately after the above lines have been run
# this will tell you the most likely K (number of populations)
##python /share/pkg/fastStructure/v1.0-4-ge47212f/chooseK.py --input=$date
