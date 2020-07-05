WT_No_Pi_Nucleosome_Python <- read.csv("WT_NO_Pi_Nucleosome_Python.csv", header=FALSE)
colnames(WT_No_Pi_Nucleosome_Python) <- c("position", "data_value", "chromosome")
table(WT_No_Pi_Nucleosome_Python$chromosome)