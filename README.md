## Data 
- **File:** `data/ad_vix_plotval_data.csv`
- This dataset includes air quality data that was collected every three days in Atlanta, GA throughout the year 2024, starting on 01/01/2024. The air pollution data was sourced from the EPA's Air Quality System. There are a total of 9 air quality monitoring sites in Atlanta which collect PM2.5 data. The some of the variables that comprise the dataset are the `Date`, the daily mean PM2.5 concentrations (ug/m3 LC) - `Daily.Mean.PM2.5.Concentrations`, the daily air qualtiy index (AQI) value - `Daily.AQI.Value`, air monitor site ID - `Site.ID`, site name - `Local.Site.Name`, and `County`. 

## Outputs: 
- **Table:** `output/Average_table.png`
   - Monthly Average PM2.5 (µg/m³) For Each Air Monitoring Site Location (2024). 
- **Boxplot:** `output/fulton_boxplot.png`
   - Comparing daily mean PM2.5 (µg/m³) ranges each month between two Fulton 
   - County air monitoring sites using box plots.
- **Report:** `Final_Project_Report.html`

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

## Ways to to Render the Report
### Render using Make:
The first `make` rule in the makefile will generate the .html report. This report uses `renv` to ensure R uses the same package versions. 
1. Run `make install` in your terminal before rendering the report to restore the package library.
  - If renv is not already installed: 
    - install.packages('renv') 
    - renv::restore() 
2. Run `make` in the terminal to render the report
   - `make clean` will delete the generated `.rds`, `.png`, and `.html` files
3. More make commands are located in the Makefile

### Build the Docker Image locally:
`docker build -t emilywilhelm/final_report:latest . ` 

### Pre-Built Dockerhub Image:
1. The publicly available image on docker hub can be found here: 
  - https://hub.docker.com/repository/docker/emilywilhelm/final_report/general 
  - image name: `emilywilhelm/final_report:latest`
2. Pull the image: 
`docker pull emilywilhelm/final_report:latest

### Manual Docker Run: 
For Macs or Linux: 
docker run -v "$$(pwd)/report":/home/rstudio/project/report emilywilhelm/final_report

For Windows: 
docker run -v "/$$(pwd)/report":/home/rstudio/project/report emilywilhelm/final_report







  