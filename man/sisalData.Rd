% File man/sisalData.Rd
% This file is part of the sisal package for R.
% Copyright (C) 2015 Aalto University
% Distributed under GPL 2 or later

\encoding{UTF-8}
\name{sisalData}
\alias{sisalData}
\title{
  Download External Datasets for \acronym{SISAL}
}
\description{
  Loads external datasets for testing with \acronym{SISAL}. Choices are
  laser generated data and Poland electricity load data.
}
\usage{
sisalData(dataset = c("poland", "laser", "laser.cont"), verify = TRUE)
}
\arguments{

  \item{dataset}{ A \code{character} string: \code{"poland"} (default),
    \code{"laser"} or \code{"laser.cont"} (see \sQuote{Note}).  }

  \item{verify}{ A \code{logical} flag.  If \code{TRUE}, verifies the
    integrity of the downloaded data by computing a checksum and
    comparing it to a pre-computed value. }

}
\details{
  The laser generated data come in two parts, \code{"laser"} and
  \code{"laser.cont"}.  The Poland electricity load data is also divided
  in two parts, but they are both returned with \code{dataset="poland"}.

  This function requires an Internet connection.  The download may fail
  due to a problem such as the remote server being unavailable.
}
\note{
  Checked on 2020-02-14, the Santa Fe datasets are no longer available
  at their previous location. Attempting to download them with this
  function will result in an error.
}
\value{

  With option \code{\var{dataset}="laser"}, returns an \code{integer}
  \code{vector} of \code{length} 1000.

  With option \code{\var{dataset}="laser.cont"}, returns an
  \code{integer} \code{vector} of \code{length} 9093.

  With option \code{\var{dataset}="poland"}, returns a list with two
  \code{numeric} vectors: \item{learn}{1400 values} \item{test}{201
  values}

}
\references{

  The Santa Fe Time Series Competition Data / Data Set A: Laser
  generated data. Availability unknown (2020-02-14).

  Environmental and Industrial Machine Learning Group / Datasets /
  Poland Electricity
  Load. \url{https://research.cs.aalto.fi/aml/datasets.shtml}.
  \acronym{URL} accessed on 2024-10-25.

}
\author{
  Mikko Korpela
}

\seealso{
  \code{\link{testSisal}}
}
\examples{\dontrun{
foo <- sisalData("poland")
length(foo$learn) # 1400
length(foo$test)  # 201}
}
\keyword{utilities}
