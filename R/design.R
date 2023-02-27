#' STARFISH palette
#' with six dimensions
#'
#' @name starfish_pal
NULL

#' @name starfish_pal
#' @export
starfish_pal <- c(
  # base palette
  "Cerulean" = "#006992",
  "Cambridge blue" = "#8db38b",
  "Dark spring green" = "#04724d",
  "Hunyadi yellow" = "#f6ae2d",
  "Orange (Pantone)" = "#f26419",
  "Cornell red" = "#B31B1B",
  # for diverging scales
  "Sky blue" = "#8ecae6",
  "Prussian blue" = "#023047",
  "Selective yellow" = "#ffb703",
  # for more options
  "Blue Green" = "#219ebc",
  "Payne's gray" = "#577590",
  "Dark cyan" = "#4d908e",
  "Zomp" = "#43aa8b",
  "Pistachio" = "#90be6d",
  "Saffron" = "#f9c74f",
  "Coral" = "#f9844a"
)


#' @name starfish_pal
#' @export
# Define opinionated discrete palette (good, neutral, bad)
starfish_pal_op <- c(starfish_pal[2], "grey50", starfish_pal[5])

#' @name starfish_pal
#' @export
# Define two colors for endpoints of continuous palette
starfish_pal_cont <- c(starfish_pal[13], starfish_pal[15])

#' @name starfish_pal
#' @export
# Define three colors for endpoints of diverging continuous palette (high, middle, low)
starfish_pal_div  <- c(starfish_pal[7], starfish_pal[8], starfish_pal[9])



#' Ten-color palette
#'
#' @export
starfish_pal_ten <-
  c(
    "Cerulean" = "#277da1",
    "Payne's gray" = "#577590",
    "Dark cyan" = "#4d908e",
    "Zomp" = "#43aa8b",
    "Pistachio" = "#90be6d",
    "Saffron" = "#f9c74f",
    "Coral" = "#f9844a",
    "Carrot orange" = "#f8961e",
    "Orange (Crayola)" = "#f3722c",
    "Imperial red" = "#f94144"
  )

#' Diverging palette
#'
#' @export
starfish_seven_diverging <-
  c(
    "Sky blue" = "#8ecae6",
    "Blue Green" = "#219ebc",
    "Cerulean" = "#126782",
    "Prussian blue" = "#023047",
    "Selective yellow" = "#ffb703",
    "Orange peel" = "#fd9e02",
    "UT orange" = "#fb8500"
  )


#' Pastel palette
#'
#' @export
starfish_pal2 <-
  c(
    "Charcoal" = "#264653",
    "Persian green" = "#2a9d8f",
    "Saffron" = "#e9c46a",
    "Sandy brown" = "#f4a261",
    "Burnt sienna" = "#e76f51"
  )
