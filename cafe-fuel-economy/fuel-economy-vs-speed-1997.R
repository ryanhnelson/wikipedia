 # Fuel economy vs speed 1997
 # From Transportation Energy Data Book: Edition 26-2007
 # Table 4.24

library(tidyr)
library(dplyr)
library(ggplot2)

speed <- read.csv("fuel-economy-vs-speed-1997.csv", sep = ";")
utils::View(speed)

speed <- tidyr::gather(speed, "Model", "MPG", 2:10) # melt