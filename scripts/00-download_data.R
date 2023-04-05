#### Preamble ####
# Purpose: Downloads and saves data from Open Data Toronto
# Author: Sagith Kalaichelvam
# Data: 1 April 2023
# Contact: sagith.kalaichelvam@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Data source: https://open.toronto.ca/dataset/toronto-shelter-system-flow/

#### Workspace setup ####

library(opendatatoronto)
library(dplyr)

#### Download data ####

# Retrieving Package
package <- show_package("ac77f532-f18b-427c-905c-4ae87ce69c93")
package

# Accesing the list
resources <- list_package_resources("ac77f532-f18b-427c-905c-4ae87ce69c93")

# Identify the format
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# Loading Data
raw_shelter_system_data <- filter(datastore_resources, row_number()==1) %>% get_resource()
raw_shelter_system_data

write_csv(
  x = raw_shelter_system_data,
  file = "raw_shelter_system_data.csv"
)