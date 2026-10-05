#' Dogs of New York
#'
#' Dog licenses active in New York City, from annual extracts of the
#' Department of Health and Mental Hygiene (DOHMH) Dog Licensing System.
#' Covers extract years 2016--2018, 2022--2024, and 2026.
#'
#' @format ## `nyc_license`
#' A tibble with 819,323 rows and 12 columns:
#' \describe{
#'   \item{animal_name}{Name of dog, as provided by the owner. Sentence case.}
#'   \item{animal_gender}{Sex of dog, as provided by the owner: "M" or "F".}
#'   \item{animal_birth_year}{Year dog was born, as provided by the owner. `NA`
#'   where the source has a spreadsheet error in place of a value.}
#'   \item{breed_name}{Dog breed, as provided by the owner. Whitespace and
#'   capitalization are standardized. "Unknown" is a reported category.}
#'   \item{breed_rc}{Recoded breed. Variant, abbreviated, and misspelled names
#'   are standardized, and varieties are collapsed to their breed. See Details.}
#'   \item{zip_code}{Owner zip code. Same as `zip`, retained for compatibility
#'   with [nyc_bites].}
#'   \item{zip}{Owner zip code.}
#'   \item{license_issued_date}{Date license issued.}
#'   \item{license_expired_date}{Date license expires.}
#'   \item{extract_year}{Year the record was extracted.}
#'   \item{borough}{Borough of owner, based on zip code. Some zip codes are in
#'   more than one borough but here are counted only once. `NA` for zip codes
#'   not in [nycmaps::nyc_zip_sf].}
#'   \item{city}{Nominal city (USPS designation), based on zip code.}
#' }
#' @details
#' The data is sourced from the DOHMH Dog Licensing System
#' (<https://a816-healthpsi.nyc.gov/DogLicense>), where owners can apply for
#' and renew dog licenses. Each record represents a unique dog license that was
#' active during the year, but not necessarily a unique record per dog, since a
#' license that is renewed during the year results in a separate record of an
#' active license period. Licenses are valid for one to five years.
#'
#' `breed_rc` is a recoded version of `breed_name`:
#'
#' * Inverted names are put in their usual order, e.g. "Bull Dog, French"
#'   becomes "French Bulldog".
#' * Varieties are collapsed to their breed, e.g. "Dachshund Smooth Coat" and
#'   "Dachshund, Long Haired Miniature" become "Dachshund"; "Poodle, Toy" and
#'   "Poodle, Standard" become "Poodle"; and "Collie, Rough Coat" becomes
#'   "Collie". Breeds that are distinct, such as Miniature, Standard, and Giant
#'   Schnauzers or Pembroke and Cardigan Welsh Corgis, are kept apart.
#' * Long, abbreviated, and misspelled names are standardized, e.g. "American
#'   Pit Bull Terrier/Pit Bull" becomes "Pit Bull" and "Cav Kc" becomes
#'   "Cavalier King Charles Spaniel".
#' * Crossbreeds are kept distinct from their breed and are labeled
#'   consistently, so that e.g. "Terrier Mix", "Terrier X", and "Terrier
#'   Crossbreed" are all "Terrier Crossbreed".
#' * Free-text descriptions of two or more breeds, e.g. "Beagle/Boxer", are
#'   left as they are.
#'
#' The lookup table used is in `data-raw/breed_recodes.csv` in the package
#' source.
#'
#' Other than this the data is deliberately lightly cleaned. Owner-provided values are kept
#' as reported, including placeholder names (e.g. "Unknown", "Name not
#' provided"), implausible birth years, malformed zip codes, and exact
#' duplicate rows.
#'
#' @author Kieran Healy
#' @source NYC Open Data <https://data.cityofnewyork.us/Health/NYC-Dog-Licensing-Dataset/nu7n-tubp>,
#' retrieved October 5th 2026.
"nyc_license"
