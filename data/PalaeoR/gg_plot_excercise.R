library("tidyverse")

Wkr3 <- readxl::read_xls("data/wonderkrater1982pollen.xls", sheet = 'Wkr B3 Pollen Percentages', skip = 2)

g <- ggplot(Wkr3, aes(x = `Cal yr BP`, y = PROTEACEAE)) +
geom_area() +
labs(x = "Cal Yr BP") +
theme_classic()
g
g + coord_flip()

Wkr4 <- Wkr3 %>% pivot_longer(-`Cal yr BP`, names_to = "species", values_to = "Percentages") %>% 
  group_by(`species`) %>% 
  filter(max(Percentages) > 10)
Wkr4

g2 <- ggplot(Wkr4, aes(x = `Cal yr BP`, y = Percentages)) +
  geom_area() +
  labs(x = "Cal Yr BP", y = "Percent") +
  theme_classic() + 
  coord_flip() +
  facet_wrap(~ species) 

g2

