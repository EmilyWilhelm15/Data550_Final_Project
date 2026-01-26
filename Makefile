#Build everything by default
all: Final_Project_Report.html

#RDS outputs depend on the CSV file and 01_clean_data.R
output/RDS/Average_PM2.5.rds output/RDS/Fulton_data.rds:Data/ad_viz_plotval_data.csv code/01_clean_data.R
	Rscript code/01_clean_data.R

#Table depends on the RDS and table code
output/Average_table.png: output/RDS/Average_PM2.5.rds code/01_clean_data.R code/02_make_table.R
	Rscript code/02_make_table.R

#Boxplot depends on the RDS and boxplot code
output/fulton_boxplot.png: output/RDS/fulton_data.rds code/03_make_boxplot.R 
	Rscript code/03_make_boxplot.R		
	
#Final report depends on table, boxplot, and Rmd
Final_Project_Report.html: output/Average_table.png \
													output/fulton_boxplot.png \
													Final_Project_Report.Rmd
	Rscript -e "rmarkdown::render('Final_Project_Report.Rmd')"
		

#Restore the package library
.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"
	
.PHONY: clean
clean:
	rm -f output/RDS/*.rds output/*.png *.html 
	
	