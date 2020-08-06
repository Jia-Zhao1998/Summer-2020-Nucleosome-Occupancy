# Import motif file
setwd('/Users/zhaojia/Desktop/C16 Nucleosome Occupancy/')
S288cMotif <- read.csv("Motif.csv", header = FALSE)
colnames(S288cMotif) <- c("chromosome", "motif", "start", "end")

# Function to plot motifs
Plot_motif <- function(gene = "YBR093C"){
  Nucleosome_Occupancy_PromoterPlot(gene)
  line3 <- S288cAnnotation_Final[which(S288cAnnotation_Final$gene == gene),] # look for a specific line about the gene
  if (line3$strand == "-"){ # plot motifs regarding strand info
    # filter motifs in the promoter region of the gene and plot based on consensus: 'red'/1 bp-off: 'blue'
    motifs <- S288cMotif[which(S288cMotif$chromosome == line3$chromosome & as.integer(S288cMotif$start) >= line3$end+1 & as.integer(S288cMotif$end) <= line3$end + 800),]
    segments(as.integer(motifs$start),0,as.integer(motifs$end),0,lwd = 10,col = ifelse(motifs$motif=="CACGTG", "red","blue"))
    legend("topright", title = "motif", c("CACGTG", "1-bp off"), fill = c("red", "blue"), horiz = TRUE, cex = 0.8)
  }else{
    motifs <- S288cMotif[which(S288cMotif$chromosome == line3$chromosome & as.integer(S288cMotif$start) >= line3$start - 800 & as.integer(S288cMotif$end) <= line3$start-1),]
    segments(as.integer(motifs$start),0,as.integer(motifs$end),0,lwd = 10,col = ifelse(motifs$motif=="CACGTG", "red","blue"))
    legend("topright", title = "motif", c("CACGTG", "1-bp off"), fill = c("red", "blue"), horiz = TRUE, cex = 0.8)
  }
}



