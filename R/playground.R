



scale_color_starfish_d <- function(palette = "starfish", ...) {

  pal <- retrieve_pal(palette)
  pal2 <- unname(pal)

  scale_color_manual(values = pal2)
}




#' Title
#'
#' @param name palette name
#'
#' @return
#' @keywords internal
retrieve_pal <- function(name){

  pal_name <- paste0(name, "_pal")
  pal <- try(utils::getFromNamespace(pal_name, "starfish"))
  return(pal)

}



# test case
ggplot(diamonds[1:2000,], aes(x = color,
                              y = price,
                              color = color)) +
  geom_point() +
  scale_color_starfish_d()
