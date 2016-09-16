##Read in ejair

ejair <- read.csv("ejair.csv")

## start map

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

library(leaflet)


leaflet(PZ)%>%
  addPolygons(popup=PZ$COMMUNITY)%>%
  addTiles







