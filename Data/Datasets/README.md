# Data details

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


### Metadata

Dataset: **table_duration.csv** (text/csv; UTF-8)

Fields: 

- **model**
    - type: string
    - description: Model definition
- **term**
    - type: string
    - description: Model parameter or term being definied
- **estimate**
    - type: number
    - description: Model parameter estimate
- **std_error**
    - type: number
    - description: Standard error of the model parameter estimate
- **statistic**
    - type: number
    - description: Value of the model's test statistic
- **p_value**
    - type: number
    - description: P-value
- **n**
    - type: number
    - description: Number of samples (years) in the analysis
- **model_r_squared**
    - type: number
    - description: R2 of the model
- **model_adj_r_squared**
    - type: number
    - description: Adjusted R2 of the model
- **model_f**
    - type: number
    - description: F statistic for the model as a whole
- **model_p**
    - type: number
    - description: P-value for the model as a whole


Dataset: **table_pop_mig.csv** (text/csv; UTF-8)

Fields: 

- **model**
    - type: string
    - description: Model definition
- **term**
    - type: string
    - description: Model parameter or term being definied
- **estimate**
    - type: number
    - description: Model parameter estimate
- **estimate_exp**
    - type: number
    - description: Exponentiated estimate for Poisson or Negative Binomial estimates
- **std_error**
    - type: number
    - description: Standard error of the model parameter estimate
- **statistic**
    - type: number
    - description: Value of the model's test statistic
- **p_value**
    - type: number
    - description: P-value
- **n**
    - type: number
    - description: Number of samples (years) in the analysis


Dataset: **table_pop_res.csv** (text/csv; UTF-8)

Fields: 

- **model**
    - type: string
    - description: Model definition
- **term**
    - type: string
    - description: Model parameter or term being definied
- **estimate**
    - type: number
    - description: Model parameter estimate
- **estimate_exp**
    - type: number
    - description: Exponentiated estimate for Poisson or Negative Binomial estimates
- **std_error**
    - type: number
    - description: Standard error of the model parameter estimate
- **statistic**
    - type: number
    - description: Value of the model's test statistic
- **p_value**
    - type: number
    - description: P-value
- **n**
    - type: number
    - description: Number of samples (years) in the analysis


Dataset: **table_skew.csv** (text/csv; UTF-8)

Fields: 

- **model**
    - type: string
    - description: Model definition
- **term**
    - type: string
    - description: Model parameter or term being definied
- **estimate**
    - type: number
    - description: Model parameter estimate
- **std_error**
    - type: number
    - description: Standard error of the model parameter estimate
- **statistic**
    - type: number
    - description: Value of the model's test statistic
- **p_value**
    - type: number
    - description: P-value
- **n**
    - type: number
    - description: Number of samples (years) in the analysis
- **model_r_squared**
    - type: number
    - description: R2 of the model
- **model_adj_r_squared**
    - type: number
    - description: Adjusted R2 of the model
- **model_f**
    - type: string
    - description: F statistic for the model as a whole
- **model_p**
    - type: string
    - description: P-value for the model as a whole


Dataset: **table_supplemental.csv** (text/csv; UTF-8)

Fields: 

- **model**
    - type: string
    - description: Model definition
- **term**
    - type: string
    - description: Model parameter or term being definied
- **estimate**
    - type: number
    - description: Model parameter estimate
- **std_error**
    - type: number
    - description: Standard error of the model parameter estimate
- **statistic**
    - type: number
    - description: Value of the model's test statistic
- **p_value**
    - type: number
    - description: P-value
- **type**
    - type: string
    - description: Type of model being compared, 'original' is the model without any omissions, 'gaps_removed' has years with gaps in the record removed, 'end_removed' has years with a gap at the end removed, 'all_removed' has years with both gaps during and at the end removed


Dataset: **table_timing_combined.csv** (text/csv; UTF-8)

Fields: 

- **measure**
    - type: string
    - description: Metric compared in the post hoc
- **estimate**
    - type: number
    - description: Model parameter estimate
- **std_error**
    - type: number
    - description: Standard error of the model parameter estimate
- **df**
    - type: number
    - description: Degrees of freedom
- **statistic**
    - type: number
    - description: Value of the model's test statistic
- **p_value**
    - type: number
    - description: P-value
- **model**
    - type: string
    - description: Model definition
- **n**
    - type: number
    - description: Number of samples (years) in the analysis


Dataset: **table_timing.csv** (text/csv; UTF-8)

Fields: 

- **model**
    - type: string
    - description: Model definition
- **term**
    - type: string
    - description: Model parameter or term being definied
- **estimate**
    - type: number
    - description: Model parameter estimate
- **std_error**
    - type: number
    - description: Standard error of the model parameter estimate
- **statistic**
    - type: number
    - description: Value of the model's test statistic
- **p_value**
    - type: number
    - description: P-value
- **n**
    - type: number
    - description: Number of samples (years) in the analysis
- **model_r_squared**
    - type: number
    - description: R2 of the model
- **model_adj_r_squared**
    - type: number
    - description: Adjusted R2 of the model
- **model_f**
    - type: number
    - description: F statistic for the model as a whole
- **model_p**
    - type: number
    - description: P-value for the model as a whole


Dataset: **vultures_clean_2023.csv** (text/csv; UTF-8)

Fields: 

- **date**
    - type: date
    - description: Date of the count
- **year**
    - type: number
    - description: Year of the count
- **count**
    - type: number
    - description: Daily estimates of the greatest aggregation of vultures over Rocky Point that day during the station hours
- **doy**
    - type: number
    - description: Day of year


Dataset: **vultures_cumulative_counts.csv** (text/csv; UTF-8)

Fields: 

- **year**
    - type: number
    - description: Year of the count
- **doy**
    - type: number
    - description: Day of year
- **res_pop_median**
    - type: number
    - description: Median number of residences caculated from GAM model predictions
- **count_init**
    - type: number
    - description: Original daily estimates
- **count**
    - type: number
    - description: Counts with median residents subtracted
- **count_sum**
    - type: number
    - description: Cumulative counts


Dataset: **vultures_final.csv** (text/csv; UTF-8)

Fields: 

- **year**
    - type: number
    - description: Year of the count
- **date_min**
    - type: date
    - description: First date with an observation in that year
- **date_max**
    - type: date
    - description: Last date with an observation in that year
- **n_dates_obs**
    - type: number
    - description: Number of dates with a count
- **n_dates**
    - type: number
    - description: Number of dates in the range (min to max)
- **n_obs**
    - type: number
    - description: Total number of vultures seen
- **mig_start_doy**
    - type: number
    - description: Day of year of the start of migration (5%-95%)
- **mig_end_doy**
    - type: number
    - description: Day of year of the end of migration (5%-95%)
- **peak_start_doy**
    - type: number
    - description: Day of year of the start of peak migration (25%-75%)
- **peak_end_doy**
    - type: number
    - description: Day of year of the end of peak migration (25%-75%)
- **p50_doy**
    - type: number
    - description: Day of year of the 50% percentile of migration (50%)
- **max_doy**
    - type: number
    - description: Day of year of the max count
- **mig_dur_days**
    - type: number
    - description: Number of days of the migration period (5%-95%)
- **peak_dur_days**
    - type: number
    - description: Number of days of the peak migration period (25%-75%)
- **peak_pop_min**
    - type: number
    - description: Minimum number of peak migrants (25%-75%) calculated from GAM model predictions
- **peak_pop_median**
    - type: number
    - description: Median number of peak migrants (25%-75%) calculated from GAM model predictions
- **peak_pop_mean**
    - type: number
    - description: Mean number of peak migrants (25%-75%) calculated from GAM model predictions
- **peak_pop_total**
    - type: number
    - description: Total number of peak migrants (25%-75%) calculated from GAM model predictions
- **mig_pop_min**
    - type: number
    - description: Minimum number of migrants (5%-95%) calculated from GAM model predictions
- **mig_pop_max**
    - type: number
    - description: Maximum number of migrants (5%-95%) or peak migrants (25%-75%) calculated from GAM model predictions
- **mig_pop_median**
    - type: number
    - description: Median number of migrants (5%-95%) calculated from GAM model predictions
- **mig_pop_mean**
    - type: number
    - description: Mean number of migrants (5%-95%) calculated from GAM model predictions
- **mig_pop_total**
    - type: number
    - description: Total number of migrants (5%-95%) calculated from GAM model predictions
- **res_pop_min**
    - type: number
    - description: Min number of residences caculated from GAM model predictions
- **res_pop_max**
    - type: number
    - description: Max number of residences caculated from GAM model predictions
- **res_pop_median**
    - type: number
    - description: Median number of residences caculated from GAM model predictions
- **res_pop_mean**
    - type: number
    - description: Mean number of residences caculated from GAM model predictions
- **ambig_pop_min**
    - type: number
    - description: Min number of vultures in the ambiguous period that occurs after the resident period but before the start of migration and after the end of migration, caculated from GAM model predictions
- **ambig_pop_max**
    - type: number
    - description: Max number of vultures in the ambiguous period that occurs after the resident period but before the start of migration and after the end of migration, caculated from GAM model predictions
- **ambig_pop_median**
    - type: number
    - description: Median number of vultures in the ambiguous period that occurs after the resident period but before the start of migration and after the end of migration, caculated from GAM model predictions
- **ambig_pop_mean**
    - type: number
    - description: Mean number of vultures in the ambiguous period that occurs after the resident period but before the start of migration and after the end of migration, caculated from GAM model predictions
- **mig_raw_min**
    - type: number
    - description: Minimum number of migrants (5%-95%) from raw counts
- **mig_raw_max**
    - type: number
    - description: Maximum number of migrants (5%-95%) or peak migrants (25%-75%) from raw counts
- **mig_raw_median**
    - type: number
    - description: Median number of migrants (5%-95%) from raw counts
- **mig_raw_mean**
    - type: number
    - description: Mean number of migrants (5%-95%) from raw counts
- **mig_raw_total**
    - type: number
    - description: Total number of migrants (5%-95%) from raw counts
- **res_raw_min**
    - type: number
    - description: Min number of residences caculated from raw counts
- **res_raw_max**
    - type: number
    - description: Max number of residences caculated from raw counts
- **res_raw_median**
    - type: number
    - description: Median number of residences caculated from raw counts
- **res_raw_mean**
    - type: number
    - description: Mean number of residences caculated from raw counts
- **ambig_raw_min**
    - type: number
    - description: Min number of vultures in the ambiguous period that occurs after the resident period but before the start of migration and after the end of migration, from raw counts
- **ambig_raw_max**
    - type: number
    - description: Max number of vultures in the ambiguous period that occurs after the resident period but before the start of migration and after the end of migration, from raw counts
- **ambig_raw_median**
    - type: number
    - description: Median number of vultures in the ambiguous period that occurs after the resident period but before the start of migration and after the end of migration, from raw counts
- **ambig_raw_mean**
    - type: number
    - description: Mean number of vultures in the ambiguous period that occurs after the resident period but before the start of migration and after the end of migration, from raw counts
- **peak_raw_min**
    - type: number
    - description: Minimum number of peak migrants (25%-75%) from raw counts
- **peak_raw_median**
    - type: number
    - description: Median number of peak migrants (25%-75%) from raw counts
- **peak_raw_mean**
    - type: number
    - description: Mean number of peak migrants (25%-75%) from raw counts
- **peak_raw_total**
    - type: number
    - description: Total number of peak migrants (25%-75%) from raw counts
- **mig_skew**
    - type: number
    - description: Skewness of the migratory period (5%-95%)
- **mig_kurt**
    - type: number
    - description: Kurtosis of the migratory period (5%-95%)
- **peak_skew**
    - type: number
    - description: Skewness of the migratory period (25%-75%)
- **peak_kurt**
    - type: number
    - description: Kurtosis of the migratory period (25%-75%)
- **p50_to_end**
    - type: number
    - description: Number of days from the date of the 50% percentile to the end of migration
- **all_skew**
    - type: number
    - description: Skewness of the entire period after padding out the ends
- **all_kurt**
    - type: number
    - description: Kurtosis of the  entire period after padding out the ends
- **n_missing**
    - type: number
    - description: Number of missing count days in the two weeks before predicted start of migration


Dataset: **vultures_gams_pred.csv** (text/csv; UTF-8)

Fields: 

- **year**
    - type: number
    - description: Year of the count
- **doy**
    - type: number
    - description: Day of year
- **count**
    - type: number
    - description: Daily estimates of the greatest aggregation of vultures over Rocky Point that day during the station hours
- **se**
    - type: number
    - description: Standard error of the GAM model
- **ci99_upper**
    - type: number
    - description: Upper limit of the 99% Confidence interval
- **ci99_lower**
    - type: number
    - description: Lower limit of the 99% Confidence interval

