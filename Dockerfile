# Use a base image from the Rocker project 
FROM rocker/tidyverse:4.4.3

WORKDIR /project
COPY . /project

# Pre-install dependencies in image
RUN  Rscript scripts/00_install_packages.R

# This is the default command
CMD ["Rscript", "run.R"]
