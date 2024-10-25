% File man/sisal.Rd
% This file is part of the sisal package for R.
% Copyright (C) 2015 Aalto University
% Distributed under GPL 2 or later

\encoding{UTF-8}
\name{sisal}
\alias{sisal}
\title{
  Sequential Input Selection Algorithm (\acronym{SISAL})
}

\description{
  Identifies relevant inputs using a backward selection type algorithm
  with optional branching.  Choices are made by assessing linear models
  estimated with ordinary least squares or ridge regression in a
  cross-validation setting.
}

\usage{
sisal(X, y, Mtimes = 100, kfold = 10, hbranches = 1,
      max.width = hbranches^2, q = 0.165, standardize = TRUE,
      pruning.criterion = c("round robin", "random nodes",
                            "random edges", "greedy"),
      pruning.keep.best = TRUE, pruning.reverse = FALSE,
      verbose = 1, use.ridge = FALSE,
      max.warn = getOption("nwarnings"), sp = -1, \dots)
}

\arguments{

  \item{X}{ a \code{numeric} \code{matrix} where each column is a
    predictor (independent variable) and each row is an observation
    (data point) }

  \item{y}{ a \code{numeric} vector containing a sample of the response
    (dependent) variable, in the same order as the rows of
    \code{\var{X}} }

  \item{Mtimes}{ the number of times the cross-validation is repeated,
    i.e. the number of predictions made for each data point.  An
    integral value (\code{numeric} or \code{integer}).  }

  \item{kfold}{ the number of approximately equally sized parts used for
    partitioning the data on each cross-validation round.  An integral
    value (\code{numeric} or \code{integer}).  }

  \item{hbranches}{ the number of branches to take when removing a
    variable from the model.  In Tikka and \enc{Hollmén}{Hollmen}
    (2008), the algorithm always removes the \dQuote{weakest} variable
    (\code{\var{hbranches}} equals \code{1}, also the default here).  By
    using a value larger than \code{1}, the algorithm creates branches
    in the search graph by removing each of the \code{\var{hbranches}}
    \dQuote{weakest} variables, one at a time.  The number of branches
    created is naturally limited by the number of variables remaining in
    the model at that point.  See also \code{\var{max.width}}. }

  \item{max.width}{ the maximum number of nodes with a given number of
    variables allowed in the search graph.  The same limit is used for
    all search levels.  An integral value (\code{numeric} or
    \code{integer}).  See \code{\var{pruning.criterion}} and
    \code{\var{pruning.keep.best}}.  }

  \item{q}{ a \code{numeric} value between \code{0} and \code{0.5}
    (endpoints excluded) defining the \link[=quantile]{quantiles}
    \code{1-\var{q}} and \code{\var{q}}.  The difference of these sample
    quantiles is used as the width of the sampling distribution (a
    measure of uncertainty) of each coefficient in a linear model.  The
    default value \code{0.165} is the same as used by Tikka and
    \enc{Hollmén}{Hollmen} (2008).  In case of a normally distributed
    parameter, the width is approximately twice the standard deviation
    (one standard deviation on both sides of the mean). }

  \item{standardize}{ a \code{logical} flag.  If \code{TRUE},
    standardizes the data to zero mean and unit variance.  If
    \code{FALSE}, uses original data.  This affects the scale of the
    results.  If \code{\var{use.ridge}} is \code{TRUE}, this should be
    set to \code{TRUE} or the search graph and the sets of selected
    variables could be affected. }

  \item{pruning.criterion}{ a \code{character} string.  Options are
    \code{"round robin"}, \code{"random nodes"}, \code{"random edges"}
    and \code{"greedy"}.  Abbreviations are allowed.  This affects how
    the search tree is pruned if the number of nodes to explore is about
    to exceed \code{\var{max.width}}.  One of the following methods is
    used to select \code{\var{max.width}} nodes for the next level of
    search.

    If \code{"round robin"}, the nodes of the current level
    (\code{\var{i}} variables) take turns selecting nodes for the next
    level (\code{\var{i}-1} variables).  The turns are taken in order of
    increasing validation error.  Each parent node chooses children
    according to the order described in \sQuote{Details}. If a duplicate
    choice would be made, the turn is skipped.

    If \code{"random nodes"}, random nodes are selected with uniform
    probability.

    If \code{"random edges"}, random nodes are selected, with the
    probability of a node directly proportional to the number of edges
    leading to it.

    If \code{"greedy"}, a method similar to \code{"round robin"} is
    used, but with the (virtual) looping order of parents and children
    swapped.  Whereas the outer loop in \code{"round robin"} operates
    over children and the inner loop over parents, the outer loop in
    \code{"greedy"} operates over parents and the inner loop over
    children.  That is, a \code{"greedy"} parent node selects all its
    children before passing on the turn to the next parent.

  }

  \item{pruning.keep.best}{ a \code{logical} flag.  If \code{TRUE}, the
    nodes that would also be present in the \code{\var{hbranches} = 1}
    case are immune to pruning.  If \code{FALSE}, the result may
    underperform the original Tikka and \enc{Hollmén}{Hollmen} (2008)
    solution in terms of (the lowest) validation error as function of
    the number of inputs.  }

  \item{pruning.reverse}{ a \code{logical} flag.  If \code{TRUE}, all
    the methods described in \code{\var{pruning.criterion}} except
    \code{"random nodes"} use reverse orders or inverse probabilities.
    The default is \code{FALSE}. }

  \item{verbose}{ a \code{numeric} or \code{integer} verbosity level
    from \code{0} (no output) to \code{5} (all possible diagnostics).  }

  \item{use.ridge}{ a \code{logical} flag.  If \code{TRUE}, the function
    uses ridge regression with automatic selection of the regularization
    (smoothing) parameter.  }

  \item{max.warn}{ a \code{numeric} value giving the maximum number of
    warnings to store in the returned object.  If more warnings are
    given, their total number is still recorded in the object. }

  \item{sp}{ a \code{numeric} value passed to \code{\link[mgcv]{magic}} if
    \code{\var{use.ridge}} is \code{TRUE}.  Initial value of the
    regularization parameter.  If negative (the default), initialization
    is automatic.  }

  \item{\dots}{ additional arguments passed to \code{\link[mgcv]{magic}} if
    \code{\var{use.ridge}} is \code{TRUE}.  It is an error to supply
    arguments named \code{"S"} or \code{"off"}.  }

}

\details{

  When choosing which variable to drop from the model, the importance of
  a variable is measured by looking at two variables derived from the
  sampling distribution of its coefficient in the linear models of the
  repeated cross-validation runs: \enumerate{ \item absolute value of
  the median and \item width of the distribution (see \code{\var{q}}).
  } The importance of an input variable is the ratio of the median to
  the width: \code{\var{hbranches}} variables with the smallest ratios
  are dropped, one variable in each branch.  See \code{\var{max.width}}
  and \code{\var{pruning.criterion}}.

  The main results of the function are described here.  More details are
  available in \sQuote{Value}.

  The function returns two sets of inputs variables: \describe{
  \item{L.v}{ set corresponding to the smallest validation error. }
  \item{L.f}{ smallest set where validation error is close to the
  smallest error.  The margin is the standard deviation of the training
  error measured in the node of the smallest validation error. } }

  The mean of mean squared errors in the \bold{tr}aining and
  \bold{v}alidation sets are also returned (\code{\var{E.tr}},
  \code{\var{E.v}}).  For the training set, the standard deviation of
  \acronym{MSE}s (\code{\var{s.tr}}) is also returned.  The length of
  these vectors is the number of variables in \code{\var{X}}.  The
  \var{i}:th element in each of the vectors corresponds to the best
  model with \var{i} input variables, where goodness is measured by the
  mean \acronym{MSE} in the validation set.

  Linear models fitted to the whole data set are also returned.  Both
  ordinary least square regression (\code{\var{lm.L.f}},
  \code{\var{lm.L.v}}, \code{\var{lm.full}}) and ridge regression models
  (\code{\var{magic.L.f}}, \code{\var{magic.L.v}},
  \code{\var{magic.full}}) are computed, irrespective of the
  \code{\var{use.ridge}} setting.  Both fitting methods are used for the
  \code{\var{L.f}} set of variables, the \code{\var{L.v}} set and the
  full set (all variables).

}

\value{ A \code{list} with \code{class} \code{"sisal"}.  The items are:

  \item{L.f}{ a \code{numeric} vector containing indices to columns of
    \code{\var{X}}.  See \sQuote{Details}. }

  \item{L.v}{ a \code{numeric} index vector like \code{\var{L.f}}.  See
    \sQuote{Details}. }

  \item{E.tr}{ a \code{numeric} vector of length \code{\var{d} + 1}.
    See \sQuote{Details}. }

  \item{s.tr}{ a \code{numeric} vector of length \code{\var{d} + 1}.
    See \sQuote{Details}. }

  \item{E.v}{ a \code{numeric} vector of length \code{\var{d} + 1}.  See
    \sQuote{Details}. }

  \item{L.f.nobranch}{ a \code{numeric} vector or \code{NULL}.  Like
    \code{\var{L.f}} but for the \dQuote{no branching} solution.
    \code{NULL} if branching is not used or if some elements of
    \code{\var{branching.useful}} are missing. }

  \item{L.v.nobranch}{ like \code{\var{L.f.nobranch}} but related to
    \code{\var{L.v}}. }

  \item{E.tr.nobranch}{ a \code{numeric} vector or \code{NULL}.  Like
    \code{\var{E.tr}} but for the \dQuote{no branching} solution.
    \code{NULL} when \code{\var{branching.useful}} is \code{NULL}.  An
    element is missing when the corresponding element of
    \code{\var{branching.useful}} is missing. }

  \item{s.tr.nobranch}{ like \code{\var{E.tr.nobranch}} but related to
    \code{\var{s.tr}}. }

  \item{E.v.nobranch}{ like \code{\var{E.tr.nobranch}} but related to
    \code{\var{E.v}}. }

  \item{n.evaluated}{ a \code{numeric} vector of length \code{\var{d} +
    1}.  The number of nodes evaluated for each model size, indexed by
    the number of variables used plus one. }

  \item{edges}{ a \code{list} of directed edges between nodes in the
    search graph.  There is an edge from node \var{A} to node \var{B} if
    and only if \var{B} was a candidate for a new node to be evaluated,
    resulting from removing one variable in \var{A}.  The \var{i}:th
    element of the list contains edges directed away from the node
    represented by the \var{i}:th element of \code{\var{vertices}}.
    Each element is a list with one element, \code{"edges"}, which is a
    \code{numeric} vector of indices to \code{\var{vertices}}, pointing
    to the nodes towards which the edges are directed.  There are no
    edges directed away from pruned nodes or nodes representing a single
    variable. }

  \item{vertices}{ a \code{character} vector the same size as
    \code{\var{edges}}.  Contains the names of the nodes in the search
    graph.  Each name contains the indices of the variables included in
    the set in question, separated by dots. }

  \item{vertices.logical}{ a \code{logical} \code{matrix} containing an
    alternative representation of \code{\var{vertices}}.  Number of rows
    is the length of \code{\var{vertices}} and number of columns is
    \code{\var{d}}.  The \var{i}:th column indicates whether the
    \var{i}:th input variable is present in a given node.  The row index
    and the index to \code{\var{vertices}} are equivalent. }

  \item{vertex.data}{A \code{data.frame} with information about each
    node in the search graph (missing information means pruned node).
    The rows correspond to items in \code{\var{vertices}}. The columns
    are:

    \describe{

      \item{E.tr}{ mean of \acronym{MSE}s, training. }

      \item{s.tr}{ standard deviation (\code{\var{n}-1}) of
	\acronym{MSE}s, training. }

      \item{E.v}{ mean of \acronym{MSE}s, validation. }

      \item{E.v.level.rank}{ rank of the node among all the evaluated
	(non-pruned) nodes with the same number of variables, in terms
	of validation error. Smallest error is rank 1. }

      \item{n.rank.deficient}{ number of rank deficient linear models.
	This problem arises when the number of input variables is large
	compared to the number of observations and
	\code{\var{use.ridge}} is \code{FALSE}. }

      \item{n.NA.models}{ number of models that could not be estimated
	due to lack of any samples }

      \item{n.inputs}{ number of input variables used in the model
	represented by the node. }

      \item{min.branches}{ the smallest branching factor large enough
	for producing the node.  This is a number \code{\var{k}} between
	\code{1} and \code{\var{hbranches}}.  The value for the root
	node (all input variables) is \code{1}.  The value for other
	nodes is the minimum of the set of values suggested by its
	parents. The value suggested by an individual parent is the
	\code{\var{min.branches}} value of the parent itself or the
	ranking of the child in terms of increasing importance of the
	removed variable (see \sQuote{Details}), whichever is larger.
	For example, when \code{\var{pruning.keep.best}} is \code{TRUE},
	the \code{\var{hbranches} = 1} search path can be followed by
	looking for nodes where \code{\var{min.branches}} is \code{1}. }

    }

  }

  \item{var.names}{ names of the variables (column names of
    \code{\var{X}}). }

  \item{n}{ number of observations in the (\code{\var{X}},
    \code{\var{y}}) data. }

  \item{d}{ number of variables (columns) in \code{\var{X}}. }

  \item{n.missing}{ number of samples where either \code{\var{y}} or all
    variables of \code{\var{X}} are missing. }

  \item{n.clean}{ number of complete samples in the data set
    \code{\var{X}}, \code{\var{y}}. }

  \item{lm.L.f}{ \code{\link{lm}} model fitted to \code{\var{L.f}}
    variables. }

  \item{lm.L.v}{ \code{\link{lm}} model fitted to \code{\var{L.v}}
    variables. }

  \item{lm.full}{ \code{\link{lm}} model fitted to all variables. }

  \item{magic.L.f}{ \code{\link[mgcv]{magic}} model fitted to \code{\var{L.f}}
    variables. }

  \item{magic.L.v}{ \code{\link[mgcv]{magic}} model fitted to \code{\var{L.v}}
    variables. }

  \item{magic.full}{ \code{\link[mgcv]{magic}} model fitted to all
    variables. }

  \item{mean.y}{ mean of \code{\var{y}}. }

  \item{sd.y}{ standard deviation (denominator \code{\var{n} - 1}) of
    \code{\var{y}}. }

  \item{zeroRange.y}{ a \code{logical} value indicating whether all
    non-missing elements of \code{\var{y}} are equal, with some numeric
    tolerance. }

  \item{mean.X}{ column means of \code{\var{X}}. }

  \item{sd.X}{ standard deviation (denominator \code{\var{n} - 1}) of
    each column in \code{\var{X}}. }

  \item{zeroRange.X}{ a \code{logical} vector.  Like
    \code{\var{zeroRange.y}} but for each column of \code{\var{X}}. }

  \item{constant.X}{ a \code{logical} vector where the i:th value
    indicates whether the i:th column of \code{\var{X}} has a (nearly)
    constant, non-zero value (\code{NA} values allowed). }

  \item{params}{ a named \code{list} containing the values used for most
    of the parameter-like \link[=formals]{formal arguments} of the
    function, and also anything in \code{\dots}.  The names are the
    names of the parameters. }

  \item{pairwise.points}{ a \code{numeric} square \code{matrix} with
    \code{\var{d}} rows and columns.  The count in row \var{i}, column
    \var{j} indicates the number of times that variable \var{i} was
    better than variable \var{j}.  See \sQuote{Details} in
    \code{\link{plotSelected.sisal}}. }

  \item{pairwise.wins}{ a \code{logical} square \code{matrix} with
    \code{\var{d}} rows and columns.  A \code{TRUE} value in row
    \var{i}, column \var{j} indicates that \var{i} is more important
    than variable \var{j}. Derived from \code{\var{pairwise.points}}. }

  \item{pairwise.preferences}{ a \code{numeric} vector with
    \code{\var{d}} elements.  Number of wins minus number of losses
    (when another variable wins) per variable.  Derived from
    \code{\var{pairwise.wins}}. }

  \item{pairwise.rank}{ an \code{integer} vector of ranks according to
    Copeland's pairwise aggregation method.  Element number \var{i} is
    the rank of variable (column) number \var{i} in \code{\var{X}}.
    Derived from \code{\var{pairwise.preferences}}.  See
    \sQuote{Details} in \code{\link{plotSelected.sisal}}. }

  \item{path.length}{ a \code{numeric} vector of path lengths.  Consider
    a path starting from the full model and continuing through
    incrementally smaller models, each with the smallest validation
    error among the nodes with that number of variables.  However, the
    path is broken at each point where the model with one less variable
    cannot be constructed by removing one variable from the bigger model
    (is not nested).  The vector contains the lengths of the pieces.
    Its length is the number of breaks plus one. }

  \item{nested.path}{ a \code{numeric} vector containing the indices
    (column numbers) of the input variables in their removal order on
    the \dQuote{nested path}.  The first element is the index of the
    variable that was removed first.  The remaining variable is the last
    element.  If the path does not exist, this is \code{NULL}.  See
    \sQuote{Details} in \code{\link{plotSelected.sisal}}. }

  \item{nested.rank}{ an \code{integer} vector of ranks determined by
    \code{\var{nested.path}}.  Element number \var{i} is the rank of
    variable (column) number \var{i} in \code{\var{X}}.  \code{NULL} if
    \code{\var{nested.path}} is \code{NULL}.  See \sQuote{Details} in
    \code{\link{plotSelected.sisal}}. }

  \item{branching.useful}{ If branching is enabled
    (\code{\var{hbranches} > 1}), this is a \code{logical} vector of
    length \code{\var{d}}.  If the \var{i}:th element is \code{TRUE},
    branching improved the best model with \var{i} variables in terms of
    validation error.  The result is \code{NA} if a comparison is not
    possible (may happen if \code{\var{pruning.keep.best}} is
    \code{FALSE}).  If branching is not used, this is \code{NULL}. }

  \item{warnings}{ warnings stored.  A \code{list} of objects that
    \link[=eval]{evaluate} to a \code{character} string. }

  \item{n.warn}{ number of warnings produced.  May be higher than number
    of warnings stored. }

}


\references{

  Tikka, J. and \enc{Hollmén}{Hollmen}, J. (2008) Sequential input
  selection algorithm for long-term prediction of time series.
  \emph{Neurocomputing}, 71(13\enc{–}{--}15):2604\enc{–}{--}2615.

}

\author{ Mikko Korpela }

\seealso{

  See \code{\link[mgcv]{magic}} for information about the algorithm used for
  estimating the regularization parameter and the corresponding linear
  model when \code{\var{use.magic}} is \code{TRUE}.

  See \code{\link{summary.sisal}} for how to extract information from
  the returned object.

}
\examples{
library(stats)
set.seed(123)
X <- cbind(sine=sin((1:100)/5),
           linear=seq(from=-1, to=1, length.out=100),
           matrix(rnorm(800), 100, 8,
                  dimnames=list(NULL, paste("random", 1:8, sep="."))))
y <- drop(X \%*\% c(3, 10, 1, rep(0, 7)) + rnorm(100))
foo <- sisal(X, y, Mtimes=10, kfold=5)
print(foo)           # selected inputs "L.v" are same as
summary(foo$lm.full) # significant coefficients of full model
}
\keyword{multivariate}
\keyword{robust}
\keyword{models}
\keyword{regression}
