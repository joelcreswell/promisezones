#Make nicely labeled boxplots by state category

library(dplyr)
library(ggplot2)

#read in and quick plot
ejair = read.csv(file = 'ejair.csv')
qplot(x = PM2.5, y = EJPM2.5, data = ejair)

#how many states?
testgroup <- group_by(ejair, State)
test2group <- summarize(testgroup, count = n())
# # A tibble: 14 × 2
#      State count
#     <fctr> <int>
# 1      CA   279
# 2      CT    32
# 3      GA     1
# 4      IN    48
# 5      KY   193
# 6      MN    58
# 7      MO   278
# 8      NE     4
# 9      NJ    83
# 10     OK   202
# 11     PA    46
# 12     SC   100
# 13     SD    19
# 14     TX    86

#do PM2.5 in a pretty way
ggplot(data = ejair, aes(x = State, y = PM2.5)) + geom_boxplot() +
    geom_point(stat = "summary",
               fun.y = "mean",
               color = "red") +
  labs(title = expression("PM"[2.5] ~ " concentration in EJ communities by state"),
       x = "State",
       y = expression(PM[2.5]~(mu~g/m^{3}))) +
  theme_bw() +
  theme(plot.title = element_text(face = "bold", vjust = 2),
        axis.title.y = element_text(size = 13, vjust = 1), 
        axis.title.x = element_text(size = 13, vjust = 0))

#do EJPM2.5
ggplot(data = ejair, aes(x = State, y = EJPM2.5)) + geom_boxplot() +
  geom_point(stat = "summary",
             fun.y = "mean",
             color = "red") +
  labs(title = expression("EJ rating for PM"[2.5] ~ "in communities by state"),
       x = "State",
       y = expression(EJ~PM[2.5])) + #units???
  theme_bw() +
  theme(plot.title = element_text(face = "bold", vjust = 2),
        axis.title.y = element_text(size = 13, vjust = 1), 
        axis.title.x = element_text(size = 13, vjust = 0))


# TBD: link FIPS in ejair to maps?
# unzip("Promise_Zones.zip") #but will want it in another folder maybe
library(rgdal) #open source geographical data file
PZ <- readOGR("Promise_Zones","Promise_Zones") #may need getwd()