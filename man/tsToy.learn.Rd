% File man/tsToy.learn.Rd
% This file is part of the sisal package for R.
% Copyright (C) 2015 Aalto University
% Distributed under GPL 2 or later

\encoding{UTF-8}
\name{tsToy.learn}
\alias{tsToy.learn}
\docType{data}
\title{
  Toy Time Series Data for \acronym{SISAL} (Learning Set)
}
\description{
  Numeric vector with autoregressive (\acronym{AR}) time series data
}
\usage{tsToy.learn}
\format{
  The format is:\preformatted{
 num [1:1000] 0.7529 -0.2576 0.441 0.8473 0.0164 ...}
}
\details{

  This is the learning set of the toy time series data, i.e. the first
  1000 of the total 3000 observations.

  The data follow a second order \acronym{AR} model.  The first order
  coefficient is \code{-0.5} and the second order coefficient
  \code{0.3}.  The autocovariances for lags \code{0} to \code{4} are
  \code{c(1.0, -0.71, 0.66, -0.54, 0.47)} (theoretical values, two
  significant digits).

  Use \code{file.show(system.file("toyDataSrc", "sisalToyTs.R",
  package="sisal"))} to view the script that generated the data.

}
\seealso{
  \code{\link{tsToy.test}}, \code{\link{testSisal}}
}
\examples{
library(graphics)
library(stats)
plot(tsToy.learn)
acf(tsToy.learn)
}
\keyword{datasets}
