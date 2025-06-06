library(frictionless)

t <- list.files("Data/Datasets", ".csv", full.names = TRUE)

f <- data.frame()
for(i in t) f <- rbind(f, data.frame(file = basename(i), field = names(read_csv(i))))

f <- f |>
  as_tibble() |>
  mutate(
    desc = case_match(
      field,
      "model" ~ "Model definition",
      "term" ~ "Model parameter or term being definied",
      "estimate" ~ "Model parameter estimate",
      "std_error" ~ "Standard error of the model parameter estimate",
      "p_value" ~ "P-value",
      "n" ~ "Number of samples (years) in the analysis",
      "statistic" ~ "Value of the model's test statistic",
      "model_r_squared" ~ "R2 of the model",
      "model_adj_r_squared" ~ "Adjusted R2 of the model",
      "model_f" ~ "F statistic for the model as a whole",
      "model_p" ~ "P-value for the model as a whole",
      "estimate_exp" ~ "Exponentiated estimate for Poisson or Negative Binomial estimates",
      "type" ~ "Type of model being compared, 'original' is the model without any omissions, 'gaps_removed' has years with gaps in the record removed, 'end_removed' has years with a gap at the end removed, 'all_removed' has years with both gaps during and at the end removed",
      "measure" ~ "Metric compared in the post hoc",
      "df" ~ "Degrees of freedom",
      "date" ~ "Date of the count", 
      "year" ~ "Year of the count",
      "doy" ~ "Day of year", 
      "count" ~ "Daily estimates of the greatest aggregation of vultures over Rocky Point that day during the station hours",
      "count_init" ~ "Original daily estimates",
      "count_sum" ~ "Cumulative counts",
      "date_min" ~ "First date with an observation in that year",
      "date_max" ~ "Last date with an observation in that year",
      "n_dates_obs" ~ "Number of dates with a count",
      "n_dates" ~ "Number of dates in the range (min to max)",
      "n_obs" ~ "Total number of vultures seen",
      
      "mig_start_doy" ~ "Day of year of the start of migration (5%-95%)",
      "mig_end_doy" ~ "Day of year of the end of migration (5%-95%)",
      "peak_start_doy" ~ "Day of year of the start of peak migration (25%-75%)",
      "peak_end_doy" ~ "Day of year of the end of peak migration (25%-75%)",
      "p50_doy" ~ "Day of year of the 50% percentile of migration (50%)",
      "max_doy" ~ "Day of year of the max count",
      
      "mig_dur_days" ~ "Number of days of the migration period (5%-95%)",
      "peak_dur_days" ~ "Number of days of the peak migration period (25%-75%)",
      
      "peak_pop_min" ~ "Minimum number of peak migrants (25%-75%) calculated from GAM model predictions",
      "peak_pop_median" ~ "Median number of peak migrants (25%-75%) calculated from GAM model predictions",
      "peak_pop_mean" ~ "Mean number of peak migrants (25%-75%) calculated from GAM model predictions",
      "peak_pop_total" ~ "Total number of peak migrants (25%-75%) calculated from GAM model predictions",
      
      "mig_pop_min" ~ "Minimum number of migrants (5%-95%) calculated from GAM model predictions",
      "mig_pop_median" ~ "Median number of migrants (5%-95%) calculated from GAM model predictions",
      "mig_pop_mean" ~ "Mean number of migrants (5%-95%) calculated from GAM model predictions",
      "mig_pop_total" ~ "Total number of migrants (5%-95%) calculated from GAM model predictions",
      "mig_pop_max" ~ "Maximum number of migrants (5%-95%) or peak migrants (25%-75%) calculated from GAM model predictions",
      
      "res_pop_min" ~ "Min number of residences caculated from GAM model predictions",
      "res_pop_median" ~ "Median number of residences caculated from GAM model predictions",
      "res_pop_mean" ~ "Mean number of residences caculated from GAM model predictions",
      "res_pop_max" ~ "Max number of residences caculated from GAM model predictions",
      
      "ambig_pop_min" ~ "Min number of vultures in the ambiguous period that occurs after the resident period but before the start of migration and after the end of migration, caculated from GAM model predictions",
      "ambig_pop_median" ~ "Median number of vultures in the ambiguous period that occurs after the resident period but before the start of migration and after the end of migration, caculated from GAM model predictions",
      "ambig_pop_mean" ~ "Mean number of vultures in the ambiguous period that occurs after the resident period but before the start of migration and after the end of migration, caculated from GAM model predictions",
      "ambig_pop_max" ~ "Max number of vultures in the ambiguous period that occurs after the resident period but before the start of migration and after the end of migration, caculated from GAM model predictions",
      
      "mig_raw_min" ~ "Minimum number of migrants (5%-95%) from raw counts",
      "mig_raw_median" ~ "Median number of migrants (5%-95%) from raw counts",
      "mig_raw_mean" ~ "Mean number of migrants (5%-95%) from raw counts",
      "mig_raw_total" ~ "Total number of migrants (5%-95%) from raw counts",
      "mig_raw_max" ~ "Maximum number of migrants (5%-95%) or peak migrants (25%-75%) from raw counts",
      
      "res_raw_min" ~ "Min number of residences caculated from raw counts",
      "res_raw_median" ~ "Median number of residences caculated from raw counts",
      "res_raw_mean" ~ "Mean number of residences caculated from raw counts",
      "res_raw_max" ~ "Max number of residences caculated from raw counts",
      
      "ambig_raw_min" ~ "Min number of vultures in the ambiguous period that occurs after the resident period but before the start of migration and after the end of migration, from raw counts",
      "ambig_raw_median" ~ "Median number of vultures in the ambiguous period that occurs after the resident period but before the start of migration and after the end of migration, from raw counts",
      "ambig_raw_mean" ~ "Mean number of vultures in the ambiguous period that occurs after the resident period but before the start of migration and after the end of migration, from raw counts",
      "ambig_raw_max" ~ "Max number of vultures in the ambiguous period that occurs after the resident period but before the start of migration and after the end of migration, from raw counts",
      
      "peak_raw_min" ~ "Minimum number of peak migrants (25%-75%) from raw counts",
      "peak_raw_median" ~ "Median number of peak migrants (25%-75%) from raw counts",
      "peak_raw_mean" ~ "Mean number of peak migrants (25%-75%) from raw counts",
      "peak_raw_total" ~ "Total number of peak migrants (25%-75%) from raw counts",
      
      "mig_skew" ~ "Skewness of the migratory period (5%-95%)",
      "mig_kurt" ~ "Kurtosis of the migratory period (5%-95%)",
      "peak_skew" ~ "Skewness of the migratory period (25%-75%)",
      "peak_kurt" ~ "Kurtosis of the migratory period (25%-75%)",
      "p50_to_end" ~ "Number of days from the date of the 50% percentile to the end of migration",
      "all_skew" ~ "Skewness of the entire period after padding out the ends",
      "all_kurt" ~ "Kurtosis of the  entire period after padding out the ends",
      "n_missing" ~ "Number of missing count days in the two weeks before predicted start of migration",
      
      "se" ~ "Standard error of the GAM model", 
      "ci99_upper" ~ "Upper limit of the 99% Confidence interval",
      "ci99_lower" ~ "Lower limit of the 99% Confidence interval"
      
    ),
    desc = if_else(field == "count" & file == "vultures_cumulative_counts.csv", 
                   "Counts with median residents subtracted", desc))


data_pkg <- create_package()
for(i in t) {
  schema <- create_schema(read_csv(i))
  schema$fields <- map(
    schema$fields, 
    \(x) c(x, description = f$desc[f$file == basename(i) & x$name == f$field]))
  data_pkg <- add_resource(data_pkg, basename(i), i, schema = schema)
}

write_package(data_pkg, "Data/Datasets")

writeLines(
  paste0(
    "# Data details

These are the tables and data files from the study.

### Data

`vultures_xxx` represent data files

- `vultures_clean_2023.csv` is the cleaned raw data set
- `vultures_final.csv` is the data with all calculated metrics used in models
- `vultures_gams.rds`, `vultures_gams_pred.csv` and `vultures_cumulative_counts.csv` are
intermediate data files.

### Tables

`table_xxx` represent tables of model results for 

- Migration duration (`duration`)
- Migration timing (`timing` for individual models `timing_combined` for single model)
- Migration population sizes (`pop_mig`)
- Resident population sizes (`pop_res`)
- Migration patterns (`skew`)
- Supplemental analyses (`supplemental`)


### Metadata", 
    
    yaml::as.yaml(data_pkg)
  ), "Data/Datasets/README.md")
  
  