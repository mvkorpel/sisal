% File man/bootMSE.Rd
% This file is part of the sisal package for R.
% Copyright (C) 2015 Aalto University
% Distributed under GPL 2 or later

\encoding{UTF-8}
\name{bootMSE}
\alias{bootMSE}
\title{
  Bootstrap Estimate of Mean Squared Error Using \acronym{SISAL} Object
}
\description{
  Using a linear model produced by \code{\link{sisal}}, computes a
  bootstrap estimate of MSE in test data.
}
\usage{
bootMSE(object, dataset = NULL, R = 1000,
        inputs = c("L.f", "L.v", "full"),
        method = c("OLS", "magic"), standardize = "inherit",
        stepsAhead = NULL, noiseSd = NULL, verbose = 1, \dots)
}
\arguments{

  \item{object}{ an object of class \code{"\link{sisal}"},
    containing the results of input selection and the corresponding
    ordinary least squares and ridge regression models.  Must be
    compatible with \code{\var{dataset}}.  See \sQuote{Details}.  }

  \item{dataset}{ dataset to work on.  A \code{character} string, a
    \code{numeric} \code{vector} or a \code{list} with components
    \code{"X"} and \code{"y"}.  When the default value \code{NULL} is
    used, the function attempts to detect the dataset from attributes of
    \code{\var{object}}.  See \sQuote{Details}.  }

  \item{R}{ the number of bootstrap replicates.  Usually a single
    positive integral number.  See \code{\link[=boot]{boot::boot}}.  }

  \item{inputs}{ a \code{character} string.  Which set of input
    variables to use.  Choices are \code{"L.f"} (smallest set with error
    under threshold), \code{"L.v"} (minimum validation error) and
    \code{"full"} (full model).  See \code{\link{sisal}}.  }

  \item{method}{ a \code{character} string.  \code{"OLS"} for ordinary
    least squares regression or \code{"magic"} for a ridge regression
    model with an automatically selected regularization parameter.  See
    \code{\link{sisal}}.  }

  \item{standardize}{ \code{"inherit"} or a \code{logical} flag.  If
    \code{TRUE}, standardizes the data to zero mean and unit variance.
    If \code{FALSE}, uses original data.  If \code{"inherit"} (the
    default), the value of this argument is copied from
    \code{\var{object}}. This affects the scale of the results.  }

  \item{stepsAhead}{ If doing time series prediction, this indicates how
    many steps ahead to predict.  A non-negative integral value or
    \code{NULL}.  If \code{NULL} (the default), the value is copied from
    an attribute of \code{\var{object}}, put there by
    \code{\link{testSisal}}.  }

  \item{noiseSd}{ standard deviation of the noise to be added to the
    dependent variable when \code{\var{dataset}} is \code{"toy"}.  The
    noise is a saved dataset.  Thus it is always identical, only scaled
    by \code{noiseSd}.  If \code{NULL} (the default), the value is
    copied from \code{\var{object}}.  }

  \item{verbose}{ verbosity level.  A single \code{numeric} value.  If
    \code{0}, output is disabled.  If greater than \code{0}, shows some
    information about what the function is doing.  Currently there is
    only one non-zero verbosity level (the default).  }

  \item{\dots}{ arguments passed to \code{\link[=boot]{boot::boot}}. }

}
\details{

  Four types of values are supported in \code{\var{dataset}}.

  \enumerate{

    \item Use one of \code{"laser"}, \code{"poland"}, \code{"toy"} and
    \code{"tsToy"} to work on the test part of a dataset included in or
    specifically supported by the package.  The first two options will
    load their respective datasets over a network connection.  See
    \code{\link{sisalData}}, \code{\link{toy.test}} and
    \code{\link{tsToy.test}}.

    \item Use a \code{numeric} \code{vector} to work with time series
    data.  The use of the \code{"laser"} and \code{"poland"} datasets is
    recognized. Loading the datasets in advance reduces unnecessary
    network traffic when doing multiple repeats with the same dataset.

    \item Use a \code{list} with a \code{numeric} \code{matrix}
    \code{"X"} and a \code{numeric} \code{vector} \code{"y"} to supply
    inputs \code{"X"} and output \code{"y"}.  This is appropriate when
    using your own data for something else than time series prediction
    based on past values of the same time series.

    \item Use \code{NULL} (the default value) for automatic detection of
    the dataset.  This works if \code{\var{object}} was created with
    \code{\link{testSisal}}.

  }

  When using time series data, the names of the inputs used in
  \code{object} must match the \link[=regex]{regular expression}
  \code{"lag\\.\\d+"}, i.e. \code{"lag"} followed by a dot and an
  integer without spaces or any other formatting.  This is automatically
  taken care of by \code{\link{laggedData}} and \code{\link{testSisal}}.

  When using other than time series data, the user-supplied
  \code{\var{dataset}} must contain all the input variables used in the
  selected linear model (i.e. full model or a subset of inputs) of
  \code{\var{object}}.

}
\value{

  An object of class \code{"boot"}, as returned by
  \code{\link[=boot]{boot::boot}}.

}
\author{
  Mikko Korpela
}
\seealso{
  \code{\link[=boot]{boot::boot}}, \code{\link{sisal}},
  \code{\link{testSisal}}
}
\examples{
foo <- testSisal(dataset="toy", Mtimes=10)
bootMSE(foo)
}
\keyword{utilities}
\keyword{nonparametric}
