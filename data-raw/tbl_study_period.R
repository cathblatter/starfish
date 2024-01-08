## code to prepare `tbl_study_period` dataset goes here
study_period <- seq.Date(from = as.Date("2018-01-01"),
                         to = as.Date("2022-12-31"), by = 1)

tbl_study_period <- data.frame(study_day = study_period)


# add integers for shaded rectangles
tbl_study_period$study_day_int <- as.integer(tbl_study_period$study_day)

# add day within a month
tbl_study_period$study_day_in_month_int <-
  as.integer(format(as.Date(tbl_study_period$study_day,format="%Y-%m-%d"), "%d"))

# add weekdays
tbl_study_period$study_weekday <- weekdays(tbl_study_period$study_day)

# add weekends
tbl_study_period$study_weekend <- ifelse(tbl_study_period$study_weekday %in% c(
  "Saturday", "Sunday"
), 1, 0)

# add months
tbl_study_period$study_months <- months(tbl_study_period$study_day)


usethis::use_data(tbl_study_period, overwrite = TRUE)
