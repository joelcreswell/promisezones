##Read in ejair

ejair <- read.csv("ejair.csv")

## start map

#unzip("Promise_Zones.zip")

<<<<<<< HEAD

#unzip("Promise_Zones.zip")

=======
library(rgdal)
>>>>>>> 4a4bac60a53941a5ddb044f24a2cc1dfd5da04eb

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




pal=color=colorNumeric(blues9, PZ$PV_RATE)

<<<<<<< HEAD
leaflet(PZ)%>%
  addPolygons(popup=PZ$COMMUNITY)%>%
  addTiles()
=======
>>>>>>> 4a4bac60a53941a5ddb044f24a2cc1dfd5da04eb


