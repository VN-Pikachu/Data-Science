df <- read_csv("StudyArea.csv", col_types = list(UNIT = col_character()), col_names = TRUE)
df %>%
  filter(CAUSE == 'Natural' | CAUSE == 'Human') %>%
  group_by(ORGANIZATI) %>%
  ggplot() + geom_count(mapping = aes(x = ORGANIZATI, y = CAUSE))

#step 3
df %>%
  count(ORGANIZATI, CAUSE)