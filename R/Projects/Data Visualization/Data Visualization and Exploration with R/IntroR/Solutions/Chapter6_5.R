df <- read_csv("StudyArea.csv", col_types = list(UNIT = col_character()), col_names = TRUE)

#2D bin map
ggplot(data = df) + geom_bin2d(mapping = aes(x=YEAR_, y=TOTALACRES))

#3D hex map
ggplot(data=df) + geom_hex(mapping = aes(x=YEAR_, y=TOTALACRES))