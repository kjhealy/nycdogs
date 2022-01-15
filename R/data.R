#' New York City zip codes
#'
#' A simple features object containing polygons for the 262 zip code
#' areas in New York city, along with additional geographic information.
#'
#' @format A simple feature collection with 262 features (rows) and 11
#'     fields (12 columns).
#' \describe{
#' \item{\code{objectid}}{Object identifier.}
#' \item{\code{zip_code}}{Zip code.}
#' \item{\code{po_name}}{Post office region name.}
#' \item{\code{state}}{State (all NY).}
#' \item{\code{borough}}{City borough.}
#' \item{\code{st_fips}}{State FIPS code (all 36).}
#' \item{\code{cty_fips}}{County FIPS code.}
#' \item{\code{bld_gpostal_code}}{Building postal code.}
#' \item{\code{shape_leng}}{Shape length.}
#' \item{\code{shape_area}}{Shape area}
#' \item{\code{vstrat}}{Variance stratum}
#' \item{\code{x_id}}{x_id}
#' \item{\code{geometry}}{POLYGON [°] description of the shape of the
#'     zip code area.}
#'}
#'
#' @docType data
#' @keywords datasets
#' @name nyc_zips
#' @source .
'nyc_zips'


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


#' Licensed Dogs in New York City as of January 1st 2017
#'
#' Dogs in New York city with licenses issued between
#' September 12th 2014 and March 17th 2021. The data were extracted in three waves
#' and contain duplicate dogs across extraction years.
#' 
#' 
#' @format A tibble containing 493,072 rows and 9 columns
#' \describe{
#' \item{\code{animal_name}}{Name of dog.}
#' \item{\code{animal_gender}}{Sex of dog.}
#' \item{\code{animal_birth_year}}{Birth year}
#' \item{\code{breed_rc}}{Breed of dog (simplier categories).}
#' \item{\code{borough}}{Borough of owner. (Some boroughs are approximate due to zip codes.)}
#' \item{\code{zip_code}}{Zip code of owner.}
#' \item{\code{license_issued_date}}{Date license issued}
#' \item{\code{license_expired_date}}{Date license expired}
#' \item{\code{extract_year}}{Year record was extracted}
#' }
#'
#' @docType data
#' @keywords datasets
#' @name nyc_license
#' @source New York City Public Data
'nyc_license'
