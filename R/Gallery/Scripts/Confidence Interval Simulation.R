library(tidyverse)
library(dslabs)
library(glue)

# set random state for reproducibility
set.seed(101)

# the population mean
p <- .3
# sample size
n <- 1000
confidence_level <- .95
# number of simulations
n_simulation <- 100
confidence_interval <- replicate(n_simulation,
  {
    # draw N sample from population 
    simulation <- sample(0:1, size = n, replace = T, prob = c(1 - p, p))
    # sample mean
    x <- mean(simulation)
    # standard error of the sampling distribution of the mean
    se <- sqrt(x * (1 - x) / n)
    # margin of error
    moe <- qt(1 - (1 - confidence_level) / 2, df = n - 1) * se
    ci <- c(x - moe, x, x + moe)
    ci
  },
  simplify = "matrix"
)




# convert matrix to a tibble for plotting
rownames(confidence_interval) <- c("left", "mid", "right")
confidence_interval <- as_tibble(t(confidence_interval)) %>%
  mutate(id = row_number(), has = left <= p & p <= right)

confidence_interval %>%
  ggplot(aes(x = mid, xmin = left, xmax = right, y = id, group = id, color = has)) +
  geom_errorbarh() + 
  geom_point() +
  geom_point(aes(mid, id), size = 2) +
  scale_color_discrete(
    "contains the true mean",
    breaks = c(F, T), labels = c("No", "Yes"),
    guide = guide_legend(ncol = 2)
  ) +
  geom_vline(xintercept = p, size = 1) +
  labs(title = glue("Monte Carlo simulation of {confidence_level* 100}% confidence interval \n for proportion with parameter p = {p}"),
       y = NULL,
       x = 'Confidence Interval') +
  theme_bw() +
  theme(
    legend.position = c(1, 1),
    legend.justification = c(1, 1),
    legend.background = element_rect(fill = NA, color = 'green'),
    axis.ticks.y = element_blank(),
    axis.text.y = element_blank()
  )

ggsave('../Figures/ConfidenceIntervalSimulation.png')
