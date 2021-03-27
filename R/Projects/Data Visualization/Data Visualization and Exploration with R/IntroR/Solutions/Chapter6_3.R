df <- read_csv("StudyArea.csv", col_types = list(UNIT = col_character()), col_names = TRUE)
df %>%
  filter(TOTALACRES >= 5000 & TOTALACRES <= 10000) %>%
  group_by(ORGANIZATI) %>%
  ggplot(mapping = aes(x = ORGANIZATI, y = TOTALACRES)) + geom_boxplot()