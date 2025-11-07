report.html: Report2.Rmd code/02_render_report.R PMdata
	Rscript code/02_render_report.R

PMdata:
	Rscript code/01_make_output.R