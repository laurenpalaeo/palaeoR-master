library(tidyverse)
library("readxl")
Wkr <- read_excel("E:/palaeoR-master/data/wonderkrater1982pollen.xls", 
                                 sheet = 2, skip = 2, 
                                 col_names = TRUE, col_types = NULL)
Wkr
Wkr2 <- Wkr %>% pivot_longer(-`Cal yr BP`, names_to = "species", 
             values_to = "percentage") %>% 
  group_by(`Cal yr BP`)  %>%
  mutate(New_Perc = percentage/sum(percentage)*100) %>% 
  group_by(species) %>% 
  filter(max(New_Perc) > 5) %>% 
  select(-percentage) %>% 
  pivot_wider(names_from = "species", values_from = "New_Perc")
Wkr2
