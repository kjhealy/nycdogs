## code to prepare `nyc_license` dataset goes here
library(tidyverse)
library(kjhmisc)
library(usethis)
library(here)
library(nyczips)
library(sf)

recode(
  license$breed_name,
  "American Pit Bull Terrier/Pit Bull" = "Pit Bull (or Mix)",
  "American Pit Bull Mix / Pit Bull Mix" = "Pit Bull (or Mix)",
  "Labrador Retriever" = "Labrador (or Crossbreed)",
  "Labrador Retriever Crossbreed" = "Labrador (or Crossbreed)"
)

nyc_license_raw <- read_csv(
  here("data-raw", "NYC_Dog_Licensing_Dataset_20251113.csv"),
  col_names = TRUE,
  cols(
    AnimalName = col_character(),
    AnimalGender = col_character(),
    AnimalBirthYear = col_integer(),
    BreedName = col_character(),
    ZipCode = col_character(),
    LicenseIssuedDate = col_date(format = "%m/%d/%Y"),
    LicenseExpiredDate = col_date(format = "%m/%d/%Y"),
    `Extract Year` = col_integer(),
  )
) |>
  janitor::clean_names() |>
  mutate(
    breed_name = na_if(breed_name, "ERROR: #VALUE!"),
    animal_name = str_to_sentence(animal_name),
    breed_rc = case_match(
      breed_name,
      "American Pit Bull Terrier/Pit Bull" ~ "Pit Bull (or Mix)",
      "American Pit Bull Mix / Pit Bull Mix" ~ "Pit Bull (or Mix)",
      "Labrador Retriever" ~ "Labrador (or Crossbreed)",
      "Labrador Retriever Crossbreed" ~ "Labrador (or Crossbreed)",
      .default = breed_name
    ),
    zip = zip_code
  ) |>
  relocate(breed_rc, .after = breed_name) |>
  relocate(zip, .after = zip_code)

## Some zips cross borough boundaries; we follow the zctas

zip_tmp <- nyc_zips |>
  select(zip, borough, city)

dupes <- zip_tmp |>
  count(zip) |>
  filter(n > 1)

zip_sf_tmp <- tibble(zip = unique(nyc_zip_sf$zip))

zip_merge <- zip_sf_tmp |>
  left_join(zip_tmp |> distinct(zip, .keep_all = TRUE))

nyc_license <- left_join(nyc_license_raw, zip_merge)

usethis::use_data(nyc_license, overwrite = TRUE, compress = "xz")
