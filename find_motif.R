library(rtracklayer)
#Convert 2bit sequence data to a data frame and export as csv
S288c20031001 <- import.2bit('sacCer1.2bit')
S288cSeqDF <- data.frame(S288c20031001)
write.csv(S288cSeqDF, file = "S288c_genome_seq.csv")

#Use Python to find motifs and store info in Motif.csv
S288cMotif <- read.csv("Motif.csv", header = FALSE)
colnames(S288cMotif) <- c("chromosome", "motif", "start", "end")