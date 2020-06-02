# fastStructure
A collection of files for running fastStructure on population genetic data.

# Instructions:

First, you will need a filtered vcf file.

You will also need a text file listing all of the chromosomes (you can call it chrom-map.txt; see the example file in this repository for what it should look like).

Then you will use vcftools to output files in plink format. You will need .ped and .map files going forward
Example command:
$ vcftools --vcf sc-sg-spm20mac2.recode.vcf --out sc-sg-spm20mac2 --chrom-map chrom-map.txt --plink

Next convert .ped files to .bed format
Ex:
$ plink --file sc-sg-spm20mac2 --make-bed --noweb --out plink_sc-sg-spm_20mac2

Once you have the .ped and .bed,.bim,.fam files created, you can run the fstruc.sh script (see separate file of that name in the repository). 
On the MGHPCC, use the command
$ bsub < fstruc.sh
Submitting to the short queue is fine as this should only take a few minutes.

Then run the choosek.py script
Ex:
$ python /share/pkg/fastStructure/v1.0-4-ge47212f/chooseK.py --input=20190102_sc-sg-spm20mac2 

Copy the .meanQ, .bed, .bim, and .fam files to your local machine, and use R to plot the meanQ files. 




# Files in this repository:

chrom-map.txt

fstruc.sh


