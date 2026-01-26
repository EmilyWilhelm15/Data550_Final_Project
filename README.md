## Data 
- **File:** `data/ad_vix_plotval_data.csv`

## Outputs: 
- **Table:** `output/Average_table.png`
   - Monthly Average PM2.5 (µg/m³) For Each Air Monitoring Site Location (2024). 
- **Boxplot:** `output/fulton_boxplot.png`
   - Comparing daily mean PM2.5 (µg/m³) ranges each month between two Fulton 
   - County air monitoring sites using box plots.
- **Report:** `Report2.html`

## Code description
- `code/01_clean_data.R`
  - Loads packages, reads CSV, cleans data
  - Saves data as `Average_PM2.5.rds` and `Fulton_data.rds` in /output/RDS folder
- `code/02_make_table.R`
  - Reads in the monthly average PM2.5 data from `Average_PM2.5.rds`
  - Creates `Average_table.png`
  - Saves the figure in the /output folder
- `code/03_make_boxplot.R`  
  - Reads in the Fulton County data from `Fulton_data.rds`
  - Creates `fulton_boxplot.png`
  - Saves the figure in the /output folder
- `code/render_report.R`
  - Renders `Final_Project_Report.Rmd`, creating the `Final_Project_Report.html`  

## How to Render the Report
The first `make` rule in the makefile will generate the .html report. This report uses `renv` to ensure R uses the same package versions. 
1. Run `make install` in your terminal before rendering the report to restore the package library.
  - If renv is not already installed: 
    - install.packages('renv') 
    - renv::restore() 
2. Run `make` in the terminal to render the report
   - `make clean` will delete the generated `.rds`, `.png`, and `.html` files





  