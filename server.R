
shinyServer(function(input, output) {
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
})