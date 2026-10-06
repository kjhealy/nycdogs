# nycdogs 0.3.0

* `nyc_license` is rebuilt from the October 2026 release of the NYC Dog Licensing Dataset. It now has 819,323 rows and adds the 2026 extract year.
* `nyc_license$breed_name` has whitespace and capitalization standardized, so that e.g. `"Beagle Mix"`, `"BEAGLE MIX"`, and `"beagle mix"` are a single breed.
* `nyc_license$breed_rc` is recoded much more thoroughly. Inverted names are reordered (`"Bull Dog, French"` is `"French Bulldog"`), varieties are collapsed to their breed (`"Dachshund"`, `"Poodle"`, `"Collie"`), and long, abbreviated, and misspelled names are standardized (`"American Pit Bull Terrier/Pit Bull"` is `"Pit Bull"`). Crossbreeds are now kept distinct from their breed and are consistently labeled `"<Breed> Crossbreed"`. The former `"Pit Bull (or Mix)"` and `"Labrador (or Crossbreed)"` categories are gone.
* nycdogs now depends on nycmaps rather than nyczips for zip code tables and maps. `nyc_zips` and `nyc_zip_sf` are still attached along with nycdogs.
* `nyc_bites` is rebuilt from the October 2026 release of the DOHMH Dog Bite Data. It now has 39,082 rows and covers 2015 to 2025, up from 10,280 rows covering 2015 to 2017.
* `nyc_bites$breed_rc` is now coded in the same way as `nyc_license$breed_rc`, so that breeds can be compared across the two tables. `breed` has whitespace and capitalization standardized.
* `nyc_bites` has several breaking changes. `zip_code` is now character, not integer. `unique_id` and `year` are now integer. `unique_id` is no longer unique across the table, as the source restarts it in each release; it is unique within `year`. Columns are reordered, with `year` after `date_of_bite` and `breed_rc` after `breed`.
* `nyc_bites` gains a `zip` column, identical to `zip_code`, to match `nyc_license`.
