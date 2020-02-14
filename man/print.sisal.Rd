% File man/print.sisal.Rd
% This file is part of the sisal package for R.
% Copyright (C) 2015 Aalto University
% Distributed under GPL 2 or later

\encoding{UTF-8}
\name{print.sisal}
\alias{print.sisal}
\title{
  Printing Sequential Input Selection Objects
}
\description{
  Prints information contained in a sequential input selection object.
}
\usage{
\method{print}{sisal}(x, max.warn = 10, \dots)
}
\arguments{

  \item{x}{ an object of class \code{"\link{sisal}"}. }

  \item{max.warn}{ a \code{numeric} value giving the maximum number of
    warnings to show.  See \code{\var{max.warn}} in \code{\link{sisal}}.
  }

  \item{\dots}{ additional arguments passed to other \code{\link{print}}
    methods. }

}
\details{
  The following information is printed:
  \itemize{

    \item Parameter values used in the \code{\link{sisal}} call

    \item Data dimensions

    \item Names of the input variables, if available

    \item Selected inputs, \var{L.v} (smallest validation error)

    \item Selected inputs, \var{L.f} (result within error margin)

    \item Whether \var{L.f} is a subset of \var{L.v} (nested model) or
    not

    \item The removal order and / or rank of the input variables (see
    \code{\link{plotSelected.sisal}})

    \item The stages of search (if any) at which branching reduced
    validation error compared to a \code{hbranches = 1} solution.  Not
    printed if branching was not used or if it is possible that the
    search did not proceed through every set of variables on the
    \code{hbranches = 1} path, i.e. if \code{pruning.keep.best} was
    \code{FALSE}.  One must note that these results, like many others,
    are subject to randomness.  Thus the results may differ between
    successive runs of \code{sisal}.

    \item Any warnings produced by the \code{\link{sisal}} run (see
    \code{\var{max.warn}})

  }
}
\value{
  Invisibly returns \code{\var{x}}.
}
\author{
  Mikko Korpela
}
\seealso{
  More information can be obtained with \code{\link{summary.sisal}}.
}
\examples{
foo <- testSisal(dataset="toy", nData = 200, Mtimes = 10,
                 noiseSd = 0.5, verbose = 0)
print(foo)
}
\keyword{print}
