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
#' Reported dog bite incidents in New York city between April 10th
#' 2014 and January 25th 2018.
#' 
#' @format A tibble containing 8,707 rows and 11 columns
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
#' \item{\code{breed_rc}}{Recoded breed (simplier caegories)}
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
#' September 12th 2014 and December 31st 2016.
#' 
#' @format A tibble containing 122,203 rows and 14 columns
#' \describe{
#' \item{\code{animal_name}}{Name of dog.}
#' \item{\code{animal_gender}}{Sex of dog.}
#' \item{\code{animal_birth_month}}{Birth month.}
#' \item{\code{breed_rc}}{Breed of dog (simplier categories).}
#' \item{\code{borough}}{Borough of owner.}
#' \item{\code{zip_code}}{Zip code of owner.}
#' \item{\code{community_district}}{Community district of owner}
#' \item{\code{nta}}{Neighborhood Tabulation Area.}
#' \item{\code{city_council_district}}{City council district.}
#' \item{\code{congressional_district}}{Congressional district}
#' \item{\code{state_senatorial_district}}{State Senatorial district}
#' \item{\code{license_issued_date}}{Date license issued}
#' \item{\code{license_expired_date}}{Date license expired}
#' }
#'
#' @docType data
#' @keywords datasets
#' @name nyc_license
#' @source New York City Public Data
'nyc_license'
