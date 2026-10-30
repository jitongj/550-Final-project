library(dplyr)
library(ggplot2)

national_overall <- readRDS("output/national_overall.rds")

plot_data <- national_overall %>%
  mutate(
    Month = factor(
      Month,
      levels = c(7, 8, 9, 10, 11, 12, 1, 2, 3, 4, 5),
      labels = c(
        "Jul", "Aug", "Sep", "Oct", "Nov", "Dec",
        "Jan", "Feb", "Mar", "Apr", "May"
      )
    )
  )

coverage_plot <- ggplot(
  plot_data,
  aes(
    x = Month,
    y = estimate_numeric,
    group = `Season/Survey Year`,
    color = `Season/Survey Year`
  )
) +
  geom_line(linewidth = 0.8) +
  geom_point(size = 1.5) +
  labs(
    title = "Figure 1. National Influenza Vaccination Coverage Across Flu Seasons",
    x = "Month",
    y = "Vaccination Coverage (%)",
    color = "Flu Season"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold"),
    legend.position = "right"
  )

ggsave(
  filename = "output/coverage_over_time.png",
  plot = coverage_plot,
  width = 9,
  height = 6,
  units = "in",
  dpi = 96
)
