% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Brick_functions.R
\name{Brick_mcool_normalisation_exists}
\alias{Brick_mcool_normalisation_exists}
\title{Check if a normalisation exists in an mcool file.}
\usage{
Brick_mcool_normalisation_exists(mcool, norm_factor = NULL, resolution = NULL)
}
\arguments{
\item{mcool}{\strong{Required}. Path to an mcool file.}

\item{norm_factor}{\strong{Required}.
The normalization factor to use for normalization from an mcool file.
norm_factor currently accepts one of "Iterative-Correction", "Knight-Ruitz",
"Vanilla-coverage", "Vanilla-coverage-square-root".}

\item{resolution}{\strong{Optional}. Default NA
When an object of class BrickContainer is provided, resolution defines the
resolution on which the function is executed}
}
\value{
A boolean vector of length 1
}
\description{
\code{Brick_mcool_normalisation_exists} checks if a particular normalisation
exists in an mcool file.
}
\examples{

\dontrun{

require(curl)
out_dir <- file.path(tempdir(), "mcool_test_dir")
dir.create(path = out_dir)
curl_download(url = paste("https://data.4dnucleome.org/",
"files-processed/4DNFI7JNCNFB/",
"@download/4DNFI7JNCNFB.mcool", sep = ""),
destfile = file.path(out_dir, "H1-hESC-HiC-4DNFI7JNCNFB.mcool"))

mcool <- file.path(out_dir, "H1-hESC-HiC-4DNFI7JNCNFB.mcool")
Brick_mcool_normalisation_exists(mcool = mcool,
norm_factor = "Iterative-Correction",
resolution = 50000)

}

}
