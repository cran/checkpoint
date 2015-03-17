## ----, eval=FALSE--------------------------------------------------------
#  library(checkpoint)
#  checkpoint("2014-12-01")

## ----, eval=FALSE--------------------------------------------------------
#  library(checkpoint)
#  checkpoint("2014-12-01")
#  
#  library(MASS)
#  hist(islands)
#  truehist(islands)

## ----setup, include=FALSE------------------------------------------------

## Create temporary project and set working directory

example_project <- tempdir()

dir.create(example_project, recursive = TRUE)
unlink("~/.checkpoint/2014-12-01", recursive=TRUE)
oldwd <- getwd()
setwd(example_project)
oldRepos <- getOption("repos")
oldLibPaths <- .libPaths()


## Write dummy code file to project

example_code <- '
library(checkpoint)
checkpoint("2014-12-01")

library(MASS)
hist(islands)
truehist(islands)
'

cat(example_code, file="checkpoint_example_code.R")


## ----checkpoint----------------------------------------------------------
## Create a checkpoint by specifying a snapshot date

setwd(example_project)
library(checkpoint)
checkpoint("2014-12-01")

## ----inspect-1-----------------------------------------------------------
getOption("repos")

## ----inspect-2-----------------------------------------------------------
normalizePath(.libPaths(), winslash = "/")

## ----inspect-3-----------------------------------------------------------
installed.packages()[, "Package"]

## ----cleanup, include=FALSE----------------------------------------------
## cleanup

setwd(oldwd)
unlink(example_project, recursive = TRUE)
options(repos = oldRepos)
.libPaths(oldLibPaths)

