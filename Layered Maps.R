##Read in ejair

ejair <- read.csv("ejair.csv")

## start map

#unzip("Promise_Zones.zip")


#unzip("Promise_Zones.zip")


library(rgdal)


PZ <- readOGR(getwd() , "Promise_Zones")

plot(PZ)

text(coordinates(PZ), 
     labels = PZ[["COMMUNITY"]], cex = 0.7)

library(tmap)

qtm(PZ)

qtm(PZ, fill = "PV_RATE", 
    text = "COMMUNITY", size = 0.7)


library(rgdal)
library(leaflet)


#Pull in data
PZ <- readOGR(getwd() , "Promise_Zones")
plot(PZ)
text(coordinates(PZ), 
     labels = PZ[["COMMUNITY"]], cex = 0.7)


#Command to overlay two maps
#Labeled each Community(click on site for name)
leaflet(PZ)%>%
  addPolygons(popup=PZ$COMMUNITY)%>%
  addTiles



#Tried to insert 'Poverty Rate' per PromiseZone by color 
#but couldn't distinguish on map
pal=color=colorNumeric(blues9, PZ$PV_RATE)


leaflet(PZ)%>%
  addPolygons(popup=PZ$COMMUNITY)%>%
  addTiles()




