#### Preamble ####
# Purpose: Testing the simulated data and cleaned files
# Author: Sagith Kalaichelvam
# Date: 1 April 2023
# Contact: sagith.kalaichelvam@mail.utoronto.ca
# License: MIT
# Pre-requisites: -
# Any other information needed? -

#### Testing data ####
# If all test passes then it is valid. Some tests may include false, but if the first value is true, then it pass the test.
simulated_shelter_data$Year|>
  min() == "2018"

simulated_shelter_data$Year|>
  max() == "2022"

simulated_shelter_data$population_group |>
  class() == "character"

simulated_shelter_data$newly_identified |>
  min() == 84

cleaned_shelter_system_data$year |> 
  unique() == c(18)

cleaned_shelter_system_data$year |>
  unique() == c(18, 19, 20, 21, 22)

cleaned_shelter_system_data$group |> 
  unique() == c("All Population")

cleaned_shelter_system_data$group |>
  class() == "character"