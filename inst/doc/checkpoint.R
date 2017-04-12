## ----setup, include=FALSE------------------------------------------------

## Create temporary project and set working directory

example_project <- tempdir()

dir.create(example_project, recursive = TRUE, showWarnings = FALSE)
oldRepos <- getOption("repos")
oldLibPaths <- .libPaths()


## Write dummy code file to project

example_code <- '
library(checkpoint)
checkpoint("2015-04-26", checkpointLocation = tempdir())

library(MASS)
hist(islands)
truehist(islands)
'

cat(example_code, file = file.path(example_project, "checkpoint_example_code.R"))


## ----checkpoint, warning=FALSE-------------------------------------------
## Create a folder to contain the checkpoint
## This is optional - the default is to use ~/.checkpoint

dir.create(file.path(tempdir(), ".checkpoint"), recursive = TRUE)

## Create a checkpoint by specifying a snapshot date

library(checkpoint)
checkpoint("2017-04-01", project = example_project, checkpointLocation = tempdir())

## ----inspect-1-----------------------------------------------------------
getOption("repos")

## ----inspect-2-----------------------------------------------------------
normalizePath(.libPaths(), winslash = "/")

## ----inspect-3, eval=FALSE-----------------------------------------------
#  installed.packages(.libPaths()[1])[, "Package"]

## ----cleanup, include=FALSE----------------------------------------------
## cleanup

unlink(example_project, recursive = TRUE)
unlink(file.path(tempdir(), "checkpoint_example_code.R"))
unlink(file.path(tempdir(), ".checkpoint"), recursive = TRUE)
options(repos = oldRepos)
unCheckpoint()

