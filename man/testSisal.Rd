% File man/testSisal.Rd
% This file is part of the sisal package for R.
% Copyright (C) 2015 Aalto University
% Distributed under GPL 2 or later

\encoding{UTF-8}
\name{testSisal}
\alias{testSisal}
\title{
  Testing the Sequential Input Selection Algorithm
}
\description{
  Tests \code{\link{sisal}} with example datasets or time series data.
  The function uses the training part of an example dataset or
  user-supplied numeric data interpreted as a time series.
}
\usage{
testSisal(dataset = c("tsToy", "laser", "poland", "toy"), nData = Inf,
          FUN = "sisal", lags = NULL, stepsAhead = 1,
          noiseSd = 0.2, verbose = 1, \dots)
}
\arguments{

  \item{dataset}{ the dataset to use.  A \code{numeric} \code{vector}
    containing time series data or one of \code{"tsToy"} (the default),
    \code{"laser"}, \code{"poland"} and \code{"toy"}.  }

  \item{nData}{ a \code{numeric} value containing the number of
    observations to use.  If larger than the number of observations in
    the dataset, all of the data will be used (the default). }

  \item{FUN}{ which function to call.  By default, acts as a front end
    to \code{\link{sisal}}.  This can be any function that accepts
    arguments named \code{"X"}, \code{"y"} and \code{"verbose"}.  See
    \code{\link{match.fun}} for legal values. }

  \item{lags}{ a \code{numeric} or \code{integer} \code{vector}.  When
    using time series data (\code{\var{dataset}} is \code{numeric},
    \code{"laser"}, \code{"poland"} or \code{"tsToy"}), the function
    creates lagged versions of the time series to be used as input
    variables in \code{\link{sisal}}.  The lags are specified here.
    These are non-negative integral values where 0 means the latest
    observation, 1 is the previous observation etc.  The default values
    for \code{"laser"}, \code{"poland"} and \code{"tsToy"} are
    \code{0:19}, \code{0:14} and \code{0:9}, respectively. }

  \item{stepsAhead}{ an integral value specifying how many steps ahead
    to predict in a time series setting.  The default is 1. }

  \item{noiseSd}{ standard deviation of noise to be used with the
    \code{"toy"} \code{\var{dataset}}.  The base noise is always the
    same (stored with the dataset) and only scaled to match this
    setting. }

  \item{verbose}{ a \code{numeric} or \code{integer} verbosity level.
    This function only has two verbosity levels (0 and larger than 0),
    but the value is also propagated to \code{\var{FUN}}. }

  \item{\dots}{ arguments passed to \code{\var{FUN}}.  }

}
\details{
  The function recognizes if a \code{numeric} \code{\var{dataset}}
  is the \code{"laser"} or \code{"poland"} dataset.  In case repeated
  experiments will be performed on those datasets, it is best to explicitly
  fetch them with \code{\link{sisalData}} before using this function.
  Doing so reduces the amount of network traffic and makes offline work
  possible.
}
\value{
  The value returned by function \code{\var{FUN}}, when called with the
  given \code{\var{dataset}} (processed by this function) and
  parameters.  See the help page of the relevant function,
  e.g. \code{\link{sisal}}.
}
\author{
  Mikko Korpela
}
\seealso{

  See \code{\link{sisalData}}, \code{\link{toy.learn}} and
  \code{\link{tsToy.learn}} for documentation on the datasets.

  The performance of the models returned by this functions can be
  evaluated using \code{\link{bootMSE}}, which uses a separate test part
  of the dataset.

}
\examples{
foo <- testSisal(dataset="toy", hbranches=2, max.width=2, Mtimes=5,
                 use.ridge=TRUE)
print(foo)
names(foo)
}
\keyword{utilities}
