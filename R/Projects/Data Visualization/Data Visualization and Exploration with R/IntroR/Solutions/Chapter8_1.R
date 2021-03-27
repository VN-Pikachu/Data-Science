library(ggmap)
#steps 1-6
myLocation <- "California"
myMap <- get_map(location = myLocation, zoom = 6)
ggmap(myMap)

#step 7
#myMap = get_map(location = myLocation, zoom = 6, source="google", maptype="satellite")

#step 8
myMap <- get_map(location = "Grand Canyon, Arizona", zoom = 11)
ggmap(myMap)