# Xiang's instructions for using Pophelper
# with a 5 population rice data set as an example

#### 1. Installation ====
# install and load packages with the pacman package (install pacman if needed)
# install.packages("pacman")
pacman::p_load("devtools","ggplot2","gridExtra","gtable","label.switching","tidyr", 
               "pophelper")

#### 2. Input files ====
pop_k_5_reorder <- readQ('meanQ_5.csv')
#use the 'readQ' in Pophelper to read the data into R and covert to a 'qlist' filetype.
attributes(pop_k_5_reorder[[1]])
#use the 'attributes' to check the facts of the data, like number of individual, the number of k. 

#### 3. Plot the figures ====
# first plot without group labels just to make sure the input file worked
plotQ(pop_k_5_reorder[1], 
      sortind='all', 
      clustercol=c("coral","steelblue","lightblue","purple","orange"), 
      imgtype = 'pdf'
      )
#pop_k_5_reorder is the qlist
#sortind. Individuals in a plot are by default plotted in the order as in the input data. 
#clustercol. Each cluster gets a distinct colour. You can use clustercol to set up the color. You can check the website to choose the color. 
#imgtype. Normally I save the output as the pdf file. 


# Next you may want to group individuals by known a priori grouping, such as wild rice, weedy rice, etc.

# an example of how to sort the samples with specific a group order
p5_ori <- read.csv('meanQ_5_original_order.csv')
# create a list with the group order you want
group_order <- c('Wild rice', 'US weedy rice-SH', 'US weedy rice-BHA','South Asian weedy rice', 'SE Asian weedy rice','NE Asian weedy rice','Colombian weedy rice', 'indica','aus','japonica','admixed cultivar','Colombian landraces','Colombian commercial rice')
# use the sapply functin to apply this new order and change the original order
p5_reorder <- p5_ori[order(sapply(p5_ori$Group, function(x) which(x==group_order))), ]
# write a new csv file with this update order
write.csv(p5_reorder,'meanQ5_re_order.csv')
# Remove the Group and individual columns and create a new object with the final group labels.
labels_final<-read.csv('meanQ5_re_order.csv',stringsAsFactors = F)
sapply(labels_final, is.character)
g_labels_final<-labels_final[,8,drop=FALSE]
# Make sure the order of the group information aligns to the order of the individuals in the meanQ.


# Now re-plot the figure with the 'g_labels_final' order
plotQ(pop_k_5_reorder[1], 
      grplab = g_labels_final, 
      grplabsize = .9,  # adjust text size of the group labels
      grplabangle = 25, # adjust angle of the group labels
      grplabpos = .6, # adjust position of group labels so they fit better on the figure
      grplabheight = 2.5, # adjust group label height so the labels are not cut off
      sortind='all', 
      clustercol=c("coral","steelblue","lightblue","purple","orange"), 
      imgtype = 'pdf'
)
