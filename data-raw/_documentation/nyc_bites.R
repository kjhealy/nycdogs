#' Reported dog bites in New York City
#'
#' Reported dog bite incidents in New York City between January 1st 2015
#' and December 31st 2017.
#'
#' @format ## `nyc_bites`
#' A tibble with 10,280 rows and 11 columns:
#' \describe{
#'   \item{unique_id}{Incident identifier.}
#'   \item{date_of_bite}{Date of bite.}
#'   \item{species}{Species of animal (all "Dog").}
#'   \item{breed}{Breed of dog.}
#'   \item{age}{Age of dog, as reported. Character.}
#'   \item{gender}{Sex of dog: "M", "F", or "U" (unknown).}
#'   \item{spay_neuter}{Whether the dog was spayed or neutered.}
#'   \item{borough}{Borough where bite occurred. Includes "Other".}
#'   \item{zip_code}{Zip code where bite occurred. Integer.}
#'   \item{year}{Year of bite.}
#'   \item{breed_rc}{Recoded breed variable with aggregated breed categories.}
#' }
#'
#' @author Kieran Healy
#' @source New York City Open Data.
"nyc_bites"
