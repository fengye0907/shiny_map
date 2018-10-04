library(leaflet)
library(shiny)
library(LAB5C)

myUi <- fluidPage(
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
)
myServer <- function(input, output){
  output$map <- renderLeaflet({
    addr <- input$addr
    a<- geocode_f$new(addr)
    result <- a$getCoordinate()
    nm <<-  as.character(result[[1]])
    lon <<- as.numeric(result[[2]])
    lat <<- as.numeric(result[[3]])
    map <- leaflet() %>%
      addTiles() %>%
      addMarkers(lng=lon, lat=lat, popup=nm)
    map
  })
}
shinyApp(ui = myUi, server = myServer)
