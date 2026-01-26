library(here)
here::i_am("code/02_make_table.R")

source(here("code", "01_clean_data.R"))

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

