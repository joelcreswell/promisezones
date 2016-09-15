##Subset variables from ejscreen for sharing as ejair

ejair <- data.frame(ejscreen$ID, ejscreen$ST_ABBREV,
                    ejscreen$PM25, ejscreen$D_PM25_2)

names(ejair) <- c("FIPS", "State", "PM2.5", "EJPM2.5")

##Save ejair as CSV file

write.csv(ejair, file = "ejair.csv")

##Read in ejair

ejair <- read.csv("ejair.csv")

##Quick plot
library(dplyr)
library(ggplot2)
qplot(x = PM2.5, y = EJPM2.5, data = ejair)
