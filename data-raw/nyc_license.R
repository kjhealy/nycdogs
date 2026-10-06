## nyc_license — NYC dog licenses

source(here::here("data-raw", "_shared.R"))

license_file <- here("data-raw", "NYC_Dog_Licensing_Dataset_20261005.csv")

## The birth year column has some spreadsheet errors in place of a value
nyc_license_raw <- read_csv(
  license_file,
  na = c("", "NA", "ERROR: #VALUE!"),
  col_types = cols(
    AnimalName = col_character(),
    AnimalGender = col_character(),
    AnimalBirthYear = col_integer(),
    BreedName = col_character(),
    ZipCode = col_character(),
    LicenseIssuedDate = col_date(format = "%m/%d/%Y"),
    LicenseExpiredDate = col_date(format = "%m/%d/%Y"),
    `Extract Year` = col_integer()
  )
) |>
  clean_names() |>
  mutate(
    animal_name = str_to_sentence(animal_name),
    breed_name = str_to_title(str_squish(breed_name)),
    breed_rc = recode_breed(breed_name, breed_recodes),
    zip = zip_code
  ) |>
  relocate(breed_rc, .after = breed_name) |>
  relocate(zip, .after = zip_code)

## Some zips cross borough boundaries. We follow the ZCTAs in `nyc_zip_sf`
## and count each zip in one borough only.
zip_boros <- nyc_zips |>
  filter(zip %in% nyc_zip_sf$zip) |>
  distinct(zip, .keep_all = TRUE) |>
  select(zip, borough = boro_name, city = city_name)

nyc_license <- nyc_license_raw |>
  left_join(zip_boros, by = join_by(zip))

usethis::use_data(nyc_license, overwrite = TRUE, compress = "xz")
