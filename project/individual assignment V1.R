install.packages("tidyverse")
install.packages("gapminder")
install.packages("ggplot2")
install.packages("maps")
install.packages("plotly")
install.packages("dplyr")

library(tidyverse)
library(gapminder)
library(ggplot2)
library(maps)
library(plotly)
library(dplyr)

data_join <- full_join(unicef_metadataV2, unicef_indicator_1V2, by = c("year" = "time_period", "country" = "country"))

data_join <- unicef_metadataV2 %>%
  full_join(unicef_indicator_1V2, by = c("country", "year" = "time_period"))

CARTE     OK

world_map <- map_data("world")

map_data_join <- full_join(data_join, world_map, by = c("country" = "region"))

map_data_join_2021 <- map_data_join %>%
  filter(year == 2021)

ggplot(map_data_join_2021, aes(x = long, y = lat, group = group, fill = obs_value)) +
  geom_polygon(color = "black") +
  scale_fill_gradient(low = "yellow", high = "red", na.value = "grey", name = "Open Defecation Proportion") +
  labs(title = "Proportion of Open Defecation by Country in 2021") +
  theme_minimal()

GRAPH OP DEF/YEARS     OK

ggplot(unicef_indicator_1V2, aes(x = time_period, y = obs_value, fill = "orange")) +
  geom_bar(stat = "identity") +
  labs(title = "Proportion of People Practicing Open Defecation Over Time",
       x = "Years",
       y = "Open defecation proportion",
       fill = "") +
  theme_minimal()

Graph life expect/years   OK

ggplot(unicef_metadataV2, aes(x = year, y = Life_Expectancy, fill = "Life Expectancy")) +
  geom_bar(stat = "identity") +
  labs(title = "Evolution of the Life Expectancy Over Time",
       x = "Years",
       y = "Value",
       fill = "Life Expectancy") + 
  scale_fill_manual(values = "blue") +
  theme_minimal()


Graph GDP/year OK

ggplot(unicef_metadataV2, aes(x = year, y = GDP, fill = "GDP")) +
  geom_bar(stat = "identity") +
  labs(title = "Evolution of the GDP Over Time",
       x = "Years",
       y = "Value",
       fill = "GDP") + 
  scale_fill_manual(values = "blue") +
  theme_minimal()

