# Shared code and objects
library(devtools)
library(tidyverse)
library(here)
library(janitor)
library(nycmaps)

# Recode breed names.
#
# `lookup` has columns `breed_name` and `breed_rc`. A breed name is recoded
# if it is in the lookup. Otherwise any crossbreed suffix ("Crossbreed", "Mix",
# "Mixed", "X", etc) is split off, the remaining stem is recoded if it is in
# the lookup, and the suffix is put back as "Crossbreed". In this way pure
# breeds and their crossbreeds are standardized together but kept distinct.
recode_breed <- function(breed, lookup) {
  cross_suffix <- "(\\s*[/-]\\s*|\\s+)(Crossbreed|Cross|Mixed|Mix|Mx|X)\\??$"

  is_cross <- str_detect(breed, cross_suffix)
  stem <- breed |>
    str_remove(cross_suffix) |>
    replace_values(from = lookup$breed_name, to = lookup$breed_rc)

  coalesce(
    lookup$breed_rc[match(breed, lookup$breed_name)],
    if_else(is_cross, paste(stem, "Crossbreed"), stem)
  )
}
