## code to prepare `tbl_study_period` dataset goes here
study_period <- seq.Date(from = as.Date("2018-01-01"), to = as.Date("2022-12-31"), by = 1)

tbl_study_period <- data.frame(study_day = study_period)

usethis::use_data(tbl_study_period, overwrite = TRUE)
