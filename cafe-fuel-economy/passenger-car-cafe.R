 # Creating a better graphic for Cafe Fuel Economy
 # Performance Summary, from
 # http://www.nhtsa.gov/staticfiles/rulemaking/pdf/cafe/Performance-summary-report-12152014-v2.pdf
 # and hosted on
 # https://en.wikipedia.org/wiki/Fuel_economy_in_automobiles

library(tidyr)
library(plyr)
library(dplyr)
library(ggplot2)

economy <- read.csv("Performance-summary-report-12152014-v2.csv")

 # Select relevant columns
cars <- dplyr::select(
  economy,one_of(c(
    "MODEL_YEAR", "PASSENGER_CARS", "DOMESTIC", "IMPORT"
    )))

 # Gather columns by vehicle type
cafe <- tidyr::gather(cars, "Type", "MPG", 2:4)
utils::View(cafe)
cafe$Type <- factor(cafe$Type, labels = c("Passenger", "Domestic", "Import"))

qplot(data=cafe, x = MODEL_YEAR, y = MPG, color=Type, geom=c("point", "line"),
      shape=Type)
 # It works; time to make it prettier

