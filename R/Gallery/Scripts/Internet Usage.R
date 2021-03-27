library(tidyverse)

internet <- tribble(
   ~Age, ~Use, ~Not,
   "18-29", 48, 2,
   "30-49", 93, 7,
   "50-64", 85, 5,
   "65+", 29, 21
)

internet$Age <- as_factor(internet$Age)

internet %>%
   pivot_longer(!Age, names_to = "Query") %>%
   ggplot(aes(Age, value, fill = Query)) +
   geom_col(position = "fill") +
   scale_fill_brewer(palette = "Set1", breaks = c("Use", "Not"), labels = c("People who use Facebook", "People who do not use Facebook")) +
   labs(title = "Internet Use versus Age", y = 'Proportion') +
   theme(
      legend.title = element_blank(),
      text = element_text(color = "white"),
      legend.position = "none",
      panel.grid.major.x = element_blank(),
      panel.background = element_rect(fill = "black"),
      plot.background = element_rect(fill = "black"),
      axis.ticks = element_blank(),
      axis.text = element_text(color = "white", size = 13),
      plot.title = element_text(face = "bold", size = 30, hjust = 0.5),
      plot.title.position = 'plot',
      axis.title = element_text(size = 20),
      plot.margin = margin(.5, 1, .5, 1, unit='cm'),
      panel.grid.minor.y = element_blank(),
      panel.grid.major.y = element_line(size = 1, color = "grey")
   )

ggsave('../Figures/Internet Usage.png')
