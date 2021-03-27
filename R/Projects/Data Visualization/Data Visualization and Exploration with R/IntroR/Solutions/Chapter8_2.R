library(ggmap)

#steps 1-2
#get the basemap layer
myMap <- get_map(location = myLocation, zoom = 6)

#read in the wildfire data to a data frame (tibble)
dfWildfires <- read_csv("StudyArea_SmallFile.csv", col_types = list(UNIT = col_character()), col_names = TRUE)

#select specific columns of information
df <- select(dfWildfires, STATE, YEAR_, TOTALACRES, DLATITUDE, DLONGITUDE)

#filter the data frame so that only fires greater than 1,000 acres burned in California are present
df <- filter(df, TOTALACRES >= 1000 & STATE == 'California')

#use geom_point() to display the points.  The x and y properties of the aes() function are used to define the geometry
ggmap(myMap) + geom_point(data=df, aes(x = DLONGITUDE, y = DLATITUDE))

#step 3
df <- mutate(df, DECADE = ifelse(YEAR_ %in% 1980:1989, "1980-1989", ifelse(YEAR_ %in% 1990:1999, "1990-1999", ifelse(YEAR_ %in% 2000:2009, "2000-2009", ifelse(YEAR_ %in% 2010:2016, "2010-2016", "-99")))))

#step 4
ggmap(myMap) + geom_point(data=df, aes(x = DLONGITUDE, y = DLATITUDE, colour= DECADE, size = TOTALACRES))

#step 5
myMap <- get_map(location = "Santa Clarita, California", zoom = 10)
ggmap(myMap) + geom_point(data=df, aes(x = DLONGITUDE, y = DLATITUDE, colour= DECADE, size = TOTALACRES))

#step 6
myMap <- get_map(location = "California", zoom = 6)

ggmap(myMap, extent = "device") + geom_density2d(data = df, aes(x = DLONGITUDE, y = DLATITUDE), size = 0.3) + stat_density2d(data = df, aes(x = DLONGITUDE, y = DLATITUDE, fill = ..level.., alpha = ..level..), size = 0.01, bins = 16, geom = "polygon") + scale_fill_gradient(low = "green", high = "red") + scale_alpha(range = c(0, 0.3), guide = FALSE)

#step 7
ggmap(myMap, extent = "device") + stat_density2d(data = df, aes(x = DLONGITUDE, y = DLATITUDE, fill = ..level.., alpha = ..level..), size = 0.01,bins = 16, geom = "polygon") + scale_fill_gradient(low = "green", high = "red") + scale_alpha(range = c(0, 0.3), guide = FALSE)
