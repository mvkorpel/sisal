% File man/laggedData.Rd
% This file is part of the sisal package for R.
% Copyright (C) 2015 Aalto University
% Distributed under GPL 2 or later

\encoding{UTF-8}
\name{laggedData}
\alias{laggedData}
\title{
  Create Input Matrix and Output Vector for Time Series Prediction
}
\description{
  Given a time series vector, produces the input matrix and output
  vector for a time series prediction task.  The other parameters are
  the lags to include and the number of steps ahead to predict.
}
\usage{
laggedData(x, lags = 0:9, stepsAhead = 1)
}
\arguments{

  \item{x}{ an \code{atomic} \code{vector} representing a (uniformly
    sampled) time series.  Any attributes are ignored.  }

  \item{lags}{ which lags to use for prediction.  A \code{vector} of
    non-negative integral values.  }

  \item{stepsAhead}{ how many steps ahead to predict.  A non-negative
    integral value (\code{integer} or \code{numeric}).  }

}
\details{

  The default parameters correspond to predicting one step ahead
  (position \code{\var{t}+1}) using the ten most recent values
  (positions \code{\var{t}} \ldots \code{\var{t}-9}).

}
\value{

  A \code{list} with two components:

  \item{X}{ The \code{(length(\var{x}) - max(\var{lags}) -
    \var{stepsAhead})} rows by \code{length(\var{lags})} columns input
    \code{matrix} with the same \link[=typeof]{type} as \code{\var{x}}.
    }

  \item{y}{ The output \code{vector} with \code{length(\var{x}) -
    max(\var{lags}) - \var{stepsAhead}} elements.  Same type as
    \code{\var{x}}.  }

}
\author{
  Mikko Korpela
}
\examples{
laggedData(1:20)
}
\keyword{utilities}
