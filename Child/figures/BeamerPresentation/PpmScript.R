
library(data.table)
library(dplyr)

###############################################################
#Global Atmospheric Concentrations of Carbon Dioxide Over Time#
###############################################################
# This Rscript bring two database. One from EPA and which show the the evolution of the global atmospheric concentration 
# of Carbon Dioxide from -800 000 to 2015. And a seond database from NOA (2008-2018)

## Download Global Atmospheric Concentrations of Carbon Dioxide Over Time from EPA's Climate Change Indicators in the United States
mydat <- fread('https://www.epa.gov/sites/production/files/2016-08/ghg-concentrations_fig-1.csv')
mydat1 <- as_data_frame(mydat[-c(1:7),])

### Set columns as.numeric
mydat1$V2 <- as.numeric(mydat1$V2)
mydat1$V3 <- as.numeric(mydat1$V3)
mydat1$V4 <- as.numeric(mydat1$V4)
mydat1$V5 <- as.numeric(mydat1$V5)
mydat1$V6 <- as.numeric(mydat1$V6)


### combine value of data
mydat1$V2[is.na(mydat1$V2)] <- mydat1$V3[is.na(mydat1$V2)]
mydat1$V2[is.na(mydat1$V2)] <- mydat1$V4[is.na(mydat1$V2)]
mydat1$V2[is.na(mydat1$V2)] <- mydat1$V5[is.na(mydat1$V2)]
mydat1$V2[is.na(mydat1$V2)] <- mydat1$V6[is.na(mydat1$V2)]

### select only column 1 and 2 and rename
mydat2 <- as_data_frame(mydat1[,c(1:2)])
colnames(mydat2) <- c("Year", "PPM")
rownames(mydat2) <- c("")
mydat2$Year <- as.integer(mydat2$Year)
arrange(mydat2, Year)


## NOA Data#
### From 2008-2018
### data coming from ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_trend_gl.txt

data <- read.table("Child/figures/BeamerPresentation/co2_trend_gl.txt")
colnames(data) <- c("Year", "Month", "Day", "PPM")

library(tidyr)
data1 <- data %>% unite("Year", c("Year", "Month", "Day"), sep = "-")
data1$Year <- as.Date(data1$Year)
str(data1)

### From 1959-2017
###a Data coming from ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_annmean_mlo.txt

dat <- read.table("Child/figures/BeamerPresentation/co2_annmean_mlo.txt")
colnames(dat) <- c("Year" $ "PPM", "unc")
dat <- dat[,-3]
str(dat)

### From 1900-1958
#### I use mydat2

DixNeuf <- mydat2 %>% filter(Year > 1899, Year < 1959)

### From 1900-2017
DixNeufFull <- rbind.data.frame(DixNeuf, dat)
View(DixNeufFull)

##creation of a ggplot2
library(ggplot2)
library(grid)
library(gridExtra)

theme_set(theme_bw())
p1 <- ggplot(mydat2, aes(Year, PPM, frame = Year)) +
  geom_point() + geom_smooth() 
p2 <- ggplot(DixNeufFull, aes(Year, PPM, frame = Year)) + geom_point() + geom_smooth() + scale_x_continuous(breaks = seq(1900, 2010, by = 20))
grid.arrange(p1, p2, ncol=2) 



```     