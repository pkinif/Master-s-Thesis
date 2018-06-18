####################################################################
#Global mean estimates - Evolution of Temperature Anomaly over time#
####################################################################
# Database coming from 
#https://data.giss.nasa.gov/tmp/gistemp/CUSTOM_GRAPHS/07e30b31-7d75-4cf1-b319-1bd5d53f6c8f/graph.txt
#

library(data.table)
library(dplyr)

mydat <- fread('https://data.giss.nasa.gov/tmp/gistemp/CUSTOM_GRAPHS/07e30b31-7d75-4cf1-b319-1bd5d53f6c8f/graph.txt')
colnames(mydat)<-c("Year", "NoSmoothing", "LowessSmoothing")

library(ggplot2)
library(grid)
library(gridExtra)
library(knitr)
theme_set(theme_bw())
p <- ggplot(mydat, aes(Year)) + 
  geom_line(aes(y = NoSmoothing, colour = "No Smoothing")) + 
  geom_line(aes(y = LowessSmoothing, colour = "Lowess Smoothing")) + 
  scale_x_continuous(breaks = seq(1880, 2020, by = 20))
p1 <- p + labs(y = "Temperature Anomaly (C)") + ggtitle("Global Mean Estimates based on Land and Ocean Data")

