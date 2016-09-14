# Reading shapefiles into R

library(rgdal)

counties_md <- readOGR(..., ...)


# Basic spatial plots

plot(...)

howard <- counties_md[..., ]
plot(howard, ..., ...)
text(..., ... = counties_md[["NAME"]], cex = ...)

# Exercise

# Starting from a fresh map, print numbers on each county in order of
#  the smallest (1) to largest (24) in land area ("ALAND" attribute). 
# Hint: Use `rank(x)` to get ranks from a numeric vector x.

...


# Reading rasters into R

library(raster)

nlcd <- raster(...)

plot(...)

... <- nlcd@data@attributes[[1]]


# Change projections

proj4string(...)

counties_proj <- spTransform(..., proj4string(...))

plot(nlcd)
plot(..., ...)


# Masking a raster

pasture <- mask(nlcd, ..., maskvalue = ...)
plot(...)

# Exercise

# Create a mask for a different land cover class. 
#  Look up the numeric ID for a specific class in attr_table.

...


# Adding data to maps with tmap

library(tmap)

qtm(...)

qtm(counties_proj, fill = ..., ... = "NAME")

map1 <- tm_shape(...) +
            ...() +
            ...("AWATER", title = "Water Area (sq. m)") +
            tm_text(..., size = 0.7)

map1 +
    tm_style_classic(legend.frame = TRUE) +
    tm_scale_bar(position = ...)


# Exercise

# The color scales in tmap are divided into bins by default. 
# Look at the help file for tm_fill: help("tm_fill") to find which argument
#  controls the binning scale. How can you change it to a continuous gradient?

...


# Interactive maps with leaflet

library(leaflet)

imap <- leaflet() %>%
            ...() %>%
            ...(lng = -76.505206, lat = 38.9767231, zoom = ...)

imap %>%
    ...(
        "http://mesonet.agron.iastate.edu/cgi-bin/wms/nexrad/n0r.cgi",
        layers = "nexrad-n0r-900913", group = "base_reflect",
        options = WMSTileOptions(format = "image/png", transparent = TRUE),
        attribution = "Weather data © 2012 IEM Nexrad"
    )
