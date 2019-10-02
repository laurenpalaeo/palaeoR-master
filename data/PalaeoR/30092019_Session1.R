#Import tab delimited data#

GeoB8323_1 <- readr::read_delim
("E:/palaeoR-master/data/GeoB8323-1_pollen_analysis.tab",
                                skip = 75, delim = "\t")
#Represent as tibble#

GeoB8323_1

#View specs, will tell you if there are any errors with data#
readr::spec(GeoB8323_1)

#open up Excel spreadsheet/data set
library("readxl")
?read_excel

#Now name the data set as an object
Wkr_Pol_Per <- read_excel("E:/palaeoR-master/data/wonderkrater1982pollen.xls", 
                          sheet = 2, skip = 2, 
                          col_names = TRUE, col_types = NULL)

#Display tibble
Wkr_Pol_Per

#Load tidyverse package
#dplyr is part of tidyverse which is used here
#tidyr - useful functions: pivot_longer() takes a fat data set 
#and makes it a thin one#
#pivot_wider() is the opposite, mutate()
#nesting: object %>% group_by(x) %>% nest() %>% mutate()
