library(leaflet)
library(shiny)
library(LAB5C)

shinyUI(bootstrapPage(
  titlePanel("World Maps"),
  sidebarPanel(
    textInput(inputId = "addr",
              label = "Enter the address",
              value = "Stockholm"
    )
  ),
  mainPanel(
    leafletOutput("map")
  )
))