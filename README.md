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

In order to keep the sample ID numbers straight and to add info to your plot based on barcode ID, you may need to create your own additional text files to keep these things straight. Look back into the original vcf file to find the order in which your samples were listed, and use that to make a simple text files with the "plink order" that your samples should be listed in the meanQ files. 
Examples are provided with the files:
barcode_ID_info.txt
and
barcodes_plink_order.txt


Pophelper is the package to plot the result of the fastSTRUCTURE. The input file is the meanQ file from fastSTRUCTURE. The individual information and group information are also important. 


# Files in this repository:

*These first 4 files are for running fastStructure

chrom-map.txt

fstruc.sh

barcode_ID_info.txt

barcodes_plink_order.txt

*These next files are so you can run through an example of how to create a plot with pophelper

pophelper_rice_example.R     ### sample R code for making a plot with pophelper. requires the next 3 files as input

meanQ_5.csv

meanQ_5_original_order.csv

meanQ5_re_order.csv

meanQ_5.pdf   ### example of what an output plot looks like

Populations.csv  ### another example of a possible input file
