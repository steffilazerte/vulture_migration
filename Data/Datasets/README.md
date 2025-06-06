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


### Metadataresources:

  - name: table_duration.csv

    path: Data/Datasets/table_duration.csv

    profile: tabular-data-resource

    format: csv

    mediatype: text/csv

    encoding: UTF-8

    schema:

      fields:

      - name: model

        type: string

        description: Model definition

      - name: term

        type: string

        description: Model parameter or term being definied

      - name: estimate

        type: number

        description: Model parameter estimate

      - name: std_error

        type: number

        description: Standard error of the model parameter estimate

      - name: statistic

        type: number

        description: Value of the model's test statistic

      - name: p_value

        type: number

        description: P-value

      - name: 'n'

        type: number

        description: Number of samples (years) in the analysis

      - name: model_r_squared

        type: number

        description: R2 of the model

      - name: model_adj_r_squared

        type: number

        description: Adjusted R2 of the model

      - name: model_f

        type: number

        description: F statistic for the model as a whole

      - name: model_p

        type: number

        description: P-value for the model as a whole

  - name: table_pop_mig.csv

    path: Data/Datasets/table_pop_mig.csv

    profile: tabular-data-resource

    format: csv

    mediatype: text/csv

    encoding: UTF-8

    schema:

      fields:

      - name: model

        type: string

        description: Model definition

      - name: term

        type: string

        description: Model parameter or term being definied

      - name: estimate

        type: number

        description: Model parameter estimate

      - name: estimate_exp

        type: number

        description: Exponentiated estimate for Poisson or Negative Binomial estimates

      - name: std_error

        type: number

        description: Standard error of the model parameter estimate

      - name: statistic

        type: number

        description: Value of the model's test statistic

      - name: p_value

        type: number

        description: P-value

      - name: 'n'

        type: number

        description: Number of samples (years) in the analysis

  - name: table_pop_res.csv

    path: Data/Datasets/table_pop_res.csv

    profile: tabular-data-resource

    format: csv

    mediatype: text/csv

    encoding: UTF-8

    schema:

      fields:

      - name: model

        type: string

        description: Model definition

      - name: term

        type: string

        description: Model parameter or term being definied

      - name: estimate

        type: number

        description: Model parameter estimate

      - name: estimate_exp

        type: number

        description: Exponentiated estimate for Poisson or Negative Binomial estimates

      - name: std_error

        type: number

        description: Standard error of the model parameter estimate

      - name: statistic

        type: number

        description: Value of the model's test statistic

      - name: p_value

        type: number

        description: P-value

      - name: 'n'

        type: number

        description: Number of samples (years) in the analysis

  - name: table_skew.csv

    path: Data/Datasets/table_skew.csv

    profile: tabular-data-resource

    format: csv

    mediatype: text/csv

    encoding: UTF-8

    schema:

      fields:

      - name: model

        type: string

        description: Model definition

      - name: term

        type: string

        description: Model parameter or term being definied

      - name: estimate

        type: number

        description: Model parameter estimate

      - name: std_error

        type: number

        description: Standard error of the model parameter estimate

      - name: statistic

        type: number

        description: Value of the model's test statistic

      - name: p_value

        type: number

        description: P-value

      - name: 'n'

        type: number

        description: Number of samples (years) in the analysis

      - name: model_r_squared

        type: number

        description: R2 of the model

      - name: model_adj_r_squared

        type: number

        description: Adjusted R2 of the model

      - name: model_f

        type: string

        description: F statistic for the model as a whole

      - name: model_p

        type: string

        description: P-value for the model as a whole

  - name: table_supplemental.csv

    path: Data/Datasets/table_supplemental.csv

    profile: tabular-data-resource

    format: csv

    mediatype: text/csv

    encoding: UTF-8

    schema:

      fields:

      - name: model

        type: string

        description: Model definition

      - name: term

        type: string

        description: Model parameter or term being definied

      - name: estimate

        type: number

        description: Model parameter estimate

      - name: std_error

        type: number

        description: Standard error of the model parameter estimate

      - name: statistic

        type: number

        description: Value of the model's test statistic

      - name: p_value

        type: number

        description: P-value

      - name: type

        type: string

        description: Type of model being compared, 'original' is the model without any

          omissions, 'gaps_removed' has years with gaps in the record removed, 'end_removed'

          has years with a gap at the end removed, 'all_removed' has years with both

          gaps during and at the end removed

  - name: table_timing_combined.csv

    path: Data/Datasets/table_timing_combined.csv

    profile: tabular-data-resource

    format: csv

    mediatype: text/csv

    encoding: UTF-8

    schema:

      fields:

      - name: measure

        type: string

        description: Metric compared in the post hoc

      - name: estimate

        type: number

        description: Model parameter estimate

      - name: std_error

        type: number

        description: Standard error of the model parameter estimate

      - name: df

        type: number

        description: Degrees of freedom

      - name: statistic

        type: number

        description: Value of the model's test statistic

      - name: p_value

        type: number

        description: P-value

      - name: model

        type: string

        description: Model definition

      - name: 'n'

        type: number

        description: Number of samples (years) in the analysis

  - name: table_timing.csv

    path: Data/Datasets/table_timing.csv

    profile: tabular-data-resource

    format: csv

    mediatype: text/csv

    encoding: UTF-8

    schema:

      fields:

      - name: model

        type: string

        description: Model definition

      - name: term

        type: string

        description: Model parameter or term being definied

      - name: estimate

        type: number

        description: Model parameter estimate

      - name: std_error

        type: number

        description: Standard error of the model parameter estimate

      - name: statistic

        type: number

        description: Value of the model's test statistic

      - name: p_value

        type: number

        description: P-value

      - name: 'n'

        type: number

        description: Number of samples (years) in the analysis

      - name: model_r_squared

        type: number

        description: R2 of the model

      - name: model_adj_r_squared

        type: number

        description: Adjusted R2 of the model

      - name: model_f

        type: number

        description: F statistic for the model as a whole

      - name: model_p

        type: number

        description: P-value for the model as a whole

  - name: vultures_clean_2023.csv

    path: Data/Datasets/vultures_clean_2023.csv

    profile: tabular-data-resource

    format: csv

    mediatype: text/csv

    encoding: UTF-8

    schema:

      fields:

      - name: date

        type: date

        description: Date of the count

      - name: year

        type: number

        description: Year of the count

      - name: count

        type: number

        description: Daily estimates of the greatest aggregation of vultures over Rocky

          Point that day during the station hours

      - name: doy

        type: number

        description: Day of year

  - name: vultures_cumulative_counts.csv

    path: Data/Datasets/vultures_cumulative_counts.csv

    profile: tabular-data-resource

    format: csv

    mediatype: text/csv

    encoding: UTF-8

    schema:

      fields:

      - name: year

        type: number

        description: Year of the count

      - name: doy

        type: number

        description: Day of year

      - name: res_pop_median

        type: number

        description: Median number of residences caculated from GAM model predictions

      - name: count_init

        type: number

        description: Original daily estimates

      - name: count

        type: number

        description: Counts with median residents subtracted

      - name: count_sum

        type: number

        description: Cumulative counts

  - name: vultures_final.csv

    path: Data/Datasets/vultures_final.csv

    profile: tabular-data-resource

    format: csv

    mediatype: text/csv

    encoding: UTF-8

    schema:

      fields:

      - name: year

        type: number

        description: Year of the count

      - name: date_min

        type: date

        description: First date with an observation in that year

      - name: date_max

        type: date

        description: Last date with an observation in that year

      - name: n_dates_obs

        type: number

        description: Number of dates with a count

      - name: n_dates

        type: number

        description: Number of dates in the range (min to max)

      - name: n_obs

        type: number

        description: Total number of vultures seen

      - name: mig_start_doy

        type: number

        description: Day of year of the start of migration (5%-95%)

      - name: mig_end_doy

        type: number

        description: Day of year of the end of migration (5%-95%)

      - name: peak_start_doy

        type: number

        description: Day of year of the start of peak migration (25%-75%)

      - name: peak_end_doy

        type: number

        description: Day of year of the end of peak migration (25%-75%)

      - name: p50_doy

        type: number

        description: Day of year of the 50% percentile of migration (50%)

      - name: max_doy

        type: number

        description: Day of year of the max count

      - name: mig_dur_days

        type: number

        description: Number of days of the migration period (5%-95%)

      - name: peak_dur_days

        type: number

        description: Number of days of the peak migration period (25%-75%)

      - name: peak_pop_min

        type: number

        description: Minimum number of peak migrants (25%-75%) calculated from GAM model

          predictions

      - name: peak_pop_median

        type: number

        description: Median number of peak migrants (25%-75%) calculated from GAM model

          predictions

      - name: peak_pop_mean

        type: number

        description: Mean number of peak migrants (25%-75%) calculated from GAM model

          predictions

      - name: peak_pop_total

        type: number

        description: Total number of peak migrants (25%-75%) calculated from GAM model

          predictions

      - name: mig_pop_min

        type: number

        description: Minimum number of migrants (5%-95%) calculated from GAM model predictions

      - name: mig_pop_max

        type: number

        description: Maximum number of migrants (5%-95%) or peak migrants (25%-75%)

          calculated from GAM model predictions

      - name: mig_pop_median

        type: number

        description: Median number of migrants (5%-95%) calculated from GAM model predictions

      - name: mig_pop_mean

        type: number

        description: Mean number of migrants (5%-95%) calculated from GAM model predictions

      - name: mig_pop_total

        type: number

        description: Total number of migrants (5%-95%) calculated from GAM model predictions

      - name: res_pop_min

        type: number

        description: Min number of residences caculated from GAM model predictions

      - name: res_pop_max

        type: number

        description: Max number of residences caculated from GAM model predictions

      - name: res_pop_median

        type: number

        description: Median number of residences caculated from GAM model predictions

      - name: res_pop_mean

        type: number

        description: Mean number of residences caculated from GAM model predictions

      - name: ambig_pop_min

        type: number

        description: Min number of vultures in the ambiguous period that occurs after

          the resident period but before the start of migration and after the end of

          migration, caculated from GAM model predictions

      - name: ambig_pop_max

        type: number

        description: Max number of vultures in the ambiguous period that occurs after

          the resident period but before the start of migration and after the end of

          migration, caculated from GAM model predictions

      - name: ambig_pop_median

        type: number

        description: Median number of vultures in the ambiguous period that occurs after

          the resident period but before the start of migration and after the end of

          migration, caculated from GAM model predictions

      - name: ambig_pop_mean

        type: number

        description: Mean number of vultures in the ambiguous period that occurs after

          the resident period but before the start of migration and after the end of

          migration, caculated from GAM model predictions

      - name: mig_raw_min

        type: number

        description: Minimum number of migrants (5%-95%) from raw counts

      - name: mig_raw_max

        type: number

        description: Maximum number of migrants (5%-95%) or peak migrants (25%-75%)

          from raw counts

      - name: mig_raw_median

        type: number

        description: Median number of migrants (5%-95%) from raw counts

      - name: mig_raw_mean

        type: number

        description: Mean number of migrants (5%-95%) from raw counts

      - name: mig_raw_total

        type: number

        description: Total number of migrants (5%-95%) from raw counts

      - name: res_raw_min

        type: number

        description: Min number of residences caculated from raw counts

      - name: res_raw_max

        type: number

        description: Max number of residences caculated from raw counts

      - name: res_raw_median

        type: number

        description: Median number of residences caculated from raw counts

      - name: res_raw_mean

        type: number

        description: Mean number of residences caculated from raw counts

      - name: ambig_raw_min

        type: number

        description: Min number of vultures in the ambiguous period that occurs after

          the resident period but before the start of migration and after the end of

          migration, from raw counts

      - name: ambig_raw_max

        type: number

        description: Max number of vultures in the ambiguous period that occurs after

          the resident period but before the start of migration and after the end of

          migration, from raw counts

      - name: ambig_raw_median

        type: number

        description: Median number of vultures in the ambiguous period that occurs after

          the resident period but before the start of migration and after the end of

          migration, from raw counts

      - name: ambig_raw_mean

        type: number

        description: Mean number of vultures in the ambiguous period that occurs after

          the resident period but before the start of migration and after the end of

          migration, from raw counts

      - name: peak_raw_min

        type: number

        description: Minimum number of peak migrants (25%-75%) from raw counts

      - name: peak_raw_median

        type: number

        description: Median number of peak migrants (25%-75%) from raw counts

      - name: peak_raw_mean

        type: number

        description: Mean number of peak migrants (25%-75%) from raw counts

      - name: peak_raw_total

        type: number

        description: Total number of peak migrants (25%-75%) from raw counts

      - name: mig_skew

        type: number

        description: Skewness of the migratory period (5%-95%)

      - name: mig_kurt

        type: number

        description: Kurtosis of the migratory period (5%-95%)

      - name: peak_skew

        type: number

        description: Skewness of the migratory period (25%-75%)

      - name: peak_kurt

        type: number

        description: Kurtosis of the migratory period (25%-75%)

      - name: p50_to_end

        type: number

        description: Number of days from the date of the 50% percentile to the end of

          migration

      - name: all_skew

        type: number

        description: Skewness of the entire period after padding out the ends

      - name: all_kurt

        type: number

        description: Kurtosis of the  entire period after padding out the ends

      - name: n_missing

        type: number

        description: Number of missing count days in the two weeks before predicted

          start of migration

  - name: vultures_gams_pred.csv

    path: Data/Datasets/vultures_gams_pred.csv

    profile: tabular-data-resource

    format: csv

    mediatype: text/csv

    encoding: UTF-8

    schema:

      fields:

      - name: year

        type: number

        description: Year of the count

      - name: doy

        type: number

        description: Day of year

      - name: count

        type: number

        description: Daily estimates of the greatest aggregation of vultures over Rocky

          Point that day during the station hours

      - name: se

        type: number

        description: Standard error of the GAM model

      - name: ci99_upper

        type: number

        description: Upper limit of the 99% Confidence interval

      - name: ci99_lower

        type: number

        description: Lower limit of the 99% Confidence interval

  directory: '.'

  
