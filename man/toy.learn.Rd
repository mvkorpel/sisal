% File man/toy.learn.Rd
% This file is part of the sisal package for R.
% Copyright (C) 2015 Aalto University
% Distributed under GPL 2 or later

\encoding{UTF-8}
\name{toy.learn}
\alias{toy.learn}
\docType{data}
\title{
  Toy Data for \acronym{SISAL} (Learning Set)
}
\description{
  Numeric matrix with independent and dependent variables and noise
}
\usage{toy.learn}
\format{
  The format is:\preformatted{
 num [1:1000, 1:12] -0.62067 1.36985 0.00122 0.75527 -1.82271 ...
 - attr(*, "dimnames")=List of 2
  ..$ : NULL
  ..$ : chr [1:12] "y" "noise" "X1" "X2" ...}
}
\details{

  This is the learning set of the toy data, i.e. 1000 rows of the whole
  1500 row dataset.

  Columns \code{"X1"}, \code{"X2"}, \ldots, \code{"X10"} were generated
  with \code{\link{rnorm}} to follow a standard normal distribution.

  Column \code{"y"} is a linear combination of \code{"X1"}, \code{"X2"},
  \code{"X3"}, coefficients \code{(1:3)/sqrt(sum((1:3)^2))}, yielding a
  theoretical standard normal distribution.

  Column \code{"noise"} was also generated from the standard normal
  distribution.

  Use \code{file.show(system.file("toyDataSrc", "sisalToy.R",
  package="sisal"))} to view the script that generated the data.

}
\seealso{
  \code{\link{toy.test}}, \code{\link{testSisal}}
}
\examples{
library(graphics)
plot(as.data.frame(toy.learn))
}
\keyword{datasets}
