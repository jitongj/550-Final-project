library(dplyr)

flu_data <- read.csv(
  "data/Influenza_Vaccination_Coverage_for_All_Ages_(6+_Months).csv",
  check.names = FALSE
)

flu_data <- flu_data %>%
  mutate(
    estimate_numeric = suppressWarnings(as.numeric(`Estimate (%)`))
  )

national_overall <- flu_data %>%
  filter(
    Vaccine == "Seasonal Influenza",
    `Geography Type` == "HHS Regions/National",
    Geography == "United States",
    `Dimension Type` == "Age",
    Dimension %in% c(">=6 Months", "Greater than 6 Months flu"),
    grepl("-", `Season/Survey Year`),
    !is.na(estimate_numeric)
  )

saveRDS(flu_data, "output/flu_data.rds")
saveRDS(national_overall, "output/national_overall.rds")
