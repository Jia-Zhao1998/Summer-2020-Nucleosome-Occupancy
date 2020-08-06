# Function: try_plot
# Plot the nucleosome occupancy of the promoter of a gene; x axis is [-800,-1] for both strands;ggplot2 based

try_plot <- function(gene = "YBR093C"){
  line <- S288cAnnotation_Final[which(S288cAnnotation_Final$gene == gene),] # find line for the gene
  library('ggplot2')
  sub_data <- final_table[final_table$chromosome == gsub("chr", "chr ", line$chromosome),] # final_table: Nucleosome occupancy data for WT_No_pi
  if (line$strand == "-"){
    sub_data <- sub_data[sub_data$position >= line$end + 1 & sub_data$position <= line$end + 800,]# find the nucleosome occupancy data for the promoter of the gene
    motifs <- S288cMotif[which(S288cMotif$chromosome == line$chromosome & as.integer(S288cMotif$start) >= line$end+1 & as.integer(S288cMotif$end) <= line$end + 800),] # find motifs position in data S288cMotif
    ggplot(data = sub_data, aes(x= position, y = data_value)) + geom_line() + ylim(0, max(sub_data$data_value)) + scale_x_continuous(breaks = seq(line$end+800, line$end+1, -100), labels = seq(-800, -1, 100), trans = 'reverse')+ theme_classic() + labs(title = line$gene) + annotate("segment", x = as.integer(motifs$start), xend = as.integer(motifs$end), y = 0 ,yend = 0, size = 5, col = ifelse(motifs$motif=="CACGTG", "red","blue")) + theme(text = element_text(size = 20)) # Plot both Nucleosome occupancy data and motifs data
  }else{
    sub_data <- sub_data[sub_data$position >= line$start - 800 & sub_data$position <= line$start - 1,]
    motifs <- S288cMotif[which(S288cMotif$chromosome == line3$chromosome & as.integer(S288cMotif$start) >= line$start - 800 & as.integer(S288cMotif$end) <= line$start-1),]
    ggplot(data = sub_data, aes(x= position, y = data_value)) + geom_line() + ylim(0, max(sub_data$data_value)) + scale_x_continuous(breaks = seq(line$start - 800, line$start - 1, 100), labels = seq(-800, -1, 100))+ theme_classic() + labs(title = line$gene) + annotate("segment", x = as.integer(motifs$start), xend = as.integer(motifs$end), y = 0 ,yend = 0, size = 5, col = ifelse(motifs$motif=="CACGTG", "red","blue")) + theme(text = element_text(size = 20))
  }
  #labs(x = "position", y ="Nucleosome Occupancy Score") + ylim(0, max(sub_data$data_value))
}