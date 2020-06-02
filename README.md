# fastStructure
A collection of files for running fastStructure on population genetic data.

# Instructions:

First, you will need a filtered vcf file.

You will also need a text file listing all of the chromosomes (you can call it chrom-map.txt; see the example file in this repository for what it should look like).

Then run the fstruc.sh script (see separate file of that name in the repository). 
On the MGHPCC, use the command

$ bsub < fstruc.sh

Submitting to the short queue is fine as this should only take a few minutes.

Then run the choosek.py script.
Ex:

$ python /share/pkg/fastStructure/v1.0-4-ge47212f/chooseK.py --input=20190102_sc-sg-spm20mac2 

Copy the .meanQ, .bed, .bim, and .fam files to your local machine, and use R to plot the meanQ files. 

In order to keep the sample ID numbers straight and to add info to your plot based on barcode ID, you may need additional text files to keep these things straight. 
Examples are provided with the files:
barcode_ID_info.txt
and
barcodes_plink_order.txt



# Files in this repository:

chrom-map.txt

fstruc.sh

barcode_ID_info.txt

barcodes_plink_order.txt
