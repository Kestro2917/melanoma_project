countData <- as.matrix(read.table("C:\\Users\\biouser\\Desktop\\Melanoma\\SKCM_20211128\\Pathway_analysis_20_95\\count_matrix.txt", header = TRUE, row.names=1 )) 
countData = countData[rowSums(countData)>1,]
head(countData)
colData <- read.table(file.path("C:\\Users\\biouser\\Desktop\\Melanoma\\SKCM_20211128\\Pathway_analysis_20_95\\","colData.txt"), header=TRUE)
head(colData)

library(DESeq2)
dds = DESeqDataSetFromMatrix(countData=countData, colData=colData, design=~condition)
nrow(dds)

dds <- dds[rowSums(counts(dds)) > 1, ]
nrow(dds)

colData(dds)$condition<-factor(colData(dds)$condition, levels=c('High','Low'))

colData(dds)$condition

dds = DESeq(dds)

res = results(dds)
res = res[order(res$pvalue),]
summary(res)


plotMA(dds,ylim=c(-5,5),main='DESeq2')
mcols(res,use.names=TRUE)

write.csv(as.data.frame(res),file="C:\\Users\\biouser\\Desktop\\Melanoma\\SKCM_20211128\\Pathway_analysis_20_95\\differential_expression_result.csv")