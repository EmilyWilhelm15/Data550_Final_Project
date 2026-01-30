FROM rocker/tidyverse:4.5.1 

#Create directory
RUN mkdir -p /home/rstudio/project

#Set directory
WORKDIR /home/rstudio/project

#install packages

USER root

RUN apt-get update && apt-get install -y pandoc \
  && rm -rf /var/lib/apt/lists/*


#make folders
RUN mkdir -p renv 

#Copy .Rprofile
COPY .Rprofile . 

#Copy renv files into renv folder
COPY renv.lock . 
COPY renv/activate.R renv 
COPY renv/settings.json renv 


#Place to store cached packages 
RUN mkdir -p renv/.cache
ENV RENV_PATHS_CACHE=renv/.cache

#Restore project library 
RUN Rscript -e "renv::restore(prompt=FALSE)"

#Copy other relevent files 
COPY Makefile . 
COPY code/ code/
COPY Data/ Data/
COPY Final_Project_Report.Rmd . 

CMD ["make"]
