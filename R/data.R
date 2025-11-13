#' New York City Dog Reported Dog bites
#'
#' Reported dog bite incidents in New York city between January 1st 2015
#' and Decenber 31st 2017,
#'
#' @format A tibble containing 10,280 rows and 11 columns
#' \describe{
#' \item{\code{uniqueid}}{Incident identified.}
#' \item{\code{date_of_bite}}{Date of bite.}
#' \item{\code{species}}{Species of animal (all "Dog").}
#' \item{\code{breed}}{Breed of dog.}
#' \item{\code{age}}{Age of dog.}
#' \item{\code{gender}}{Sex of dog.}
#' \item{\code{spay_neuter}}{Spayed or neutered (True/False)}
#' \item{\code{borough}}{Borough where bite occurred.}
#' \item{\code{zip_code}}{Zip code where bite occurred.}
#' \item{\code{year}}{Year}
#' \item{\code{breed_rc}}{Recoded breed variable with aggregated breed categories)}
#'}
#'
#' @docType data
#' @keywords datasets
#' @name nyc_bites
#' @source New York City public data
'nyc_bites'


#' Dogs of New York
#'
#' Active Dog Licenses in New York City as of February 2025.
#'
#' @format ## `nyc_license`
#' A data frame with 722,864 rows and 12 columns:
#' \describe{
#'   \item{animal_name}{Name of dog}
#'   \item{animal_gender}{Sex of dog}
#'   \item{animal_birth_year}{Year dog was born}
#'   \item{breed_name}{Dog breed}
#'   \item{breed_rc}{Lightly recoded breed}
#'   \item{zip_code}{Owner zip code. Same as zip, retained for compatibility with nyc_bites.}
#'   \item{zip}{Owner zip code}
#'   \item{license_issued_date}{Date license issued.}
#'   \item{license_expired_date}{Date license expires.}
#'   \item{extract_year}{Year this record was queried.}
#'   \item{borough}{Borough of Owner. (Some zip codes are in more than one borough but here are counted only once.)}
#'   \item{city}{Nominal city, based on zip code.}
#' }
#' @details he data is sourced from the DOHMH Dog Licensing System (https://a816-healthpsi.nyc.gov/DogLicense), where owners can apply for and renew dog licenses. Each record represents a unique dog license that was active during the year, but not necessarily a unique record per dog, since a license that is renewed during the year results in a separate record of an active license period. Each record stands as a unique license period for the dog over the course of the yearlong time frame.
#' @author Kieran Healy
#' @source Sourced from NYC Open Data <https://data.cityofnewyork.us/Health/NYC-Dog-Licensing-Dataset/nu7n-tubp>
"nyc_license"
