library(dplyr)
library(gt)

national_overall <- readRDS("output/national_overall.rds")

season_summary <- national_overall %>%
  filter(Month == 5) %>%
  select(
    `Flu Season` = `Season/Survey Year`,
    `Vaccination Coverage (%)` = estimate_numeric
  ) %>%
  arrange(`Flu Season`)

season_table <- season_summary %>%
  gt() %>%
  fmt_number(
    columns = `Vaccination Coverage (%)`,
    decimals = 1
  ) %>%
  cols_align(
    align = "center",
    columns = everything()
  ) %>%
  tab_header(
    title = "Table 1. National Influenza Vaccination Coverage in May by Flu Season",
    subtitle = "National estimates for people aged 6 months and older"
  )

saveRDS(season_table, "output/season_table.rds")
