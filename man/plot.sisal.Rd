% File man/plot.sisal.Rd
% This file is part of the sisal package for R.
% Copyright (C) 2015 Aalto University
% Distributed under GPL 2 or later

\encoding{UTF-8}
\name{plot.sisal}
\alias{plot.sisal}
\title{
  Plotting Sequential Input Selection Results
}
\description{
  A \code{\link{plot}} method for class \code{"sisal"}.  Supports 3 plot
  types: error as a function of the number of variables, search graph,
  and color key of the search graph.
}
\usage{
\method{plot}{sisal}(x, which = 1, standardize = "inherit", \dots,
     plotArgs = list(list(), list(mai = rep(0.1, 4))),
     xlim = c(x[["d"]], 0), ylim = NULL, ask = TRUE,
     dev.set = !ask, draw.node.labels = TRUE,
     draw.edge.labels = TRUE, draw.selected.labels = TRUE,
     rankdir = c("TB", "LR", "BT", "RL"),
     fillcolor.normal = "deepskyblue",
     fillcolor.pruned = "deeppink",
     fillcolor.selected = "chartreuse",
     fillcolor.levelbest = "gold",
     fillcolor.small = "moccasin", fillcolor.large = "black",
     fillcolor.NA = "white",
     bordercolor.normal = "black",
     bordercolor.special.levelbest = fillcolor.levelbest,
     bordercolor.special.selected = fillcolor.selected,
     color.by.error = FALSE,
     ramp.space = c("Lab", "rgb"), ramp.size = 128,
     error.limits = c(NA_real_, NA_real_),
     category.labels =
         c(normal = gettext("Other", domain="R-sisal"),
           pruned = gettext("Pruned", domain="R-sisal"),
           levelbest = gettext("Best\nin class", domain="R-sisal"),
           selected = gettext("Selected", domain="R-sisal"),
           special.levelbest = gettext("Best\n(no branching)",
                                       domain="R-sisal"),
           special.selected = gettext("Selected\n(no branching)",
                                      domain="R-sisal"),
           shape.normal=gettext("Other", domain="R-sisal"),
           shape.highlighted=gettext("Highlighted", domain="R-sisal")),
     integrate.colorkey = TRUE, colorkey.gap = 0.1,
     colorkey.space = c("right", "bottom", "left", "top"),
     colorkey.title.gp = gpar(fontface = "bold"),
     nodesep = 0.25, ranksep = 0.5,
     graph.attributes = character(0),
     node.attributes = character(0),
     edge.attributes = character(0))
}
%- maybe also 'usage' for other objects documented here.
\arguments{

  \item{x}{ an object of class \code{"\link{sisal}"}. }

  \item{which}{ which plots to draw.  A \code{numeric} \code{vector}
    containing a subset of the following numbers:

    \describe{

      \item{ 1 }{ error vs. number of inputs. }

      \item{ 2 }{ search graph.  A directed acyclic graph
	(\acronym{DAG}). }

      \item{ 3 }{ node shape and color keys for the search graph.
	Requires that plot 2 is drawn, too. }

    }

    The default is to draw plot number 1.  For drawing plot number 2,
    \href{http://www.bioconductor.org/}{Bioconductor} packages
    \code{"graph"} and \code{"Rgraphviz"} must be installed.

    Some other arguments of this method only apply to specific plots.
  }

  \item{standardize}{ \code{"inherit"} or a \code{logical} flag.  If
    \code{TRUE}, the error values in plot 1 correspond to standardized
    data (see \code{\var{standardize}} in \code{\link{sisal}}).  If
    \code{FALSE}, the original scale of the data is used instead.  If
    \code{"inherit"} (the default), the value of this argument is copied
    from \code{\var{x}}.  }

  \item{\dots}{ arguments passed to \code{plot} and \code{matplot}.
    These are used in all plots where \code{plot} or \code{matplot} do
    the actual drawing.  For more fine-grained control and passing
    arguments to other graphical functions, use the \code{plotArgs}
    argument. }

  \item{plotArgs}{ arguments passed to graphical functions.  A
    \code{list} where \code{\var{plotArgs}[[\var{k}]]} (if present) are
    named \code{list}s of arguments passed to plot number \var{k}.  See
    \sQuote{Details}. }

  \item{xlim}{ the x limits \code{c(x1, x2)} of plot 1.  A
    \code{numeric} \code{vector}.  Defaults to showing the whole range,
    i.e. everything between no input variables at all (except possibly
    an intercept) and the maximum number of inputs. }

  \item{ylim}{ the y limits \code{c(x1, x2)} of plot 1.  A
    \code{numeric} \code{vector}.  If \code{NULL} (the default), adjusts
    to the range of y values corresponding to x values delimited by
    \code{xlim}.  }

  \item{ask}{ a \code{logical} flag.  If \code{TRUE} (the default) and
    \code{!dev.set}, prompts the user before replacing a plot drawn with
    this function with another one.  The user will not be alerted as
    long as there are free slots in the plot layout (see \code{mfrow}
    and \code{mfcol} in \code{\link{par}}). }

  \item{dev.set}{ a \code{logical} flag.  If \code{TRUE}, the function
    calls \code{dev.set} for switching to the next available graphical
    device when it runs out of free slots in the plot layout.  If
    \code{FALSE}, the same graphical device is used for all the plots.
    The default value is \code{!ask}.  }

  \item{draw.node.labels}{ a \code{logical} flag.  If \code{TRUE}, label
    the nodes of the search graph plot representing one input variable. }

  \item{draw.edge.labels}{ a \code{logical} flag.  If \code{TRUE}, label
    the edges of the search graph plot with the identity of the removed
    input variable. }

  \item{draw.selected.labels}{ a \code{logical} flag.  If \code{TRUE},
    label the nodes of the search graph plot representing the L.v and
    L.f input variable sets of \code{\link{sisal}}. }

  \item{rankdir}{ the drawing direction of plot number 2 (search graph).
    A \code{character} string, one of \code{"TB"} (top to bottom, the
    default), \code{"LR"} (left to right), \code{"BT"} (bottom to top),
    or \code{"RL"} (right to left).  }

  \item{fillcolor.normal}{ fill color for normal nodes in plot number 2.
  }

  \item{fillcolor.pruned}{ fill color for pruned (unevaluated) nodes in
    plot 2.  If \code{\var{color.by.error}} is \code{TRUE}, this color
    is used as the border color. }

  \item{fillcolor.selected}{ fill color for nodes representing the L.v
    and L.f input variable sets of \code{\link{sisal}} in plot 2.  If
    \code{\var{color.by.error}} is \code{TRUE}, this color is used as
    the border color. }

  \item{fillcolor.levelbest}{ fill color for nodes with the smallest
    validation error using a given number of input variables in plot 2.
    If \code{\var{color.by.error}} is \code{TRUE}, this color is used as
    the border color. }

  \item{fillcolor.small}{ if \code{color.by.error} is \code{TRUE}, fill
    color for nodes with small validation error in plot 2. }

  \item{fillcolor.large}{ if \code{color.by.error} is \code{TRUE}, fill
    color for nodes with large validation error in plot 2. }

  \item{fillcolor.NA}{ if \code{color.by.error} is \code{TRUE}, fill
    color for pruned (unevaluated) nodes in plot 2. }

  \item{bordercolor.normal}{ border color for normal nodes in plot 2. }

  \item{bordercolor.special.levelbest}{ border color for special nodes
    in plot 2.  If branching (\code{\var{hbranches} > 1}) reduces
    validation error with a given number of input variables, the
    \dQuote{no branching} node is marked with this border color.  If
    \code{\var{pruning.keep.best}} is \code{FALSE}, the comparison may
    not be possible for all sizes of the input variable set. }

  \item{bordercolor.special.selected}{ border color for another kind of
    special nodes in plot 2.  The \dQuote{no branching} L.v or L.f node,
    if different from the corresponding node in the solution where
    branching is allowed, is marked with this border color.  If
    \code{\var{pruning.keep.best}} is \code{FALSE}, these alternative
    L.v and L.f nodes may not be defined, in which case the special
    color will not be used.  If \code{\var{color.by.error}} is
    \code{TRUE}, this border color is also used to mark nodes that would
    be marked with \code{\var{fillcolor.selected}} in the case where
    \code{\var{color.by.error}} is \code{FALSE}. }

  \item{color.by.error}{ a \code{logical} flag.  If \code{TRUE} nodes in
    plot 2 are colored using a color gradient between
    \code{fillcolor.small} and \code{fillcolor.large} according to the
    validation error in the node.  If \code{FALSE}, the nodes are
    colored by category (normal, pruned, selected, levelbest). }

  \item{ramp.space}{ color space to be used in plots number 2 and 3 if
    \code{color.by.error} is \code{TRUE}.  Either \code{"Lab"} (the
    default) or \code{"rgb"}.  See \code{\link{colorRamp}}.  }

  \item{ramp.size}{ the number of colors to be used in the color
    gradient of plot number 3 if \code{color.by.error} is \code{TRUE}.
    See \code{\link{colorRampPalette}}.  }

  \item{error.limits}{ a \code{numeric} \code{vector} giving the minimum
    (first value) and maximum (second value) validation error.  These
    are used as the endpoints of the color gradient used in plots number
    2 and 3 if \code{color.by.error} is \code{TRUE}. }

  \item{category.labels}{ text labels to be used in plot number 3 if
    \code{color.by.error} is \code{FALSE}.  A \code{character}
    \code{vector} with elements named \code{"normal"}, \code{"pruned"},
    \code{"levelbest"} and \code{"selected"}.  See the corresponding
    arguments with the name prefix \code{"fillcolor"}.  The vector must
    also have elements named \code{"special.levelbest"} and
    \code{"special.selected"}.  See the corresponding arguments with the
    name prefix \code{"bordercolor"}.  The final required elements are
    \code{"shape.normal"} and \code{"shape.highlighted"}, which
    correspond to rectangular and circular nodes, respectively.
    Circular shape highlights nodes that have the lowest validation
    error considering the number of inputs used.  Also highlighted is
    each node with the lowest validation error per number of variables
    but without using branches, if available and different from the
    unrestricted best node. }

  \item{integrate.colorkey}{ a \code{logical} flag.  If \code{TRUE},
    plots 2 (graph) and 3 (color and shape key for the graph) will be
    integrated if possible.  This involves a version requirement on the
    \code{"Rgraphviz"} package.  If \code{FALSE} or the version
    requirement is not met, the plots will be drawn separately. }

  \item{colorkey.gap}{ a \code{numeric} value giving the space (in
    inches) between the graph and the color key when plot 2 and 3 are
    integrated (\code{\var{integrate.colorkey}}). }

  \item{colorkey.space}{ location of the color and shape key (plot 3)
    relative to the graph (plot 2).  One of \code{"bottom"},
    \code{"right"}, \code{"top"} and \code{"left"}. }

  \item{colorkey.title.gp}{ graphical parameters for the titles in plot
    3. See \code{\link{gpar}}.  }

  \item{nodesep}{ a Graphviz attribute giving the minimum space in
    inches between adjacent nodes representing the same number of input
    variables.  This \code{numeric} value applies to plot number 2.  }

  \item{ranksep}{ a Graphviz attribute giving the minimum space in
    inches between adjacent rows or columns of nodes, where a row or
    column consists of nodes representing the same number of input
    variables.  This \code{numeric} value applies to plot number 2.  }

  \item{graph.attributes}{ a named \code{character} \code{vector} of
    extra Graphviz graph attributes.  Applies to plot number 2.  }

  \item{node.attributes}{ a named \code{character} \code{vector} of
    extra Graphviz node attributes.  Applies to plot number 2.  }

  \item{edge.attributes}{ a named \code{character} \code{vector} of
    extra Graphviz edge attributes.  Applies to plot number 2.  }

}
\details{

  In argument \code{plotArgs}, \code{\var{plotArgs}[[1]]} is passed to
  \code{\link{matplot}}, \code{\var{plotArgs}[[2]]} to the
  \link[Rgraphviz:plot-methods]{plot method} for class \code{"Ragraph"},
  and \code{\var{plotArgs}[[3]]} to \code{\link{draw.colorkey}$key}.

  For possible color values, see \code{\link{col2rgb}}.

}
\value{

  When \code{2 \%in\% \var{which}}, the function invisibly returns
  a graph of class \code{"\link[graph:graphNEL-class]{graphNEL}"}
  representing the search graph of a run of \code{\link{sisal}}.
  Otherwise \code{NULL}.

}
\author{
  Mikko Korpela
}
\seealso{
  \code{\link{sisal}}
}
\references{

  For information about graph, node and edge attributes for plot number
  2, see the Graphviz web site: \url{http://www.graphviz.org/}.

}
\examples{
library(graphics)
foo <- testSisal(dataset="toy", Mtimes=10)
## Plotting the search graph requires "Rgraphviz" and "graph"
if (requireNamespace("Rgraphviz", quietly=TRUE) &&
    requireNamespace("graph", quietly=TRUE)) {
    plot(foo, which=2)
}
## Default output is a mean squared error plot
plot(foo)
}
\keyword{hplot}
\keyword{graphs}
\keyword{IO}
