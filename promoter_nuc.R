promoter_nuc <- function(genename ="Mix23p"){
  Rr <- proteinGRanges[names(proteinpromoterGRanges) == genename]
  chromosome <- as.character(seqnames(Rr))
  start <- start(Rr)
  end <- end(Rr)
  random_plot(data = final_table, chromosome, start, end)
  title(main = genename, sub = chromosome)
}

# Examples:

# De Fault
promoter_nuc()

# "uncharacterized protein YBL113C"

promoter_nuc(genename = "uncharacterized protein YBL113C")