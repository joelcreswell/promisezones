# Libraries
library(ggplot2)
library(dplyr)

# Data
species <- read.csv("data/species.csv", stringsAsFactors = FALSE)
surveys <- read.csv("data/surveys.csv", na.strings = "", stringsAsFactors = FALSE)

# User Interface
in1 <- selectInput("pick_species",
                   label = "Pick a Species",
                   choices = unique(species[["species_id"]]))
in2 <- ...("slider_months",
                   ...,
                   min = 1,
                   max = 12, 
                   value = ...)
side <- sidebarPanel(h3("Options", align="center"), ...)
out2 <- plotOutput("species_plot")
main <- mainPanel(out2)
tab <- tabPanel("Species",
                sidebarLayout(side, main))
ui <- navbarPage("Portal Project", tab)

# Server
server <- function(input, output) {
  ...
  
  output[["species_plot"]] <- renderPlot(
    surveys %>%
    filter(species_id == input[["pick_species"]]) %>%
    ...
    ggplot(aes(year)) +
    geom_bar()
  )
}

# Create the Shiny App
shinyApp(ui = ui, server = server)