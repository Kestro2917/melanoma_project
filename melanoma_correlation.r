library(ggplot2)
library(scales)
dat <- read.csv(file = 'C:\\Users\\biouser\\Desktop\\Melanoma\\SKCM_20211117\\correlation_input_3.csv')
head(dat)

round(cor(dat),digits =2 )


write.table(round(cor(dat),digits =2 ), file = "C:\\Users\\biouser\\Desktop\\Melanoma\\SKCM_20211117\\correlation_result_4.txt", sep = "\t", row.names = TRUE,col.names = TRUE)

install.packages('corrplot')
library(corrplot)

corrplot(cor(dat),
         method = "number",
         type = "upper" # show only upper side
)