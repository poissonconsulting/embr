- add `marginalize_random_effects` argument to `data_set`
- numericize difftime values as cause problems for STAN
- `set_analysis_mode()` now ensures all options are set unless `mode = "reset"`
and `rhat` has been decreased from `1.1` to `1.05` for report mode and from `1.05` to `1.01` for paper mode.
- `parameters()` now returns `character(0)` as opposed to `NULL` if no parameters.
- Rename `derive()` and `derive_data()` to `mcmc_derive()` and `mcmc_derive_data()`.
- Moved `pow()` to `mcmcderive` package.

# mbr 0.0.1

- Added a `NEWS.md` file to track changes to the package.
