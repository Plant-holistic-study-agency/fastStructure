# fastStructure
A collection of files for running fastStructure on population genetic data.

Intstructions:

First, you will need a filtered vcf file.

You will also need a text file listing all of the chromosomes (you can call it chrom-map.txt).
Here is an example of what it should look like:
SL3.0ch01	01
SL3.0ch02	02
SL3.0ch03	03
SL3.0ch04	04
SL3.0ch05	05
SL3.0ch06	06
SL3.0ch07	07
SL3.0ch08	08
SL3.0ch09	09
SL3.0ch10	10
SL3.0ch11	11
SL3.0ch12	12

Then you will use vcftools to output files in plink format. You will need .ped and .map files going forward
Example command:
$ vcftools --vcf sc-sg-spm20mac2.recode.vcf --out sc-sg-spm20mac2 --chrom-map chrom-map.txt --plink

Next convert .ped files to .bed format
Ex:
$ plink --file sc-sg-spm20mac2 --make-bed --noweb --out plink_sc-sg-spm_20mac2
#check that the .ped and .bed,.bim,.fam files were created


Files in this repository:
-
