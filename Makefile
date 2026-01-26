# Build everything by default
all: Report2.html

# Final report depends on table, boxplot, and Rmd
Report2.html: output/Average_PM2.5.rds \
							output/Fulton_data.rds \
							output/Average_table.png \
							output/fulton_boxplot.png
		Rscript -e "rmarkdown::render('Report2.Rmd')"

	
# Table depends on the CSV file, cleaning data code, and table code
output/Average_table.png: data/ad_vix_plotval_data.csv \
                          code/01_clean_data.R \
                          code/02_make_table.R
                          
	Rscript code/02_make_table.R

# Boxplot depends on CSV file, cleaning data, and boxplot code 
output/Fulton_boxplot.png: data/ad_vix_plotval_data.csv \
													 code/01_clean_data.R \
													 code/03_make_table.R 
	
	
#Restores package library
.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"