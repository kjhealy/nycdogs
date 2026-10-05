nyc_boro_names <- c(
  "Manhattan",
  "Bronx",
  "Brooklyn",
  "Queens",
  "Staten Island"
)

test_that("nyc_license has expected structure", {
  expect_s3_class(nyc_license, "tbl_df")
  expect_equal(nrow(nyc_license), 819323L)
  expect_named(
    nyc_license,
    c(
      "animal_name",
      "animal_gender",
      "animal_birth_year",
      "breed_name",
      "breed_rc",
      "zip_code",
      "zip",
      "license_issued_date",
      "license_expired_date",
      "extract_year",
      "borough",
      "city"
    )
  )
  expect_type(nyc_license$animal_birth_year, "integer")
  expect_type(nyc_license$extract_year, "integer")
  expect_type(nyc_license$zip, "character")
  expect_s3_class(nyc_license$license_issued_date, "Date")
  expect_s3_class(nyc_license$license_expired_date, "Date")
})

test_that("nyc_license values are as expected", {
  expect_setequal(
    unique(nyc_license$extract_year),
    c(2016L, 2017L, 2018L, 2022L, 2023L, 2024L, 2026L)
  )
  expect_setequal(unique(nyc_license$animal_gender), c("F", "M", NA))
  expect_setequal(unique(nyc_license$borough), c(nyc_boro_names, NA))
  expect_identical(nyc_license$zip, nyc_license$zip_code)
  expect_false(anyNA(nyc_license$license_issued_date))
})

test_that("nyc_license breed names are normalized", {
  expect_false(anyNA(nyc_license$breed_name))
  expect_false(any(grepl("^\\s|\\s$|\\s{2,}", nyc_license$breed_name)))
  expect_equal(
    length(unique(nyc_license$breed_name)),
    length(unique(tolower(nyc_license$breed_name)))
  )
  expect_true("Unknown" %in% nyc_license$breed_name)
})

test_that("nyc_license breeds are recoded", {
  breed_rc <- unique(nyc_license$breed_rc)

  expect_false(anyNA(nyc_license$breed_rc))
  expect_true(
    all(
      c("Unknown", "Pit Bull", "French Bulldog", "Dachshund", "Poodle") %in%
        breed_rc
    )
  )
  expect_false(any(grepl("^(Bull Dog|Dachshund|Poodle),", breed_rc)))
  expect_false(any(grepl("American Pit Bull", breed_rc)))
})

test_that("nyc_license keeps breeds and crossbreeds distinct", {
  breed_rc <- unique(nyc_license$breed_rc)

  expect_true(
    all(
      c(
        "Labrador Retriever",
        "Labrador Retriever Crossbreed",
        "Pit Bull Crossbreed"
      ) %in%
        breed_rc
    )
  )
  expect_false(any(grepl("\\(or (Mix|Crossbreed)\\)", breed_rc)))
  expect_false(any(grepl("\\s(Mix|Mixed|X)$", breed_rc)))

  labs <- nyc_license$breed_name == "Labrador Retriever Crossbreed"
  expect_identical(
    unique(nyc_license$breed_rc[labs]),
    "Labrador Retriever Crossbreed"
  )
})

test_that("nyc_license boroughs join to nycmaps zips", {
  with_boro <- nyc_license[!is.na(nyc_license$borough), ]
  expect_true(all(with_boro$zip %in% nycmaps::nyc_zip_sf$zip))
})

test_that("nyc_bites has expected structure", {
  expect_s3_class(nyc_bites, "tbl_df")
  expect_equal(nrow(nyc_bites), 10280L)
  expect_named(
    nyc_bites,
    c(
      "unique_id",
      "date_of_bite",
      "species",
      "breed",
      "age",
      "gender",
      "spay_neuter",
      "borough",
      "zip_code",
      "year",
      "breed_rc"
    )
  )
  expect_s3_class(nyc_bites$date_of_bite, "Date")
  expect_setequal(unique(nyc_bites$gender), c("F", "M", "U"))
})
