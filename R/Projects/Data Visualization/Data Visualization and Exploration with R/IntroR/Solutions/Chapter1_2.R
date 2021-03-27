#vector basics
layers <- c('Parcels', 'Streets', 'Railroads', 'Streams', 'Buildings')
length(layers)
layers[3]
layers[3:5]
layers
layers[-4]

#combining lists
layerIds <- c(1,2,3,4)
combinedVector = c(layers, layerIds)
combinedVector

#vector arithmetic
x <- c(10,20,30,40,50)
y <- c(100,200,300,400,500)
x + y
y - x
10 * x
20 * y

#vector functions
sum(x)
mean(y)
median(y)
max(y)
min(x)

#factors
land.type <- factor(c("Residential", "Commercial", "Agri-cultural", "Commercial", "Commercial", "Residential"), levels=c("Residential", "Commercial"))
table(land.type)
land.type
mons <- c("March", "April", "January", "November", "Janu-ary", 
         "September", "October", "September", "November", "August",
         "January", "November", "November", "February", "May", "August",
         "July", "December", "August", "August", "September", "November",
         "February", "April")

mons <- factor(mons)
table(mons)
mons
mons <- factor(mons, levels=c('January', 'February', 'March',
                             'April', 'May', 'June', 'July', 'August', 'September',
                             'October', 'November','December'), ordered=TRUE)

table(mons)

mons
