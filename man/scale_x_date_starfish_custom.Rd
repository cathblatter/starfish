% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scale_date_starfish.R
\name{scale_x_date_starfish}
\alias{scale_x_date_starfish}
\alias{scale_x_date_sf}
\title{Custom starfish date scale}
\usage{
scale_x_date_starfish(
  date_breaks = "1 year",
  date_labels = "\%Y",
  expand = c(0.05, 0),
  ...
)

scale_x_date_sf(
  date_breaks = "1 year",
  date_labels = "\%Y",
  expand = c(0.05, 0),
  ...
)
}
\arguments{
\item{date_breaks}{defaults to 1 year}

\item{date_labels}{defaults to YYYY}

\item{expand}{how to expand the axes}

\item{...}{further args passed}
}
\value{
a custom scale
}
\description{
Custom starfish date scale
}
