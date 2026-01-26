here::i_am(
  "code/01_clean_data.R"
)

#options(repos = c(CRAN = "https://cloud.r-project.org"))
library(readr)
library(tidyverse)
library(lubridate)
library(gt)
library(gtExtras)
library(ggplot2)
library(webshot2)


daily_data <- read.csv("./Data/ad_viz_plotval_data.csv")  


daily_data_ga <- daily_data %>%
  mutate(Month= as.numeric(substr(Date, 1, 2)))


Forest_Park <- daily_data_ga %>% 
  filter (Local.Site.Name == "Forest Park") %>% 
  group_by(Month) %>% 
  summarize(Month_Average = mean(Daily.Mean.PM2.5.Concentration))


Kennesaw <- daily_data_ga %>% 
  filter (Local.Site.Name == "Kennesaw") %>% 
  group_by(Month) %>% 
  summarize(Month_Average = mean(Daily.Mean.PM2.5.Concentration))


South_DeKalb <- daily_data_ga %>% 
  filter (Local.Site.Name == "South DeKalb") %>% 
  group_by(Month) %>% 
  summarize(Month_Average = mean(Daily.Mean.PM2.5.Concentration))


NR_285 <- daily_data_ga %>% 
  filter (Local.Site.Name == "NR-285")%>% 
  group_by(Month) %>% 
  summarize(Month_Average = mean(Daily.Mean.PM2.5.Concentration))


Fire_Station_8 <- daily_data_ga %>% 
  filter (Local.Site.Name == "Fire Station #8")%>% 
  group_by(Month) %>% 
  summarize(Month_Average = mean(Daily.Mean.PM2.5.Concentration))


United_Avenue <- daily_data_ga %>% 
  filter (Local.Site.Name == "United Avenue")%>% 
  group_by(Month) %>% 
  summarize(Month_Average = mean(Daily.Mean.PM2.5.Concentration))


NR_GA_Tech <- daily_data_ga %>% 
  filter (Local.Site.Name == "NR-GA Tech")%>% 
  group_by(Month) %>% 
  summarize(Month_Average = mean(Daily.Mean.PM2.5.Concentration))


Gwinnett <- daily_data_ga %>% 
  filter (Local.Site.Name == "Gwinnett")%>% 
  group_by(Month) %>% 
  summarize(Month_Average = mean(Daily.Mean.PM2.5.Concentration))


McDonough <- daily_data_ga %>% 
  filter (Local.Site.Name == "McDonough")%>% 
  group_by(Month) %>% 
  summarize(Month_Average = mean(Daily.Mean.PM2.5.Concentration))


all_sites <- bind_rows(
  Forest_Park    %>% mutate(Site = "Forest Park"),
  Kennesaw     %>% mutate(Site = "Kennesaw"),
  South_DeKalb    %>% mutate(Site = "South Dekalb"),
  NR_285  %>% mutate(Site = "NR-285"),
  Fire_Station_8    %>% mutate(Site = "Fire State #8"),
  United_Avenue    %>% mutate(Site = "United Avenue"),
  NR_GA_Tech %>% mutate(Site = "NR-GA Tech"),
  Gwinnett     %>% mutate(Site = "Gwinnett"),
  McDonough    %>% mutate(Site = "McDonough")
) %>%
  mutate(Month = as.integer(Month))


all_sites_12_months <- all_sites %>%
  group_by(Site) %>%
  complete(Month = 1:12) %>%
  ungroup()


Average_PM2.5 <- all_sites_12_months %>%
  pivot_wider(names_from = Site, values_from = Month_Average) %>%
  arrange(Month)


Fulton_data <- daily_data_ga %>%
  filter(Local.Site.Name %in% c("NR-GA Tech", "United Avenue")) 




