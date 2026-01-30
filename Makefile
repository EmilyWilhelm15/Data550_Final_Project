#Build everything by default
all: report/Final_Project_Report.html

output:
	mkdir -p output

report:
	mkdir -p report

#RDS outputs depend on the CSV file and 01_clean_data.R
output/Average_PM2.5.rds output/Fulton_data.rds: Data/ad_viz_plotval_data.csv code/01_clean_data.R | output 
	Rscript code/01_clean_data.R

#Table depends on the RDS and table code
output/Table.rds: output/Average_PM2.5.rds code/01_clean_data.R code/02_make_table.R | output 
	Rscript code/02_make_table.R

#Boxplot depends on the RDS and boxplot code
output/Boxplot.rds: output/Fulton_data.rds code/03_make_boxplot.R | output 
	Rscript code/03_make_boxplot.R		
	
#Final report depends on table, boxplot, and Rmd
report/Final_Project_Report.html: output/Table.rds \
													output/Boxplot.rds \
													Final_Project_Report.Rmd | report
	Rscript -e "rmarkdown::render('Final_Project_Report.Rmd', output_file='Final_Project_Report.html', output_dir='report')"
		

#Restore the package library
.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"
	
.PHONY: clean
clean:
	rm -f output/*.rds output/*.png report/*.html *.html 
	
#Build Image rules to run on local machine
.PHONY: build_image
build_image:
	docker build -t final_report .
	
#Instructions to run report (docker) for Macs 
.PHONY: docker-run-report-mac
docker-run-report-mac:
	docker run -v "$$(pwd)/report":/home/rstudio/project/report \
	  emilywilhelm/final_report
	
#Instructions to run report (docker) for Windows 
.PHONY: docker-run-report-win
docker-run-report-win:	
	docker run -v "/$$(pwd)/report":/home/rstudio/project/report \
		emilywilhelm/final_report
	