# Build everything by default
all: Final_Project_Report.html

# Final report depends on table, boxplot, and Rmd
Final_Project_Report.html: output/Average_table.png \
							output/fulton_boxplot.png
		Rscript -e "rmarkdown::render('Final_Project_Report.Rmd')"

	
# Table depends on the CSV file, cleaning data code, and table code
output/Average_table.png: Data/ad_viz_plotval_data.csv \
                          code/01_clean_data.R \
                          code/02_make_table.R
	Rscript code/02_make_table.R

# Boxplot depends on CSV file, cleaning data, and boxplot code 
output/Fulton_boxplot.png: Data/ad_viz_plotval_data.csv \
													 code/01_clean_data.R \
													 code/03_make_boxplot.R 
		Rscript code/03_make_boxplot.R											 
		

#Restores package library
.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"