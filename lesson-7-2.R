# Libraries
library(rgdal)
library(raster)
library(leaflet)

# Load data
counties_md <- readOGR("data/cb_500k_maryland", "cb_500k_maryland")
nlcd_proj <- raster("data/nlcd_proj.grd")


ui <- fluidPage(title = ...,
    ...("sesync_map")
)


server <- function(input, output) {
    output[["sesync_map"]] <- ...({
        leaflet() %>% 
            setView(lng = -76.505206, lat = 38.9767231, zoom = 8) %>%
            addTiles() %>%
            ...(lng = -76.505206, lat = 38.9767231, popup = ...) %>%
            addPolygons(data = ..., fill = ...)  %>%
            addRasterImage(..., opacity = ..., project = FALSE)
    })    
}

shinyApp(ui = ui, server = server)