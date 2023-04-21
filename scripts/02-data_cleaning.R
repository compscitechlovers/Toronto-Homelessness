#### Preamble ####
# Purpose: Cleaning all data from Open Data Toronto Homelessness data
# Author: Sagith Kalaichelvam
# Date: 1 April 2023
# Contact: sagith.kalaichelvam@mail.utoronto.ca
# License: MIT
# Pre-requisites: -
# Any other information needed? -

#### Workspace setup ####
library(tidyverse)
library(opendatatoronto)
library(janitor)

#### Clean data ####
cleaned_shelter_system_data <-
  clean_names(raw_shelter_system_data)

# Renaming variables
cleaned_shelter_system_data <-
  cleaned_shelter_system_data |>
  rename(
    date = date_mmm_yy,
    group = population_group
  )

# Seperating the dates into months and years
cleaned_shelter_system_data <-
  cleaned_shelter_system_data |>
  separate(
    col = date,
    into = c("month", "year"),
    sep = "-"
  )

returned_from_housing_data <-
  cleaned_shelter_system_data |>
  filter(
    group == 'Youth'
  )

returned_from_housing_data <-
  returned_from_housing_data |>
  select(
    year,
    returned_from_housing
  )

returned_from_housing_data <-
  returned_from_housing_data %>%
  group_by(year) %>%
  summarise(returned_from_housing = sum(returned_from_housing))

all_returned_from_housing_data <-
  cleaned_shelter_system_data

all_returned_from_housing_data <-
  all_returned_from_housing_data |>
  select(
    year,
    group,
    returned_from_housing
  )

all_returned_from_housing_data <-
  all_returned_from_housing_data %>%
  group_by(year, group) %>%
  summarise(returned_from_housing = sum(returned_from_housing))

moved_to_housing_data <-
  cleaned_shelter_system_data |>
  filter(
    group == 'Youth'
  )

moved_to_housing_data <-
  moved_to_housing_data |>
  select(
    year,
    moved_to_housing
  )

moved_to_housing_data <-
  moved_to_housing_data %>%
  group_by(year) %>%
  summarise(moved_to_housing = sum(moved_to_housing))

all_moved_to_housing_data <-
  cleaned_shelter_system_data

all_moved_to_housing_data <-
  all_moved_to_housing_data |>
  select(
    year,
    group,
    moved_to_housing
  )

all_moved_to_housing_data <-
  all_moved_to_housing_data %>%
  group_by(year, group) %>%
  summarise(moved_to_housing = sum(moved_to_housing))

# This will save the cleaned data
write_csv(
  x = cleaned_shelter_system_data,
  file = "cleaned_shelter_system_data.csv"
)

write_csv(
  x = returned_from_housing_data,
  file = "returned_from_housing_data.csv"
)

write_csv(
  x = all_returned_from_housing_data,
  file = "all_returned_from_housing_data.csv"
)

write_csv(
  x = moved_to_housing_data,
  file = "moved_to_housing_data.csv"
)

write_csv(
  x = all_moved_to_housing_data,
  file = "all_moved_to_housing_data.csv"
)