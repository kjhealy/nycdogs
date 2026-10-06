# Reported dog bites in New York City

Dog bite incidents reported to the Department of Health and Mental
Hygiene (DOHMH) between January 1st 2015 and December 31st 2025.

## Usage

``` r
nyc_bites
```

## Format

### `nyc_bites`

A tibble with 39,082 rows and 12 columns:

- unique_id:

  Dog bite case identifier. Unique within `year`, but not across the
  whole table. See Details.

- date_of_bite:

  Date of bite.

- year:

  Year of bite.

- species:

  Species of animal (all "Dog").

- breed:

  Breed of dog, as reported. Whitespace and capitalization are
  standardized. `NA` where no breed was recorded.

- breed_rc:

  Recoded breed, coded in the same way as `breed_rc` in
  [nyc_license](https://kjhealy.github.io/nycdogs/reference/nyc_license.md).
  See Details.

- age:

  Age of dog at time of bite, as reported. Character. Mostly years.
  Numbers with "M" indicate months, but many other formats appear.

- gender:

  Sex of dog: "M" (male), "F" (female), or "U" (unknown).

- spay_neuter:

  `TRUE` if the dog was reported to DOHMH as spayed or neutered. `FALSE`
  if it was not, or if this is unknown.

- borough:

  Borough where the bite occurred. "Other" indicates that the bite took
  place outside New York City.

- zip_code:

  Zip code where the bite occurred. Character. `NA` where not available.
  Same as `zip`.

- zip:

  Zip code where the bite occurred.

## Source

NYC Open Data
<https://data.cityofnewyork.us/Health/DOHMH-Dog-Bite-Data/rsgh-akpg>,
retrieved October 6th 2026.

## Details

Section 11.03 of the NYC Health Code requires all animal bites to be
reported within 24 hours of the event. Data is collected from reports
received online, by mail, by fax, or by phone to 311 or the DOHMH Animal
Bite Unit. Each record represents a single dog bite incident.
Information on breed, age, gender, and spayed or neutered status has not
been verified by DOHMH and is listed only as reported.

`unique_id` is not unique across the table. The source data combines
several releases, and the identifier starts again from 1 in each of
them: once for 2015–2017, once for 2018–2021, and once for each year
from 2022. The combination of `year` and `unique_id` is unique.

`breed_rc` is made with the same lookup table and rules as `breed_rc` in
[nyc_license](https://kjhealy.github.io/nycdogs/reference/nyc_license.md),
so that breeds can be compared across the two tables. Reports that only
describe a mixed-breed dog (e.g. "Mixed/Other", "Large Mixed Breed") are
coded "Mixed Breed", and reports with no usable breed (e.g. "Uncertain",
"Small Dog") are coded "Unknown". Free-text descriptions of two or more
breeds are left as they are, so `breed_rc` has a long tail of rare
values that do not appear in
[nyc_license](https://kjhealy.github.io/nycdogs/reference/nyc_license.md).

Other than this the data is deliberately lightly cleaned. Values of
`age` and `zip_code` are kept as reported, including malformed ones.

## Author

Kieran Healy
