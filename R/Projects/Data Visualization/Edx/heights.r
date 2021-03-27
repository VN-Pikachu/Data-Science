library(ggplot2)
library((dslabs)
library(dplyr)

theme_set(theme_bw())
#Task: Summarize female height
#We expect it would follow a normal distribution, just like man
View(heights)
#the height of female
female <- heights %>% filter(sex == 'Female')

#density plot female's heights
height_density <- ggplot(female, aes(height)) + geom_density(fill = 'tomato', size = 1) 

#qqplot for female's heights: can it be well-approximated by a normal distribution?
ggplot(female, aes(sample = height)) + geom_qq() + geom_qq_line()
#The qqplot shows that the hightest points tend to be taller than expected




#We see something that we did not see for males
#The density plot has a second bump around 67
height_density + 
annotate(x = 69, xend = 68, y = 0.105, yend = 0.09, geom = 'segment', color = 'red', size = 1, arrow = arrow())


' So why are our female students different? 
Is our class a requirement for the female basketball team? 
Are small proportions of females claiming to be taller than they are? 
Another, perhaps more likely, explanation is that in the form students used to enter their heights, FEMALE was the default sex and some males entered their heights, but forgot to change the sex variable. In any case, data visualization has helped discover a potential flaw in our data.'


