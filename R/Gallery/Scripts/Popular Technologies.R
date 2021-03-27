library(tidyverse)

setwd('Scripts')

technologies <-
  read_csv(
    'https://raw.githubusercontent.com/CoreyMSchafer/code_snippets/master/Python/Matplotlib/02-BarCharts/data.csv'
  )

n_observers <- nrow(technologies)

programming_languages <- technologies %>%
  separate_rows(LanguagesWorkedWith, sep = ";")


popularity <- programming_languages %>%
  pull(LanguagesWorkedWith) %>%
  fct_count() %>%
  mutate(f = fct_reorder(f, n),
         p = round(n / n_observers * 100, 1))



res <- popularity %>%
  filter(str_starts(f, "Other", negate = T)) %>%
  ggplot(aes(p, f)) +
  geom_col(width = .6,
           fill = "tomato",
           color = "red") +
  geom_text(
    aes(
      label = str_c(p, "%") %>% str_replace(",", "."),
      x = -7,
      hjust = "left"
    ),
    size = 3,
    fontface = "bold"
  ) +
  scale_x_continuous(expand = expansion(add = c(3, 10))) +
  ggtitle('Most popular programming languages') +
  theme_void() +
  theme(
    axis.text.y.left = element_text(hjust = 1, size = 8),
    plot.margin = margin(1, 1, 1, 1, unit = "cm")
  )

ggsave('../Figures/ProgrammingLanguagesPopularity.png', res)
