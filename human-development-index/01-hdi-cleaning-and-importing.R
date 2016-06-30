 # Cleaning and importing data for project

library(xlsx)
library(tidyr)
library(dplyr)

 # Cleaning population data: tidy tall data.frame("Country", "Year", "HDI")
hdi <- read.csv("Human development index (HDI).csv", skip = 1, header = TRUE)
hdi <- dplyr::select(hdi, -HDI.Rank)
hdi <- tidyr::gather(hdi, "Year", "HDI", 2:12)
hdi <- dplyr::arrange(hdi, Country)
hdi$Year <- substr(hdi$Year, 2, 5) # Drop X from year, introduced from headers

 # str(hdi) # Checking the result
 # utils::View(hdi)

 # Cleaning UN World Population Table
pop <- read.xlsx("WPP2015_POP_F01_1_TOTAL_POPULATION_BOTH_SEXES.XLS", 1,
                 startRow = 17, encoding = "UTF-8")
pop <- dplyr::select(pop, -Index, -Variant, -Notes, -Country.code)
pop <- rename(pop, Country = Major.area..region..country.or.area..)
pop <- pop[-c(1:14, 35, 45, 53, 59, 77, 78, 88, 89, 94,
              104, 116, 135, 136, 147, 161, 178, 188, 189, 216, 
              225, 240, 246, 247, 250, 256, 264),]
pop <- tidyr::gather(pop, "Year", "Population", 2:67)
pop <- dplyr::arrange(pop, Country)
pop$Year <- substr(pop$Year, 2, 5)
pop$Population <- pop$Population * 1000 # Was denominated in thousands

 # str(pop)
 # utils::View(pop)