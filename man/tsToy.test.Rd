% File man/tsToy.test.Rd
% This file is part of the sisal package for R.
% Copyright (C) 2015 Aalto University
% Distributed under GPL 2 or later

\encoding{UTF-8}
\name{tsToy.test}
\alias{tsToy.test}
\docType{data}
\title{
  Toy Time Series Data for \acronym{SISAL} (Test Set)
}
\description{
  Numeric vector with autoregressive (\acronym{AR}) time series data
}
\usage{tsToy.test}
\format{
  The format is:\preformatted{
 num [1:2000] 0.583 -0.71 -1.172 1.067 -0.719 ...}
}
\details{

  This is the test set of the toy time series data, i.e. the last 2000
  of the total 3000 observations.

  The data follow a second order \acronym{AR} model.  The first order
  coefficient is \code{-0.5} and the second order coefficient
  \code{0.3}.

  Use \code{file.show(system.file("toyDataSrc", "sisalToyTs.R",
  package="sisal"))} to view the script that generated the data.

}
\seealso{
  \code{\link{tsToy.learn}}, \code{\link{bootMSE}}
}
\examples{
library(graphics)
library(stats)
plot(tsToy.test)
acf(tsToy.test, type="partial")
}
\keyword{datasets}
