# Libraries
library(rgdal)
library(raster)
library(leaflet)

# Load data
counties_md <- readOGR("data/cb_500k_maryland", "cb_500k_maryland")
nlcd_proj <- raster("data/nlcd_proj.grd")

ui <- fluidPage(title = "Interactive Map",
    leafletOutput("sesync_map")
)

server <- function(input, output) {
    output[["sesync_map"]] <- renderLeaflet({
        leaflet() %>% 
            setView(lng = -76.505206, lat = 38.9767231, zoom = 8) %>%
            addProviderTiles("Esri.WorldImagery") %>%
            addMarkers(lng = -76.505206, lat = 38.9767231, popup = "SESYNC") %>%
            addPolygons(data = counties_md, fill = FALSE, 
                        group = "MD counties") %>%
            addRasterImage(mask(nlcd_proj, nlcd_proj == 41, maskvalue = FALSE),
                           group = ..., colors = ..., 
                           project = FALSE) %>%
            addRasterImage(mask(nlcd_proj, ..., maskvalue = FALSE),
                           group = "Pasture", colors = ..., 
                           project = FALSE) %>%
            ...(baseGroups = c(..., ...),
                             overlayGroups = c(...))
    })
}

shinyApp(ui = ui, server = server)