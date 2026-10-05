# Reported dog bites in New York City

Reported dog bite incidents in New York City between January 1st 2015
and December 31st 2017.

## Usage

``` r
nyc_bites
```

## Format

### `nyc_bites`

A tibble with 10,280 rows and 11 columns:

- unique_id:

  Incident identifier.

- date_of_bite:

  Date of bite.

- species:

  Species of animal (all "Dog").

- breed:

  Breed of dog.

- age:

  Age of dog, as reported. Character.

- gender:

  Sex of dog: "M", "F", or "U" (unknown).

- spay_neuter:

  Whether the dog was spayed or neutered.

- borough:

  Borough where bite occurred. Includes "Other".

- zip_code:

  Zip code where bite occurred. Integer.

- year:

  Year of bite.

- breed_rc:

  Recoded breed variable with aggregated breed categories.

## Source

New York City Open Data.

## Author

Kieran Healy
