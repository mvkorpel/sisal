% File man/dynTextGrob.Rd
% This file is part of the sisal package for R.
% Copyright (C) 2015 Aalto University
% Distributed under GPL 2 or later

\encoding{UTF-8}
\name{dynTextGrob}
\alias{dynTextGrob}
\title{
  Create Text with Changing Size
}
\description{
  This function creates a text object.  When drawn, its size changes
  automatically according to the space available.
}
\usage{
dynTextGrob(label, x = 0.5, y = 0.5, width = 1, height = 1,
            default.units = "npc", just = c(0.5, 0.5),
            hjust = NULL, vjust = NULL, rot = 0, rotJust = TRUE,
            rotHjust = NULL, rotVjust = NULL, resize = TRUE,
            sizingWidth = NULL, sizingHeight = NULL,
            adjustJust = TRUE, takeMeasurements = FALSE,
            name = NULL, gp = gpar(), vp = NULL)
}
\arguments{

  \item{label}{ a \code{character} or \code{expression} vector, or a
    \code{list} containing both character strings and
    \link[=plotmath]{mathematical expressions}.  These are the text
    items to be drawn. }

  \item{x}{ a \code{numeric} vector or \code{unit} of x locations for
    the labels. }

  \item{y}{ a \code{numeric} vector or \code{unit} of y locations for
    the labels. }

  \item{width}{ the space available for the labels in the width
    direction of the viewport.  Used for computing the fontsize. }

  \item{height}{ the space available for the labels in the height
    direction of the viewport.  Used for computing the fontsize. }

  \item{default.units}{ default unit to use when dimensions or locations
    are unitless numbers.  See \code{\link{unit}}. }

  \item{just}{ a \code{numeric} or \code{character} vector with one or
    two elements for setting the same justification for all labels.  See
    \code{\link{textGrob}}. }

  \item{hjust}{ a \code{numeric} vector for setting horizontal
    justification of individual labels.  If given, overrides
    \code{just}. }

  \item{vjust}{ a \code{numeric} vector for setting vertical
    justification of individual labels.  If given, overrides
    \code{just}. }

  \item{rot}{ a \code{numeric} vector for setting the rotation angle of
    individual labels in degrees. }

  \item{rotJust}{ a \code{logical} vector which affects the
    justification of individual labels.  If an element is \code{FALSE},
    the corresponding label is first justified according to \code{hjust}
    (reading direction) and \code{vjust} (the perpendicular direction),
    then rotated.  This is the way a \code{\link{textGrob}} works.  If
    an element is \code{TRUE}, the concept is: align the label with the
    other labels according to \code{rotHjust} (reading direction) and
    \code{rotVjust} (the perpendicular direction), then rotate, and
    finally justify in the width and height directions of the viewport
    with \code{hjust} and \code{vjust}, respectively. }

  \item{rotHjust}{ a \code{numeric} vector or \code{NULL}.  When the
    corresponding element of \code{rotJust} is \code{TRUE},
    \code{rotHjust} sets the justification of a label in the reading
    direction.  If \code{NULL} or an \code{NA} element is encountered,
    an automatic value will be computed based on rotation angle
    (\code{rot}) and justification along the viewport axes (\code{just},
    \code{hjust} and \code{vjust}).  }

  \item{rotVjust}{ a \code{numeric} vector or \code{NULL}.  Set the
    justification of labels perpendicular to the reading direction when
    \code{rotJust} is \code{TRUE}.  See \code{rotHjust}. }

  \item{resize}{ a \code{logical} flag.  If \code{TRUE} (the default),
    the fontsize of the labels will be adjusted according to the space
    available.  If \code{FALSE}, the size will remain constant, even if
    the graphical object is drawn in a viewport with a different setting
    for the \code{"cex"} graphical parameter. }

  \item{sizingWidth}{ If \code{resize} is \code{TRUE}, a \code{numeric}
    value given here sets the width of the grob used when calculating
    fontsize at drawing time.  If \code{NULL} (the default), the size is
    computed from the actual dimensions of the labels.  }

  \item{sizingHeight}{ See \code{sizingWidth}, only height instead of
    width.  }

  \item{adjustJust}{ A \code{logical} flag.  If \code{TRUE} (the
    default), adjustments are made to the justification of the labels
    instead of passing the justification settings straight to the
    underlying \code{\link{textGrob}}(s).  The justification of labels
    given in \code{expression} form will be unified with the
    justification of \code{character} labels, meaning that a setting of
    \code{vjust = 0} will align the baselines of the labels and
    \code{vjust = 1} will align the labels at lineheight, or at a
    multiple of lineheight in case of multiline \code{character} labels.
    The labels will also be shifted so that there is room for
    descenders. }

  \item{takeMeasurements}{ A \code{logical} flag.  If \code{TRUE}, only
    measurements of labels will be returned instead of a graphical
    object.  An example of where this might be useful is when several
    labels should have the same fontsize but different graphical
    parameters such as color, or when the labels should be drawn in
    different viewports.  See the source of \code{sisalTable},
    particularly \code{makeContent.sisalTable}, for an example.  If
    \code{FALSE} (the default) a graphical object will be returned. }

  \item{name}{ a \code{character} string identifier for the graphical
    object returned by the function.  If \code{NULL} (the default), a
    name will be assigned automatically.  }

  \item{gp}{ graphical parameters.  See \code{\link{gpar}}. }

  \item{vp}{ a \code{"viewport"} object, the name of a viewport object,
    a \code{\link{vpPath}} object pointing to a viewport or \code{NULL}
    (the default).  If not \code{NULL}, this graphical object will be
    drawn in the given viewport.  The name or the path must point to a
    descendant of the viewport that is current at drawing time.  See
    \code{\link{current.vpPath}}, \code{\link{current.vpTree}},
    \code{\link{downViewport}} and \code{\link{grid.draw}}. }

}

\details{
  The number of labels created is the maximum of the lengths of \code{x}
  and \code{y}.  Variables are recycled to that length if necessary.

  All labels of one \code{"dynText"} grob have the same fontsize.

}
\value{

  If \code{takeMeasurements} is \code{FALSE} (the default), returns a
  \code{\link{grob}} of \code{class} \code{"dynText"}.  It can be drawn
  with \code{\link{grid.draw}}.

  If \code{takeMeasurements} is \code{TRUE}, returns a \code{list}
  containing measurements of the labels.

}
\author{
  Mikko Korpela
}
\seealso{
  See function \code{\link{textGrob}} in package
  \link[=grid-package]{grid}.
}
\examples{
library(grid)
grid.newpage()
grid.draw(dynTextGrob("Hello", vjust = 0, y = 0))
grid.draw(dynTextGrob(list(expression(y==x^2),
                           "Hello,\ntry resizing me!"),
                      x = rep(1, 2), y = 1, rot = -45,
                      hjust = 1, vjust = 1,
                      rotHjust = c(0, 1), rotVjust = 1))
}
\keyword{dplot}
