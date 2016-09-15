##Subset variables from ejscreen for sharing as ejair

ejair <- data.frame(ejscreen$DSLPM, ejscreen$PM25,
                    ejscreen$D_DSLPM_2, ejscreen$D_PM25_2)

names(ejair) <- c("Diesel PM", "PM2.5", "EJDiesel", "EJPM2.5")

##Save ejair as CSV file

write.csv(ejair, file = "ejair.csv")

##Read in ejair

ejair <- read.csv("ejair.csv")
