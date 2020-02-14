% File man/toy.test.Rd
% This file is part of the sisal package for R.
% Copyright (C) 2015 Aalto University
% Distributed under GPL 2 or later

\encoding{UTF-8}
\name{toy.test}
\alias{toy.test}
\docType{data}
\title{
  Toy Data for \acronym{SISAL} (Test Set)
}
\description{
  Numeric matrix with independent and dependent variables and noise
}
\usage{toy.test}
\format{
  The format is:\preformatted{
 num [1:500, 1:12] -0.543 -0.881 0.115 0.461 -0.173 ...
 - attr(*, "dimnames")=List of 2
  ..$ : NULL
  ..$ : chr [1:12] "y" "noise" "X1" "X2" ...}
}
\details{

  This is the test set of the toy data, i.e. 500 rows of the whole 1500
  row dataset.

  For other details, see \code{\link{toy.learn}}.

}
\seealso{
  \code{\link{toy.learn}}, \code{\link{bootMSE}}
}
\examples{
library(graphics)
plot(as.data.frame(toy.test))
}
\keyword{datasets}
