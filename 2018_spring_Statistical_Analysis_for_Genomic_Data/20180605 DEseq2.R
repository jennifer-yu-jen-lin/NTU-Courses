# 0. Install BioConductor and DESeq2 package

## Get the latest version of Bioconductor by starting R and entering the commands
source("http://bioconductor.org/biocLite.R")
biocLite()  # better than "library" in thiis case
biocLite('DESeq2')
library(DESeq2)


## After installation of Bioconductor, use similar command to install DESeq2, a Bioconductor package for DE analysis of RNA-seq data

# 1. Data input
dat = read.delim("https://ceiba.ntu.edu.tw/course/9c980a/content/ctData.tab", row.names=1) # if row.names=1 -> error -> cuz two rows have the same row names
head(dat)
typeof(dat) # see the type of data -> list is the most general one

dat = as.matrix(dat) # convert 'list' to 'integer' cuz DEseq can only compute counted data
head(dat)
typeof(dat)

# 2. Prepare DESeqDataSet for DESeq2

sampleColData = DataFrame(
  trt=c("T1","T1","T2","T3","Ctrl","Ctrl"),   # different conditions: 4 treatments # alphabet order
  trt2level=c("T","T","T","T","Ctrl","Ctrl"), # different conditions: 2 
  row.names=colnames(dat)) # must have row.names -> to plot etc.
# releyevel(sampleColumnData$trt,"T1") # -> change the conditions, let fold change be the one we want -> let T1 be the control (r function)

dds = DESeqDataSetFromMatrix(
  countData = dat,
  colData = sampleColData,
  design = ~ trt2level) # 哪些組合做顯著差異分析 ~trt


# 2.1 2-level treatment comparison

dds = DESeq(dds) # in discrete -> called dispersion ~= variance

res = results(dds)
# base mean -> all mean
# p adj -> FDR ?!
res
write.csv(as.data.frame(res), file="condition_treated_results.csv")

plotMA(dds) # 三角形：fold change = 0 cuz control=0 # 可設顯著基因的閾值

# 2.2 multi-level treatment comparison

ddsLRT = DESeqDataSetFromMatrix(
  countData = dat,
  colData = sampleColData,
  design = ~ trt)

ddsLRT = DESeq(ddsLRT, test="LRT", reduced= ~ 1) # reduced= ~ 1 四個處理的表現量皆同  # reduced= ~ trt2level

resLRT = results(ddsLRT)
resLRT

mcols(ddsLRT,use.names=TRUE) # shoq more information # dispGeneEst -> dispersion #  dispFit ->








