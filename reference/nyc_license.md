# Dogs of New York

Active Dog Licenses in New York City as of February 2025.

## Usage

``` r
nyc_license
```

## Format

\## \`nyc_license\` A data frame with 722,864 rows and 12 columns:

- animal_name:

  Name of dog

- animal_gender:

  Sex of dog

- animal_birth_year:

  Year dog was born

- breed_name:

  Dog breed

- breed_rc:

  Lightly recoded breed

- zip_code:

  Owner zip code. Same as zip, retained for compatibility with
  nyc_bites.

- zip:

  Owner zip code

- license_issued_date:

  Date license issued.

- license_expired_date:

  Date license expires.

- extract_year:

  Year this record was queried.

- borough:

  Borough of Owner. (Some zip codes are in more than one borough but
  here are counted only once.)

- city:

  Nominal city, based on zip code.

## Source

Sourced from NYC Open Data
\<https://data.cityofnewyork.us/Health/NYC-Dog-Licensing-Dataset/nu7n-tubp\>

## Details

he data is sourced from the DOHMH Dog Licensing System
(https://a816-healthpsi.nyc.gov/DogLicense), where owners can apply for
and renew dog licenses. Each record represents a unique dog license that
was active during the year, but not necessarily a unique record per dog,
since a license that is renewed during the year results in a separate
record of an active license period. Each record stands as a unique
license period for the dog over the course of the yearlong time frame.

## Author

Kieran Healy
