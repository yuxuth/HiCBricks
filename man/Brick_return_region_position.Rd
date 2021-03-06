% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Brick_functions.R
\name{Brick_return_region_position}
\alias{Brick_return_region_position}
\title{Provides the overlapping position (within) from the bintable.}
\usage{
Brick_return_region_position(Brick, region, resolution = NA)
}
\arguments{
\item{Brick}{\strong{Required}.
A string specifying the path to the Brick store created with
Create_many_Brick.}

\item{region}{\strong{Required}.
A character vector of length 1 specifying the region to overlap. It must
take the form chr:start:end.}

\item{resolution}{\strong{Optional}. Default NA
When an object of class BrickContainer is provided, resolution defines the
resolution on which the function is executed}
}
\value{
Returns a 1 dimensional vector containing the position of the
overlapping regions in the bintable associated the Brick store.
}
\description{
\code{Brick_return_region_position} takes as input a human-readable coordinate
format of the form chr:start:end and outputs the overlapping bintable
positions. This module does a "within" operation. So only bins which overlap
completely with the region will be returned. This is not an iterable module,
so the user has to make iterative calls to the module itself.
}
\section{Design choice}{

This may seem to be a poor design choice at first glance, but I do not
think this to be the case. By not being iterable, this function circumvents
the problem of how to structure the data for the user. If one more element
was accepted, the return object would have become a list, which increases
the data structure complexity significantly for users who are just starting
out with R. Therefore this problem is left for the users themselves to
deal with.
}

\examples{

Bintable.path <- system.file(file.path("extdata", "Bintable_100kb.bins"),
package = "HiCBricks")

out_dir <- file.path(tempdir(), "region_position_test")
dir.create(out_dir)

My_BrickContainer <- Create_many_Bricks(BinTable = Bintable.path, 
    bin_delim = " ", output_directory = out_dir, file_prefix = "Test",
    experiment_name = "Vignette Test", resolution = 100000,
    remove_existing = TRUE)

Coordinate <- "chr2L:1:1000000"

Test_Run <- Brick_return_region_position(Brick = My_BrickContainer,
region = Coordinate, resolution = 100000)

}
