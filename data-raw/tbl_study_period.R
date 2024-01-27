## code to prepare `tbl_study_period` dataset goes here
study_period <- seq.Date(from = as.Date("2018-01-01"),
                         to = as.Date("2022-12-31"), by = 1)

tbl_study_period <- tibble::tibble(study_day = study_period)


# add integers for shaded rectangles
tbl_study_period$study_day_int <- as.integer(tbl_study_period$study_day)

# add day within a month
tbl_study_period$study_day_in_month_int <-
  as.integer(format(as.Date(tbl_study_period$study_day,format="%Y-%m-%d"), "%d"))

# add weekdays
tbl_study_period$study_weekday <- weekdays(tbl_study_period$study_day)

# add weekends
tbl_study_period$study_weekend <- ifelse(tbl_study_period$study_weekday %in% c(
  "Saturday", "Sunday"), 1, 0)

# add months
tbl_study_period$study_months <- months(tbl_study_period$study_day)

# add year-week
tbl_study_period$study_year_month <- format(tbl_study_period$study_day, "%Y-%m")

# add year-week
tbl_study_period$study_year_week <- format(tbl_study_period$study_day, "%Y-%V")

# add shadings
tbl_study_period


usethis::use_data(tbl_study_period, overwrite = TRUE)
