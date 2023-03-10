# set theme_starfish() on pkg load
.onLoad <- function(libname, pkgname) {
  ggplot2::theme_set(theme_starfish())
}
