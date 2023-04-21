#### Preamble ####
# Purpose: Simulates data about homelessness in Toronto
# Author: Sagith Kalaichelvam
# Date: 1 April 2023
# Contact: sagith.kalaichelvam@mail.utoronto.ca
# License: MIT
# Pre-requisites: -
# Any other information needed? -

#### Simulate data ####
set.seed(853)

simulated_shelter_data <-
  tibble(
    "Year" = c(2018:2022),
    "population_group" = sample(
      x = c(
        "Youth",
        "Single Adult", 
        "Families", 
        "Indigenous",
        "Refugees",
        "Non-Refugees",
        "Chronic"),
      size = 5, 
      replace = TRUE),
    
    "newly_identified" = sample(
      x = c(1:700),
      size = 5, 
      replace = TRUE
    )
    
  )
simulated_shelter_data 