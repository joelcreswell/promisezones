# Data
species <- ...("data/species.csv", stringsAsFactors = FALSE)
... <- read.csv(..., na.strings = "", stringsAsFactors = FALSE)

# User Interface
in1 <- selectInput(...,
                   label = "Pick a species",
                   choices = ...)
out1 <- textOutput(...)
...
ui <- navbarPage(title = "Portal Project", ...)

# Server
server <- function(input, output) {
  ... <- ...(input[["pick_species"]])
}

# Create the Shiny App
shinyApp(ui = ui, server = server)