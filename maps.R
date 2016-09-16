
## create PZ map 

#unzip("Promise_Zones.zip")

library(rgdal)

## display promise zones shape file
PZ <- readOGR(getwd() , "Promise_Zones")

plot(PZ)

text(coordinates(PZ), 
     labels = PZ[["COMMUNITY"]], cex = 0.7)

library(tmap)

## map filled with PV and labelled with COMMUNITY
qtm(PZ)

qtm(PZ, fill = "PV_RATE", 
    text = "COMMUNITY", size = 0.7)

library(leaflet)

## map with basemap

leaflet(PZ)%>%
  addPolygons(popup=PZ$COMMUNITY)%>%
  addTiles







