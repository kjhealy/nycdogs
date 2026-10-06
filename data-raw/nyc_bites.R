## nyc_bites — Reported dog bites in NYC

source(here::here("data-raw", "_shared.R"))

bites_file <- here("data-raw", "DOHMH_Dog_Bite_Data_20261006.csv")

nyc_bites <- read_csv(
  bites_file,
  col_types = cols(
    UniqueID = col_integer(),
    DateOfBite = col_date(format = "%B %d, %Y"),
    Species = col_character(),
    Breed = col_character(),
    Age = col_character(),
    Gender = col_character(),
    SpayNeuter = col_logical(),
    Borough = col_character(),
    ZipCode = col_character()
  )
) |>
  clean_names() |>
  mutate(
    year = as.integer(year(date_of_bite)),
    species = str_to_title(species),
    breed = str_to_title(str_squish(breed)),
    breed_rc = recode_breed(breed, breed_recodes),
    zip = zip_code
  ) |>
  relocate(year, .after = date_of_bite) |>
  relocate(breed_rc, .after = breed) |>
  relocate(zip, .after = zip_code) |>
  arrange(date_of_bite, unique_id)

usethis::use_data(nyc_bites, overwrite = TRUE, compress = "xz")
