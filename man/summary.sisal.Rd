% File man/summary.sisal.Rd
% This file is part of the sisal package for R.
% Copyright (C) 2015 Aalto University
% Distributed under GPL 2 or later

\encoding{UTF-8}
\name{summary.sisal}
\alias{summary.sisal}
\alias{print.summary.sisal}
\title{
  Summarizing Sequential Input Selection Results
}
\description{
  \code{\link{summary}} method for class \code{"sisal"}
}
\usage{
\method{summary}{sisal}(object, \dots)
\method{print}{summary.sisal}(x, \dots)
}
\arguments{

  \item{object}{ an object of class \code{"\link{sisal}"}. }

  \item{x}{ an object of class \code{"\link{summary.sisal}"}. }

  \item{\dots}{ arguments passed to/from other methods. }

}
\details{
  The functions compute and print summaries (\code{\link{summary.lm}})
  of the ordinary least squares regression models stored in the
  \code{\var{object}} and some additional information.
}
\value{

  The function \code{summary.sisal} returns a \code{list} with
  \code{class} \code{"summary.sisal"}, currently containing:

  \item{summ.full}{ summary of the full model.  An object of class
    \code{"\link{summary.lm}"}. }

  \item{summ.L.v}{ summary of the \var{L.v} model.  An object of
    class \code{"\link{summary.lm}"}. }

  \item{summ.L.f}{ summary of the \var{L.f} model.  An object of
    class \code{"\link{summary.lm}"}.}

  \item{error.df}{ a \code{data.frame} containing information on the
    best variable sets with a given number of variables, with the
    following columns (copied from \code{\var{object}}):
    \describe{
      \item{n.inputs}{ number of inputs (row label). }
      \item{E.tr}{ mean training \acronym{MSE}. }
      \item{s.tr}{ standard deviation of training \acronym{MSE}. }
      \item{E.v}{ mean validation \acronym{MSE}. }

      \item{L.f.flag}{ \code{logical} \code{vector} where the location
	of \code{TRUE} points the smallest variable set with
	\code{\var{thr.flag}} \code{TRUE}. }

      \item{L.v.flag}{ \code{logical} \code{vector} where the location
	of \code{TRUE} points the variable set with the smallest
	validation error. }

      \item{thr.flag}{ \code{logical} \code{vector} where \code{TRUE} means
	that error is at most \code{\var{E.v}[\var{L.v.flag}] +
	  \var{s.tr}[\var{L.v.flag}]}.  }
    }
  }

  The function \code{print.summary.sisal} invisibly returns
  \code{\var{x}}.

}
\author{
  Mikko Korpela
}
\seealso{
  \code{\link{sisal}}, \code{\link{print.sisal}}
}
\examples{
foo <- testSisal(dataset="toy", Mtimes=10, hbranches=2)
summary(foo)
}
\keyword{models}
\keyword{regression}
