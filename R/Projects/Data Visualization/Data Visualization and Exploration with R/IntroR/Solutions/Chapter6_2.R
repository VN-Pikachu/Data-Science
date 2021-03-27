df <- read_csv("StudyArea.csv", col_types = list(UNIT = col_character()), col_names = TRUE)
#steps 1-3
df %>%
  select(ORGANIZATI, STATE, YEAR_, TOTALACRES, CAUSE) %>%
  filter(TOTALACRES >= 1000) %>%
  ggplot() + geom_histogram(mapping = aes(x=TOTALACRES), binwidth=500)

#step 4
df %>%
  count(cut_width(TOTALACRES, 500))