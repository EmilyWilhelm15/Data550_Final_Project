here::i_am("code/render_report.R")

library(rmarkdown)

render(
  "Final_Project_Report.Rmd",
  output_file = "Final_Project_Report.html"
)