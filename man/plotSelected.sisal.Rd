% File man/plotSelected.sisal.Rd
% This file is part of the sisal package for R.
% Copyright (C) 2015 Aalto University
% Distributed under GPL 2 or later

\encoding{UTF-8}
\name{plotSelected.sisal}
\alias{plotSelected}
\alias{plotSelected.sisal}
\alias{plotSelected.list}
\title{
  Plotting Sets of Inputs Produced by Sequential Input Selection
}
\description{
  Draws a table depicting the inputs selected by a number of
  \code{sisal} runs, one row for each run.
}
\usage{
\method{plotSelected}{sisal}(x, useAllNames = TRUE,
             pickIntPart = FALSE, intTransform = function(x) x,
             formatCArgs = list(), xLabels = 1, yLabels = NULL,
             L.f.color = "black", L.v.color = "grey50",
             other.color = "white", naFill = other.color,
             naStripes = L.v.color, selectedLabels = TRUE,
             otherLabels = FALSE,
             labelPar = gpar(fontface = 1, fontsize = 20, cex = 0.35),
             nestedPar = gpar(fontface = 3),
             ranking = c("pairwise", "nested"), tableArgs = list(),
             \dots)

\method{plotSelected}{list}(x, \dots)
}
\arguments{

  \item{x}{ an object of class \code{"sisal"} or a \code{list} of such
    objects giving the results of input selection.  }

  \item{useAllNames}{ a \code{logical} flag.  If \code{TRUE}, collects
    the names of input variables from all elements of a \code{list}
    \code{\var{x}} or from the single \code{"sisal"} object.  Each
    unique name is represented by one column in the table.  If
    \code{FALSE}, all elements of \code{\var{x}} are assumed to have the
    same set of input variables in the same order.  }

  \item{pickIntPart}{ a \code{logical} \code{vector}.  If
    \code{\var{pickIntPart}[\var{k}]} is \code{TRUE}, the input names
    collected from \code{\var{x}[[\var{k}]]} (\code{\var{x}} is a
    \code{list}) or from \code{\var{x}} (\code{\var{x}} is a single
    \code{"sisal"} object and \code{\var{k} == 1}) are filtered so that
    any name containing an integer part is converted to that integer
    (the remaining part is dropped).  If the \code{length} of the
    \code{vector} and the number of rows in the table differ, the values
    of the \code{vector} are recycled.  }

  \item{intTransform}{ a \code{function} that transforms integral valued
    input names to another integer.  Used if and only if the relevant
    element of \code{\var{pickIntPart}} is \code{TRUE}.  The function
    must accept a \code{numeric} \code{vector} argument and return a
    \code{numeric} \code{vector}.  The default value is an identity
    function. }

  \item{formatCArgs}{ a named \code{list} of arguments to
    \code{\link{formatC}}.  If the relevant element of
    \code{\var{pickIntPart}} is \code{TRUE}, the integral valued column
    names are formatted with \code{formatC} using these arguments.  For
    example, it is possible to add a sign with \code{list(flag =
    "+")}. }

  \item{xLabels}{ a \code{numeric} value, \code{character} \code{vector}
    or \code{list} affecting the column labels in the table.  If
    \code{useAllNames} is \code{TRUE}, a named \code{list} or
    \code{character} \code{vector} can be used to rename inputs.  In
    this case, the names in the \code{vector} must contain all the input
    names gathered from \code{x}. The new names (display names) are
    taken from the values in the \code{vector}, indexed with the names
    from \code{x}.  If \code{useAllNames} is \code{TRUE}, a
    \code{numeric} value has no effect.  If \code{useAllNames} is
    \code{FALSE}, a \code{numeric} value is an index to \code{x}
    indicating the object to be used when collecting input names.  An
    unnamed \code{list} or \code{character} \code{vector} of column
    names can also be used when \code{useAllNames} is \code{FALSE}.  }

  \item{yLabels}{ a \code{character} \code{vector} or \code{list} giving
    the row labels in the table.  \code{NULL} (the default) means no
    labels. }

  \item{L.f.color}{ fill color for table cells representing an input
    variable in the \var{L.f} set. }

  \item{L.v.color}{ fill color for table cells representing an input
    variable in the \var{L.v} set. }

  \item{other.color}{ fill color for table cells representing an input
    variable outside both \var{L.f} and \var{L.v}. }

  \item{naFill}{ background color for table cells representing a missing
    input variable. }

  \item{naStripes}{ stripe color for table cells representing a missing
    input variable. }

  \item{selectedLabels}{ a \code{logical} flag.  If \code{TRUE} (the
    default), draw labels on table cells representing input variables in
    the \var{L.f} or \var{L.v} sets.  The label shows the importance
    rank of the variable.  See \sQuote{Details}.  }

  \item{otherLabels}{ a \code{logical} flag.  If \code{TRUE}, draw
    labels on table cells representing input variables not included the
    \var{L.f} or \var{L.v} sets.  The label shows the importance rank of
    the variable.  The default value is \code{FALSE}.  See
    \sQuote{Details}. }

  \item{labelPar}{ graphical parameters for labels of table cells. }

  \item{nestedPar}{ graphical parameters for labels on rows that
    represent input selection runs where the best nodes of each size are
    all nested.  See \sQuote{Details}.  Only used if
    \code{\var{ranking}} includes \code{"nested"}.  These take
    precedence over values set in \code{\var{labelPar}}.  }

  \item{ranking}{ which input ranking method(s) to use.  A
    \code{character} \code{vector} containing one or both of
    \code{"pairwise"} and \code{"nested"}.  Abbreviated versions can be
    used.  See \sQuote{Details} for a description of the ranking
    methods.  If both rankings are requested by the user and exist, they
    are both written on the label, but only where the ranks differ.  The
    first element indicates the preferred primary ranking method, and
    any differing ranks produced by a possible secondary ranking method
    are presented in parentheses after the rank indicated by the primary
    method.  The default is to use both methods when possible,
    preferring the always available \code{"pairwise"} method.  }

  \item{tableArgs}{ a named \code{list} of arguments passed to
    \code{\link{sisalTable}}.  This can also be used when arguments of
    \code{\link{sisalTable}} and the \code{"sisal"} method of
    \code{plotSelected} have the same name. }

  \item{\dots}{ In the \code{"sisal"} method, arguments passed to
  \code{\link{sisalTable}}.  In the \code{"list"} method, arguments
  passed to the next method, determined by the class of the first
  element in the list. }

}
\details{

  Currently the \code{"sisal"} and \code{"list"} methods are the only
  methods for the generic function \code{plotSelected} defined by the
  sisal package.

  Mathematical annotation can be used in text.  See \link{plotmath}.  If
  the same input is in both the \var{L.f} and the \var{L.v} sets,
  \code{\var{L.f.color}} and \code{\var{L.v.color}} are mixed in
  alternating stripes.  See \code{\link{col2rgb}} for a description of
  possible color values.

  The importance rank of input variables is determined using one or both
  of the following two methods (see \code{\var{ranking}}):

  \describe{

    \item{"nested"}{

      This method requires that all the nodes with the smallest
      validation error among the nodes with the same number of input
      variables are nested.  Let's imagine a path through the
      incrementally smaller best nodes (not necessarily a path in the
      search graph) where the edges are labeled with the \acronym{ID} of
      the input removed in order to create the smaller model.  In this
      ranking method, the remaining input variable gets rank 1.
      Traversing the path in the reverse direction and printing the edge
      labels produces the rest of the input variables from smaller rank
      to larger. If \code{hbranches = 1} in \code{sisal}, the models are
      always nested and the method agrees with \code{"pairwise"}.

    }

    \item{"pairwise"}{

      This is Copeland's pairwise aggregation method.  It can be used in
      all cases, unlike \code{"nested"}.  The score of an input
      variable is the number of pairwise victories minus the number of
      pairwise defeats when compared with other inputs.  The inputs are
      ranked by their score.  The method may result in ties.  Tied nodes
      are ranked according to \code{\var{ties.method} = "min"} in
      \code{\link{rank}}.

      The pairwise comparisons are performed in the following way: In
      \code{sisal}, at each stage of the search, input variables are
      ordered and inputs are removed starting from one or more (when
      \code{\var{hbranches} > 1}) of the worst ones according to that
      order.  A record, let's say \code{\var{C}[\var{A}, \var{B}]}, is
      kept of each pair of inputs (\var{A}, \var{B}) in order to keep
      track of how many times \var{A} was better than \var{B}.  Let
      \var{L} be the set of inputs to remove at the current stage of the
      search in one of the branches and \var{M} the set of remaining
      inputs.  Then, \code{\var{C}[\var{A}, \var{B}]} is incremented by
      one for all \var{A} in \var{M} and \var{B} in \var{L}, but also
      for all \var{A} in \var{L} and \var{B} in \var{L} such that
      \var{A} is better than \var{B} according to the order used for
      picking the inputs to remove. \var{A} gets a pairwise victory
      over \var{B} if
      \code{\var{C}[\var{A}, \var{B}] > \var{C}[\var{B}, \var{A}]}.

    }

  }

  For information on setting graphical parameters
  (\code{\var{labelPar}}, \code{\var{nestedPar}}), see
  \code{\link{gpar}}.

  }
\value{
  The function is usually called for the side effect (a plot is drawn),
  but it also returns a \code{\link{grob}} representation of the plot.
}
\references{

  Pomerol, J.-C. and Barba-Romero, S. (2000) \emph{Multicriterion
  decision in management: principles and
  practice}. Springer. p. 122. \acronym{ISBN}: 0-7923-7756-7.

}
\author{
  Mikko Korpela
}
\seealso{
  \code{\link{sisal}}, \code{\link{sisalTable}},
  \link{plotmath}, \code{\link{gpar}}
}
\examples{
library(grDevices)
library(grid)
toy1.2 <- list(testSisal(Mtimes=10, stepsAhead=1, dataset="tsToy"),
               testSisal(Mtimes=10, stepsAhead=2, dataset="tsToy"))
## Resizing enabled:
## - mathematical expressions in titles
## - extracting the integer part of input variable names
grid.newpage()
plotSelected(toy1.2, yLabels = c("+1", "+2"),
             main = "Toy time series",
             xlab = expression(paste("input variables ",
                                     italic(y[t+l]))),
             ylab = expression(paste("output ", italic(y[t+k]))),
             pickIntPart = TRUE, intTransform = function(x) -x)
## Fixed size plot:
## - some graphical parameters adjusted
## - cex in labelPar adjusts the space around the text in table cells
## - new device the same size as the plot
grb <- plotSelected(toy1.2, resizeText = FALSE, resizeTable = FALSE,
                    axesPar = gpar(fontsize = 11, col = "red"),
                    labelPar = gpar(fontsize = 14/0.25, cex = 0.25),
                    fg = "wheat", outerRect = FALSE,
                    linePar = gpar(lty = "dashed"),
                    xAxisRot = 45, just = c("left", "top"),
                    tableArgs = list(x = 0, y = 1), draw = FALSE)
devWidth <- convertWidth(grobWidth(grb), unitTo = "inches",
                         valueOnly = TRUE)
devHeight <- convertHeight(grobHeight(grb), unitTo = "inches",
                           valueOnly = TRUE)
dev.new(width = devWidth, height = devHeight, units = "in", res = 72)
grid.draw(grb)
if (interactive()) {
    dev.set(dev.prev())
} else {
    dev.off()
}
}
\keyword{hplot}
