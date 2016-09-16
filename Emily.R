##Read in ejair

ejair <- read.csv("ejair.csv")

## start map

library(rgdal)

unzip("Promise_Zones.zip")

PZ <- readOGR(getwd() , "Promise_Zones")

plot(PZ)

text(coordinates(PZ), 
     labels = PZ[["COMMUNITY"]], cex = 0.7)

library(tmap)

qtm(PZ)

qtm(PZ, fill = "PV_RATE", 
    text = "COMMUNITY", size = 0.7)

library(leaflet)

PZ_leaflet <- leaflet() %>%
  addTiles()%>%
  addPolygons(PZ)%>%
  setView(lng = -95.7129, lat = 37.0902, zoom = 4)

PZ_leaflet


leaflet(PZ)%>%
  addPolygons()%>%
  addTiles()


