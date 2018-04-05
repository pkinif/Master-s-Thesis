
library(plm)
library(utils)
library(dplyr)



Balanced_Roa <- as.data.frame(make.pbalanced(DB_Roa, balance.type = "shared.individuals",index=c("Companies","YearFinancialIndicator")))
pdim(Balanced_Roa)

install.packages("xlsx")
library(xlsx)
write.xlsx(Balanced_Roa, "DataBase/Balanced_Roa.xlsx") 

write.csv2(Balanced_Roa, file = "DataBase/Balanced_Roa.csv")

ticker<- Balanced_Roa$ticker

unique(ticker)
