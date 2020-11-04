## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(read.cwa)

## -----------------------------------------------------------------------------
file = system.file("extdata", "ax3_testfile.cwa.gz", package = "read.cwa")

## -----------------------------------------------------------------------------
file = R.utils::gunzip(file, destname = tempfile(fileext = ".cwa"), 
                       remove = FALSE, overwrite = TRUE)

## -----------------------------------------------------------------------------
csv_file = convert_cwa(file, verbose = FALSE)
csv_file

## ---- include=FALSE-----------------------------------------------------------
file.remove(file.path(tempdir(), "ax3_testfile.cwa"))

## -----------------------------------------------------------------------------
readLines(csv_file$file, 3)

## -----------------------------------------------------------------------------
df = read_cwa_csv(csv_file$file)
head(df)

## ---- include=FALSE-----------------------------------------------------------
file.remove(file.path(tempdir(), "ax3_testfile.cwa"))

## -----------------------------------------------------------------------------
attr(df, "header")

## -----------------------------------------------------------------------------
out = read_cwa(file, verbose = FALSE)
out

## ---- include=FALSE-----------------------------------------------------------
file.remove(file.path(tempdir(), "ax3_testfile.cwa"))

## -----------------------------------------------------------------------------
diffs = as.numeric(diff(out$data$time))
diffs = as.numeric(names(which.max(table(diffs))))
estimated_freq = round(1/diffs, 3)
estimated_freq

## -----------------------------------------------------------------------------
out$header$frequency

## -----------------------------------------------------------------------------
out = read_cwa(file, xyz_only = FALSE, verbose = FALSE)
out$data

## ---- include=FALSE-----------------------------------------------------------
file.remove(file.path(tempdir(), "ax3_testfile.cwa"))

## -----------------------------------------------------------------------------
colnames(out$data)

