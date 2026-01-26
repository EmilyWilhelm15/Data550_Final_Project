library(here)
library(tidyverse)
library(gt)
library(gtExtras)

here::i_am("code/02_make_table.R")

dir.create(here::here("output"), recursive = TRUE)

Average_PM2.5 <- readRDS(
  file = here::here("output/RDS/Average_PM2.5.rds"))

Average_table <- Average_PM2.5 %>% 
  gt() %>% 
  fmt_number(
    columns = -Month,  
    decimals = 2) %>% 
  gt_theme_pff()

gt::gtsave(
  data = Average_table,
  filename = here::here("output", "Average_table.png")
)

