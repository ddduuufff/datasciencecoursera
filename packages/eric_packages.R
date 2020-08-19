eric_apps <- function(){
#packages
eric_packages <- c(
  "dplyr",
  "tidyr",
  "stringr",
  "lubridate",
  "ggplot2",
  "tidyverse",
  "purrr",
  "shiny"
)#We create a variable where we indicating that we select the ones that we do not have installed.                     
install.lib <- eric_packages[!eric_packages %in% installed.packages()]
#With a loop we install the libraries that we do not have.
for(lib in install.lib) install.packages(lib,dependences=TRUE)
#Load the libraries
sapply(eric_packages,require,character=TRUE)
}
