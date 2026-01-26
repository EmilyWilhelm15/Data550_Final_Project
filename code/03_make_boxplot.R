library(here)
here::i_am("code/03_make_boxplot.R")

source(here("code", "01_clean_data.R"))

fulton_boxplot <- ggplot(Fulton_data, aes(x = Local.Site.Name, y = Daily.Mean.PM2.5.Concentration, fill = Local.Site.Name)) +
  geom_boxplot() + 
  facet_wrap(~Month) +
  labs(
    title = "Comparing Daily PM2.5 Range each Month Between Two Fulton County Air Monitoring Locations",
    x = "Month", 
    y = "Daily PM2.5 (µg/m³)",
    fill = "Local.Site.Name"
  ) +
  theme(
    axis.text.x = element_blank())

ggsave(here::here("output/fulton_boxplot.png"), plot = fulton_boxplot)