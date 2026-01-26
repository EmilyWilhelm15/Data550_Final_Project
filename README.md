## Data 
- **File:** `data/ad_vix_plotval_data.csv`

## Outputs: 
- **Table:** `output/Average_table.png`
   - Monthly Average PM2.5 (µg/m³) For Each Air Monitoring Site Location (2024). 
- **Boxplot:** `output/fulton_boxplot.png`
   - Comparing daily mean PM2.5 (µg/m³) ranges each month between two Fulton 
   - County air monitoring sites using box plots.
- **Report:** `Report2.html`

## Initial code description
- `code/01_clean_data.R`
  - Loads packages, reads CSV, summarizes each monitoring site location by month
  
- `code/02_make_table.R`
  - Creates Average_table.png
  - Saves to output folder

- `code/03_make_boxplot.R`  
  - Creates fulton_boxplot.png
  - Saves to output folder

- `Report2.Rmd`
  - Renders the report. 

## Generating Report
- The first make rule in the makefile will generate the .html report. 
- Typing 'make' in the terminal will achieve this.

## 



  