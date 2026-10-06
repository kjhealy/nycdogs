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
  expect_equal(nrow(nyc_bites), 39082L)
  expect_named(
    nyc_bites,
    c(
      "unique_id",
      "date_of_bite",
      "year",
      "species",
      "breed",
      "breed_rc",
      "age",
      "gender",
      "spay_neuter",
      "borough",
      "zip_code",
      "zip"
    )
  )
  expect_type(nyc_bites$unique_id, "integer")
  expect_type(nyc_bites$year, "integer")
  expect_type(nyc_bites$spay_neuter, "logical")
  expect_type(nyc_bites$zip, "character")
  expect_s3_class(nyc_bites$date_of_bite, "Date")
})

test_that("nyc_bites values are as expected", {
  expect_setequal(unique(nyc_bites$year), 2015:2025)
  expect_identical(
    nyc_bites$year,
    as.integer(format(nyc_bites$date_of_bite, "%Y"))
  )
  expect_identical(unique(nyc_bites$species), "Dog")
  expect_setequal(unique(nyc_bites$gender), c("F", "M", "U"))
  expect_setequal(unique(nyc_bites$borough), c(nyc_boro_names, "Other"))
  expect_identical(nyc_bites$zip, nyc_bites$zip_code)
  expect_false(anyNA(nyc_bites$date_of_bite))
  expect_false(is.unsorted(nyc_bites$date_of_bite))
})

test_that("nyc_bites unique_id is unique within year", {
  expect_gt(anyDuplicated(nyc_bites$unique_id), 0L)
  expect_equal(anyDuplicated(nyc_bites[c("year", "unique_id")]), 0L)
})

test_that("nyc_bites breeds are recoded like nyc_license breeds", {
  breed_rc <- unique(nyc_bites$breed_rc)

  expect_identical(is.na(nyc_bites$breed_rc), is.na(nyc_bites$breed))
  expect_true(
    all(
      c("Unknown", "Mixed Breed", "Pit Bull", "French Bulldog", "Poodle") %in%
        breed_rc
    )
  )
  expect_false(
    any(
      c("Bull Dog, French", "Bull Dog, English", "Poodle, Standard") %in%
        breed_rc
    )
  )
  expect_false(any(grepl("\\s(Mix|Mixed|X)$", breed_rc)))

  recorded <- nyc_bites$breed_rc[!is.na(nyc_bites$breed_rc)]
  expect_gt(mean(recorded %in% nyc_license$breed_rc), 0.9)
})
