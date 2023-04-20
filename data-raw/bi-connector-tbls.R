
# 1.Prefix ----------------------------------------------------------------
library(dplyr)
library(tidyr)

# import file
zz_bi_pepzeiten <- readxl::read_excel("data-raw/BI-connector-tbls.xlsx", sheet = 2)
zz_bi_hierarchie <- readxl::read_excel("data-raw/BI-connector-tbls.xlsx", sheet = 1)

# fix whitespaces etc
dict_pepzeiten <-
  zz_bi_pepzeiten |>
  janitor::clean_names() |>
  mutate(across(.cols = everything(), .fns = ~stringr::str_squish(.))) |>
  fill(c(feld, datentyp), .direction = "down") |>
  drop_na(bemerkung) |>
  separate(col = bemerkung,
           into = c("value", "meaning"), sep = " = ", remove = F)

dict_hierarchie <-
  zz_bi_hierarchie |>
  janitor::clean_names() |>
  mutate(across(.cols = everything(), .fns = ~stringr::str_squish(.)))

usethis::use_data(dict_hierarchie)
usethis::use_data(dict_pepzeiten)
