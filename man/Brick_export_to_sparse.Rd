% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Brick_functions.R
\name{Brick_export_to_sparse}
\alias{Brick_export_to_sparse}
\title{Export an entire resolution from a given BrickContainer}
\usage{
Brick_export_to_sparse(Brick, out_file, remove_file = FALSE, resolution,
  sep = " ")
}
\arguments{
\item{Brick}{\strong{Required}.
A string specifying the path to the Brick store created with
Create_many_Brick.}

\item{out_file}{Path to the output file to write.}

\item{remove_file}{Default FALSE. If a file by the same name is present
that file will be removed.}

\item{resolution}{\strong{Optional}. Default NA
When an object of class BrickContainer is provided, resolution defines the
resolution on which the function is executed}
}
\description{
\code{Brick_export_to_sparse} will accept as input an object of class
BrickContainer, a string of length 1 as resolution and a path specifying
the output file to write.
}
\details{
These metadata columns are:
\itemize{
\item chr1_bin_coverage: Percentage of rows containing non-zero values
\item chr2_bin_coverage: Percentage of columns containing non-zero values
\item chr1_row_sums: Total signal (if normalised) or number of reads
(if counts) in each row.
\item chr2_col_sums: Total signal (if normalised) or number of reads
(if counts) in each column.
}
}
\examples{

Bintable.path <- system.file(file.path("extdata", "Bintable_100kb.bins"), 
package = "HiCBricks")

out_dir <- file.path(tempdir(), "write_file")
dir.create(out_dir)

My_BrickContainer <- Create_many_Bricks(BinTable = Bintable.path, 
  bin_delim = " ", output_directory = out_dir, file_prefix = "Test",
  experiment_name = "Vignette Test", resolution = 100000,
  remove_existing = TRUE)

Matrix_file <- system.file(file.path("extdata", 
"Sexton2012_yaffetanay_CisTrans_100000_corrected_chr2L.txt.gz"), 
package = "HiCBricks")

Brick_load_matrix(Brick = My_BrickContainer, chr1 = "chr2L", 
chr2 = "chr2L", matrix_file = Matrix_file, delim = " ", 
remove_prior = TRUE, resolution = 100000)

Brick_export_to_sparse(Brick = My_BrickContainer, 
out_file = file.path(out_dir, "example_out.txt"), 
resolution = 100000)

}