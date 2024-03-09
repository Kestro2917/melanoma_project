install.packages("survival")
install.packages("survminer")
install.packages("dpylr")


library(survival)
library(survminer)
library(dpylr)

DRG7_survival <- read_excel("C:/Users/biouser/Desktop/Melanoma/SKCM_20211211/DRG7_survival.xlsx")
attach(DRG7_survival)

kmcurve<- survfit(Surv(time, event)~compare, data=DRG7_survival)

ggsurvplot(kmcurve)

ggsurvplot(kmcurve, xlim=c(0, 1500), break.x.by = 250, ylab="", xlab="",
           pval= TRUE, risk.table=TRUE, risk.table.title="",
           legend.labs=c("DRG7 High", "DRG7 Low"), legend.title="",  
           surv.scale = "percent", palette=c("blue", "red"),
           title="Survival Analysis",  risk.table.height=.3)

summary(kmcurve, times=seq(0, 60, 12))