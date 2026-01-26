library(here)
library(tidyverse)

here::i_am("code/03_make_boxplot.R")

dir.create(here::here("output"), recursive = TRUE)

Fulton_data <- readRDS(
  file = here::here("output/RDS/Fulton_data.rds")
)

fulton_boxplot <- ggplot(Fulton_data, aes(x = Local.Site.Name, y = Daily.Mean.PM2.5.Concentration, fill = Local.Site.Name)) +
  geom_boxplot() + 
  facet_wrap(~Month) +
  labs(
    title = "Daily PM2.5 Each Month",
    x = NULL, 
    y = "Daily PM2.5 (µg/m³)",
    fill = "Local.Site.Name"
  ) +
  theme(
    axis.text.x = element_blank())

ggsave(here::here("output/fulton_boxplot.png"), plot = fulton_boxplot)