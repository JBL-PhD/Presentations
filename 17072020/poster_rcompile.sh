#!/usr/bin/Rscript --vanilla --default-packages=base,stats,utils

args = commandArgs(trailingOnly=TRUE)
if (length(args) != 1) {
       stop("At least one argument must be supplied (input file).n", call.=FALSE)
}

library(knitr)
library(rmarkdown)
library(plantuml)
library(posterdown)
library(pagedown)
library(magick)
file <- args[1] #list.files(pattern='.Rmd')
# rmarkdown::render(file)
pagedown::chrome_print(file)
