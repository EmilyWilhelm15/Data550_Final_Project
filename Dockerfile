FROM rocker/tidyverse:4.5.1 AS base 

#Create directory
RUN mkdir /home/rstudio/project

#Set directory
WORKDIR /home/rstudio/project

#make folders
RUN mkdir -p renv 
RUN mkdir ./code
RUN mkdir ./Data
RUN mkdir ./report

#Copy .Rprofile
COPY .Rprofile . 

#Copy renv files into renv folder
COPY renv.lock . 
COPY renv/activate.R renv 
COPY renv/settings.json renv 


#Copy other relevent files 
COPY Makefile . 
COPY code/ code/
COPY Data/ Data/
COPY Final_Project_Report.Rmd . 

#Place to store cached packages 
RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE=renv/.cache

#Restore project library 
RUN Rscript -e "renv::restore(prompt=FALSE)"

RUN apt-get update && apt-get install -y pandoc

CMD ["make"]
