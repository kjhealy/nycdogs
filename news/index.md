# Changelog

## nycdogs 0.3.0

- `nyc_license` now uses the October 2026 release of the NYC Dog
  Licensing Dataset. The table has 819,323 rows and includes the 2026
  extract year.
- `nyc_license$breed_name` now has standard whitespace and
  capitalization. For example, `"Beagle Mix"`, `"BEAGLE MIX"`, and
  `"beagle mix"` are now one breed.
- `nyc_license$breed_rc` has a new, more complete recode:
  - Inverted names are in their usual order. For example,
    `"Bull Dog, French"` is `"French Bulldog"`.
  - Each variety has the name of its breed, such as `"Dachshund"`,
    `"Poodle"`, or `"Collie"`.
  - Long, abbreviated, and misspelled names have one standard form. For
    example, `"American Pit Bull Terrier/Pit Bull"` is `"Pit Bull"`.
  - Each crossbreed is distinct from its breed and has the label
    `"<Breed> Crossbreed"`.
  - The `"Pit Bull (or Mix)"` and `"Labrador (or Crossbreed)"`
    categories no longer exist.
- nycdogs now depends on nycmaps for zip code tables and maps. It no
  longer depends on nyczips. R still attaches `nyc_zips` and
  `nyc_zip_sf` with nycdogs.
- `nyc_bites` now uses the October 2026 release of the DOHMH Dog Bite
  Data. The table has 39,082 rows for 2015 to 2025. The previous table
  had 10,280 rows for 2015 to 2017.
- `nyc_bites$breed_rc` now uses the same codes as
  `nyc_license$breed_rc`, so you can compare breeds between the two
  tables. `nyc_bites$breed` now has standard whitespace and
  capitalization.
- `nyc_bites` has these breaking changes:
  - `zip_code` is now character, not integer.
  - `unique_id` and `year` are now integer.
  - `unique_id` is not unique in the table, because the source starts it
    again from 1 in each release. The combination of `year` and
    `unique_id` is unique.
  - The columns have a new order. `year` is after `date_of_bite`, and
    `breed_rc` is after `breed`.
- `nyc_bites` has a new `zip` column. It is identical to `zip_code` and
  agrees with the `zip` column in `nyc_license`.
