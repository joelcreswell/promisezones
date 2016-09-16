# Reading shapefiles into R

library(rgdal)

counties_md <- readOGR("data/cb_500k_maryland", "cb_500k_maryland")
## path to folder, layer name

summary(counties_md)

# Basic spatial plots

plot(counties_md)

howard <- counties_md[counties_md[["NAME"]] == "Howard", ]
## creates a dataframe with one row, a spatial polygon
plot(howard, add = TRUE, col="red")

text(coordinates(counties_md), 
     labels = counties_md[["NAME"]], cex = 0.7)
## cex argument is 70% of size

# Exercise

# Starting from a fresh map, print numbers on each county in order of
#  the smallest (1) to largest (24) in land area ("ALAND" attribute). 
# Hint: Use `rank(x)` to get ranks from a numeric vector x.

counties$md
## unnecessary step
plot(counties_md)
text(coordinates(counties_md),
      labels = rank(counties_md[["ALAND"]]), cex = 0.7)

# Reading rasters into R

library(raster)

nlcd <- raster("data/nlcd_agg.grd")

nlcd
## shows metadata

attr_table <- nlcd@data@attributes[[1]]

plot(nlcd)
plot(counties_md, add = TRUE)
## won't work becuase not in same projection


# Change projections

proj4string(counties_md)
proj4string(nlcd)

counties_proj <- spTransform(counties_md, proj4string(nlcd))

plot(nlcd)
plot(counties_proj, add=TRUE)


# Masking a raster

pasture <- mask(nlcd, nlcd == 81, 
                maskvalue = FALSE)
## deletes whatever does not equal 81

plot(pasture) 
## shows only pasture

# Exercise

# Create a mask for a different land cover class. 
#  Look up the numeric ID for a specific class in attr_table.

high_intensity <- mask(nlcd, nlcd == 24, 
                maskvalue = FALSE)
plot(high_intensity)


# Adding data to maps with tmap

library(tmap)

qtm(counties_proj)
##similar to plot

qtm(counties_proj, fill = "AWATER", 
    text = "NAME")

map1 <- tm_shape(counties_proj) +
            tm_borders() +
            tm_fill("AWATER", title = "Water Area (sq. m)") +
            tm_text("NAME", size = 0.7)
## adds layers to new map
## adds title to legend
map1


map1 +
    tm_style_classic(legend.frame = TRUE) +
    tm_scale_bar(position = c("left", "top"))


# Exercise

# The color scales in tmap are divided into bins by default. 
# Look at the help file for tm_fill: help("tm_fill") to find which argument
#  controls the binning scale. How can you change it to a continuous gradient?

map1 <- tm_shape(counties_proj) +
  tm_borders() +
  tm_fill("AWATER", title = "Water Area (sq. m)", style = "cont", palette = "PuBu") +
  tm_text("NAME", size = 0.7)
map1


# Interactive maps with leaflet

library(leaflet)

imap <- leaflet() %>%
            addTiles() %>%
            setView(lng = -76.505206, lat = 38.9767231, zoom = 7)
##creates leaflet object - html
imap


imap %>%
    addWMSTiles(
        "http://mesonet.agron.iastate.edu/cgi-bin/wms/nexrad/n0r.cgi",
        layers = "nexrad-n0r-900913", group = "base_reflect",
        options = WMSTileOptions(format = "image/png", transparent = TRUE),
        attribution = "Weather data © 2012 IEM Nexrad"
    )
