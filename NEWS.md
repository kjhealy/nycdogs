# nycdogs 0.3.0

* `nyc_license` is rebuilt from the October 2026 release of the NYC Dog Licensing Dataset. It now has 819,323 rows and adds the 2026 extract year.
* `nyc_license$breed_name` has whitespace and capitalization standardized, so that e.g. `"Beagle Mix"`, `"BEAGLE MIX"`, and `"beagle mix"` are a single breed.
* `nyc_license$breed_rc` is recoded much more thoroughly. Inverted names are reordered (`"Bull Dog, French"` is `"French Bulldog"`), varieties are collapsed to their breed (`"Dachshund"`, `"Poodle"`, `"Collie"`), and long, abbreviated, and misspelled names are standardized (`"American Pit Bull Terrier/Pit Bull"` is `"Pit Bull"`). Crossbreeds are now kept distinct from their breed and are consistently labeled `"<Breed> Crossbreed"`. The former `"Pit Bull (or Mix)"` and `"Labrador (or Crossbreed)"` categories are gone.
* nycdogs now depends on nycmaps rather than nyczips for zip code tables and maps. `nyc_zips` and `nyc_zip_sf` are still attached along with nycdogs.
* Documentation for `nyc_bites` now matches its column names.
