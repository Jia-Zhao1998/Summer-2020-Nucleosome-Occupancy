my_data <- read.table("GSM730535_WT_NoPi_Nucleosome.wig", header= FALSE, fill = TRUE) # create 4 columns fill in blank if missing value
head(my_data)
my_data <- subset(my_data, select= -c(V3, V4)) #two variables
which(grepl("chrom=chr1", my_data$V2)) # check the row number when the box has chrom=chr1 through 16 in it
# Use Python to find number of lines for chr 1-16. i.e. we have the first 204188 lines that belong to chr 1
repeats <- c(204188, 789301, 302985, 1455179, 554446, 259996, 1046755, 531878, 419578, 701524, 664965, 1020219, 888674, 746305, 1056602, 901321)
chromosome <- c("chr 1", "chr 2", "chr 3", "chr 4","chr 5", "chr 6", "chr 7", "chr 8","chr 9", "chr 10", "chr 11", "chr 12","chr 13", "chr 14", "chr 15", "chr 16")
my_data <- data.frame(rep(chromosome, repeats), my_data) # add a new column to specify chromosome number
colnames(my_data) <- c("chromosome","position", "data_value") # Edit column names
final_table <- my_data # create a copy
# Remove 17 rows that contain "variableStep" & "chrom =#" (declaration line)or the track definition line
final_table <- final_table[-c(1,2,204189,993490,1296475,2751654,3306100,3566096,4612851,5144729,5564307,6265831,6930796,7951015,8839689,9585994,10642596),]
