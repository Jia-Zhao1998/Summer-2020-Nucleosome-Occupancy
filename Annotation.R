setwd('/Users/zhaojia/Downloads/')

# UCSC: S288cAnnotation_Final: 5769 obs of 5 var (unique)
S288cAnnotation <- read.delim(file = 'sgdGene.txt', header = FALSE)
# Information from http://hgdownload.soe.ucsc.edu/goldenPath/sacCer1/database/sgdGene.sql
colnames(S288cAnnotation) <- c("gene", "chromosome", "strand", "start", "end", "cds start", "cds end", "exon counts", "exon start", "exon end", "protein ID")
S288cAnnotation_Final <- S288cAnnotation[c(-6:-11)]

# SGD 20031126: SGD_Annotation_Final: 7513 obs of 6 var
# readGFF causes an error: reading GFF file: line 1 has more than 9 tab-separated columns
SGD_Annotation <- readGFF(filepath = '/Users/zhaojia/Downloads/s_cerevisiae.gff3.20031126')
# Use read.delim to import gff3 file
SGD <- read.delim(file='/Users/zhaojia/Downloads/s_cerevisiae.gff3.20031126', header = FALSE)

# Reformat and extract useful info
SGD_A <- SGD[c("V1","V3","V4","V5","V7","V9")]
SGD_Annotation_Final <- subset(SGD_A, V3 == "exon") # 
colnames(SGD_Annotation_Final) <- c("chromosome", "type", "start", "end", "strand", "gene")

call <- unique(SGD_Annotation_Final$gene)
length(call) # >7090 some genes have several exons

# R package:'GenomicFeatures' to extract UCSC genome: GF_Annotation: 7120 obs of 5 var (unique)
library(GenomicFeatures)
install.packages('RMariaDB')
library(RMariaDB)
GF_A <- makeTxDbFromUCSC(genome="sacCer1", tablename = "ensGene")
tr <- transcripts(GF_A)
GF_Annotation <- data.frame(seqnames(tr), start(tr), end(tr), strand(tr), tr$tx_name)
colnames(GF_Annotation) <- c("chromosome", "start", "end", "strand", "gene")

# Standard and systematic names conversion https://www.uniprot.org/docs/yeast.txt
Sc_genename_conversion <- data.frame(Standard = c("PHO5", "PHO84", "PHO8"), Systematic = c("YBR093C", "YML123C", "YDR481C"))