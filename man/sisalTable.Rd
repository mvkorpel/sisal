% File man/sisalTable.Rd
% This file is part of the sisal package for R.
% Copyright (C) 2015 Aalto University
% Distributed under GPL 2 or later

\encoding{UTF-8}
\name{sisalTable}
\alias{sisalTable}
\title{
  Draw Table with Equally Sized Cells
}
\description{
  Draws a resizable or fixed-size table with equally sized cells.  Main
  title, axis (tick) labels and axis titles (left, bottom) are optional.
  Cells can have individual background and text colors and stripes.
}
\usage{
sisalTable(labels = matrix(seq_len(12), 3, 4),
           nRows = NROW(labels), nCols = NCOL(labels),
           bg = sample(colors(), nRows * nCols, replace = TRUE),
           stripeCol = NULL, fg = NULL, naFill = "white",
           naStripes = "grey50", main = NULL, xlab = NULL,
           ylab = NULL, xAxisLabels = NULL, yAxisLabels = NULL,
           draw = TRUE, outerRect = TRUE, innerLines = TRUE,
           nStripes = 7, stripeRot = 45, stripeWidth = 0.2,
           stripeScale = 0.95, resizeText = TRUE,
           resizeTable = TRUE, resizeMain = resizeText,
           resizeLab = resizeText, resizeAxes = resizeText,
           resizeLabels = resizeTable && resizeText,
           x = unit(0.5, "npc"), y = unit(0.5, "npc"),
           width = unit(0.97, "npc"), height = unit(0.97, "npc"),
           default.units = "npc", just = "center",
           clip = "inherit", xAxisRot = 0, yAxisRot = 0,
           xAxisJust = c(0.5, 1), xAxisX = 0.5, xAxisY = 1,
           yAxisJust = c(1, 0.5), yAxisX = 1, yAxisY = 0.5,
           mainMargin = if (resizeMain) 0.15 else unit(8, "points"),
           xlabMargin = if (resizeLab) 0.1 else unit(5, "points"),
           ylabMargin = if (resizeLab) 0.1 else unit(5, "points"),
           axesMargin = if (resizeAxes) 0.1 else unit(5, "points"),
           axesSize = 0.8, forceAxesSize = FALSE,
           mainSize = 1, xlabSize = 1, ylabSize = 1,
           mainPar = gpar(fontface = "bold", fontsize = 14),
           labPar = gpar(fontface = "plain", fontsize = 14),
           labelPars = gpar(fontsize = 20, cex = 0.6),
           axesPar = gpar(fontsize = 10),
           rectPar = gpar(), linePar = gpar(),
           name = NULL, gp = NULL, vp = NULL)
}
\arguments{

  \item{labels}{ the labels to use in the table cells.  A \code{list} or
    an \code{atomic} \code{vector} containing something that can be
    displayed as text, e.g. \code{character} values.  One element is
    used for each cell.  If the object has a \code{"dim"} attribute
    (\code{\link{matrix}}, \code{\link{array}}), it is used for
    determining the number of rows and columns in the table.

    \code{NA} means no text.  }

  \item{nRows}{ the number of rows in the table. A positive integral
    number.  }

  \item{nCols}{ the number of columns in the table. A positive integral
    number.  }

  \item{bg}{ the background colors of the table cells.  One element is
    used for each cell.   }

  \item{stripeCol}{ an optional \code{vector} of colors.  If used,
    indicates the color of stripes to be painted on top of the
    background color in each table cell.  One element is used for each
    table cell.  \code{NA} means no stripes.  }

  \item{fg}{ the text colors of the table cells.  One element is used
    for each cell.  If \code{NULL} (the default), black or white text is
    used so that the contrast between foreground and background is
    maximized. }

  \item{naFill}{ background color to use when the label of a table cell
    is \code{NA}.  This is a single color value. }

  \item{naStripes}{ table cells with an \code{NA} label are indicated
    with stripes.  This is the color of the stripes, a single color
    value.  The stripes can be hidden by using a value identical with
    that of \code{\var{naFill}}.  }

  \item{main}{ the main title of the plot. }

  \item{xlab}{ a title for the x axis. }

  \item{ylab}{ a title for the y axis. }

  \item{xAxisLabels}{ a label for each column of the table. }

  \item{yAxisLabels}{ a label for each row of the table. }

  \item{draw}{ a \code{logical} flag indicating whether to draw the
    table.  If \code{FALSE}, no drawing is done.  }

  \item{outerRect}{ a \code{logical} flag indicating whether a rectangle
    will be drawn around the table. }

  \item{innerLines}{ a \code{logical} flag indicating whether line
    segments will be drawn between the table cells. }

  \item{nStripes}{ a positive integral number giving the number of
    stripes to be drawn in table cells.  Only applies to those cells
    where stripes are used, i.e. when the relevant element of
    \code{\var{label}} is \code{NA} or \code{\var{stripeCol}} is not
    \code{NA}.  The stripes are spaced evenly.  Defaults to \code{7}. }

  \item{stripeRot}{ an integral number giving the rotation angle
    (degrees, counterclockwise) of the stripes used in table cells.
    Defaults to \code{45} which means diagonal stripes parallel to a
    line segment between the lower left corner and the upper right
    corner of the cell.  Value \code{0} means horizontal and \code{90}
    vertical stripes.  }

  \item{stripeWidth}{ a \code{numerical} value giving the width of the
    stripes used in cells as a proportion of the available width.
    Values between \code{0} and \code{1} are allowed, excluding the
    endpoints.  Defaults to \code{0.2}. }

  \item{stripeScale}{ a \code{numerical} value indicating the proportion
    of the area of a table cell to be used for the stripe pattern.  The
    pattern is always centered, and the possible empty space is left on
    the borders of the cell.  Values between \code{0} and \code{1} are
    allowed, including the endpoints.  Defaults to \code{0.95}. }

  \item{resizeText}{ a \code{logical} flag indicating whether to use
    dynamic text size.  This is only used as the default value of
    \code{\var{resizeMain}}, \code{\var{resizeLab}},
    \code{\var{resizeLabels}} and \code{\var{resizeAxes}}.  Defaults to
    \code{TRUE}. }

  \item{resizeTable}{ a \code{logical} flag indicating whether the size
    of the table will depend on the size of the main
    \code{\link{viewport}}, which itself may be static or depend on the
    size of the graphical device.  Defaults to \code{TRUE}.  See
    \sQuote{Details}.  }

  \item{resizeMain}{ a \code{logical} flag indicating whether the main
    title will be resizable. }

  \item{resizeLab}{ a \code{logical} flag indicating whether the the x
    axis and y axis titles will be resizable. }

  \item{resizeLabels}{ a \code{logical} flag indicating whether the
    labels used in the table cells will be resizable. }

  \item{resizeAxes}{ a \code{logical} flag indicating whether the row
    and column labels will be resizable. }

  \item{x}{ a \code{numeric} vector or \code{unit} object of length one
    specifying the x location of the graphical object. }

  \item{y}{ a \code{numeric} vector or \code{unit} object of length one
    specifying the y location of the graphical object. }

  \item{width}{ a \code{numeric} vector or \code{unit} object of length
    one specifying the width of the graphical object.  See
    \sQuote{Details}. }

  \item{height}{ a \code{numeric} vector or \code{unit} object of length
    one specifying the height of the graphical object.  See
    \sQuote{Details}.}

  \item{default.units}{ a \code{character} string indicating the
    \code{\link{unit}} to use for \code{numeric} values of
    \code{\var{x}}, \code{\var{y}}, \code{\var{width}} and
    \code{\var{height}}.  }

  \item{just}{ a \code{character} or \code{numeric} vector of one or two
    values specifying the justification of the graphical object relative
    to its (x, y) location.  See \code{\link{viewport}}. }

  \item{clip}{ a \code{character} string specifying what to do if the
    graphical object overflows the \code{\link{viewport}} reserved for
    it.  See \sQuote{Details}. }

  \item{xAxisRot}{ a \code{numeric} value giving the rotation angle of
    the column labels in degrees. }

  \item{yAxisRot}{ a \code{numeric} value giving the rotation angle of
    the row labels in degrees. }

  \item{xAxisJust}{ justification setting for column labels.  A
    \code{numeric} or \code{character} vector.  Rotation (if any) will
    be done \emph{before} justification.  See \var{just} in
    \code{textGrob} for possible values. }

  \item{xAxisX}{ x location of column labels relative to the space
    allocated for them.  A \code{numeric} value where \code{0} means
    left and \code{1} right. }

  \item{xAxisY}{ y location of column labels relative to the space
    allocated for them.  A \code{numeric} value where \code{0} means
    bottom and \code{1} top. }

  \item{yAxisJust}{ justification setting for row labels.  A
    \code{numeric} or \code{character} vector.  See
    \code{\var{xAxisJust}}. }

  \item{yAxisX}{ x location of row labels relative to the space
    allocated for them.  A \code{numeric} value where \code{0} means
    left and \code{1} right. }

  \item{yAxisY}{ y location of row labels relative to the space
    allocated for them.  A \code{numeric} value where \code{0} means
    bottom and \code{1} top. }

  \item{mainMargin}{ size of the margin between the main title and the
    table. }

  \item{xlabMargin}{ size of the margin between the x axis title and
    the next graphical object towards the table. }

  \item{ylabMargin}{ size of the margin between the y axis title and
    the next graphical object towards the table. }

  \item{axesMargin}{ size of the margin between the row or column labels
    and the table. }

  \item{axesSize}{ a positive \code{numeric} value specifying the
    desired ratio of fontsize in row and column labels to fontsize in
    table cells. }

  \item{forceAxesSize}{ a \code{logical} flag.  If \code{TRUE}, the
    function will reduce the size of text in table cells if it is
    necessary in order to achieve the desired \code{\var{axesSize}}.  }

  \item{mainSize}{ scale factor for fontsize of main title.  A positive
    \code{numeric} value.  Only effective when \code{\var{resizeMain}} is
    \code{TRUE}. }

  \item{xlabSize}{ scale factor for fontsize of x axis title.  A
    positive \code{numeric} value.  Only effective when
    \code{\var{resizeLab}} is \code{TRUE}.  }

  \item{ylabSize}{ scale factor for fontsize of y axis title.  A
    positive \code{numeric} value.  Only effective when
    \code{\var{resizeLab}} is \code{TRUE}.  }

  \item{mainPar}{ graphical parameters for the main title. }

  \item{labPar}{ graphical parameters for x and y axis titles. }

  \item{labelPars}{ graphical parameters for labels used in table cells.
    Can also be a list, one element for each table cell, recycled if
    necessary.  }

  \item{axesPar}{ graphical parameters for row and column labels. }

  \item{rectPar}{ graphical parameters for the rectangle around the
    table. }

  \item{linePar}{ graphical parameters for the line segments between
    table cells. }

  \item{name}{ a \code{character} string identifier for the graphical
    object returned by the function.  If \code{NULL} (the default), a
    name will be assigned automatically.  }

  \item{gp}{ graphical parameters for the whole object. }

  \item{vp}{ a \code{"viewport"} object, the name of a viewport object,
    a \code{\link{vpPath}} object pointing to a viewport or \code{NULL}
    (the default).  If not \code{NULL}, this graphical object will be
    drawn in the given viewport.  The name or the path must point to a
    descendant of the current viewport.  See
    \code{\link{current.vpPath}}, \code{\link{current.vpTree}},
    \code{\link{downViewport}} and \code{\link{grid.draw}}. }

}
\details{

  This function was written to be used with \code{\link{plotSelected}}
  but it should be generic enough to be useful for other purposes, too.

  The color and text vectors (including matrices and arrays) pointing to
  table cells (\code{\var{labels}}, \code{\var{bg}},
  \code{\var{stripeCol}}, \code{\var{fg}}) are interpreted in
  column-major order, like linear indexing of a \code{matrix}.  Each
  \code{data.frame} argument is collapsed to a list by combining its
  columns.  Finally, values are recycled if needed, also in
  \code{\var{xAxisLabels}} and \code{\var{yAxisLabels}}.

  For possible color values, see \code{\link{col2rgb}}.

  In the various text objects, mathematical annotation (see
  \link{plotmath}) is supported in addition to \code{character} values.

  For information on setting graphical parameters (\code{\var{gp}},
  \code{\var{mainPar}}, \code{\var{labPar}}, \ldots), see
  \code{\link{gpar}}.

  The graphical object returned is a \code{\link{gTree}} which contains
  a \code{\link{gList}} of graphical objects and a \code{\link{vpTree}}
  of viewports.  The child viewports are placed inside the parent using
  a \code{\link{grid.layout}}.  The size of the whole object is the size
  of the parent viewport.  It will be fixed or depend on the space
  available to it:

  \itemize{

    \item If all graphical elements are non-resizable (but
    \code{\var{resizeLabels}} can be \code{TRUE}), a suitable fixed size
    will be computed.

    \item Otherwise, the size is determined by \code{\var{width}} and
    \code{\var{height}}.  However, if there are non-resizable elements,
    the graphical object may be larger than that.

  }

  The graphical object will not use any excess space.  In other words,
  the width and height reported by \code{\link{grobWidth}} and
  \code{\link{grobHeight}} are tight.  It is possible that some parts of
  the plot may overflow their assigned space and the bounds computed for
  the whole graphical object.  Examples include using large fixed-size
  text elements or large values of the \code{\link{gpar}} graphical
  parameter \code{"cex"}.  Clipping can be adjusted through
  \code{\var{clip}}.

  If \code{\var{resizeAxes}} is \code{TRUE}, \code{\var{axesMargin}}
  must be a non-negative \code{numeric} value giving the size of the
  margin as a proportion of the side length of a table cell.  If
  \code{\var{resizeAxes}} is \code{FALSE}, \code{\var{axesMargin}} can
  also be a \code{\link{unit}} object.  The arguments
  \code{\var{mainMargin}} and \code{\var{labMargin}} are analogous to
  \code{\var{axesMargin}}.

}

\value{
  The function is usually called for the side effect (a plot is drawn),
  but it also returns a \code{\link{grob}} representation of the plot.
  The returned object is a custom \code{\link{gTree}} of class
  \code{"sisalTable"}.
}
\author{
  Mikko Korpela
}
\examples{
library(grDevices)
library(grid)
## Default: 3 by 4 table with labels 1:12 and random background colors
grid.newpage()
sisalTable()

## Four examples in a grid layout
rowCol <- c(1, 18, 2, 18, 1)
lo <- grid.layout(nrow = 5, ncol = 5,
                  widths = rowCol, heights = rowCol)
grid.newpage()
pushViewport(viewport(layout = lo, name = "bgLayout"))
grid.rect(gp=gpar(fill="grey75", col="grey75"))

rNames <- c("topmargin", "top", "hspace", "bottom", "bottommargin")
cNames <- c("leftmargin", "left", "vspace", "right", "rightmargin")
for (Row in c(2, 4)) {
    for (Col in c(2, 4)) {
        pushViewport(viewport(layout.pos.row = Row,
                              layout.pos.col = Col,
                              name = paste(rNames[Row],
                                           cNames[Col], sep="")))
        grid.rect(gp=gpar(fill="cadetblue"))
        upViewport(1)
    }
}

colors1Vec <- terrain.colors(12)
colors1Mat <- matrix(colors1Vec, 3, 4)
labels1Vec <- sample(c(letters, LETTERS), 12)
labels1Mat <- matrix(labels1Vec, 3, 4)

## Column vector, aligned with the right side of the viewport
longText <- rep("", 12)
longText[3] <- "a longish piece of text"
longText[9] <- "and some more"
sisalTable(labels1Vec, bg = colors1Vec, vp = "topleft",
           x = 1, just = "right",
           yAxisLabels = longText, xAxisLabels = "Boo")

## Matrix, zero margin
downViewport("topright")
sisalTable(labels1Mat, bg = colors1Mat,
           width = 1, height = 1, name = "trPlot",
           xAxisLabels = 1:4, yAxisLabels = LETTERS[1:3])
grid.rect(width = grobWidth("trPlot"), height = grobHeight("trPlot"),
          gp = gpar(lty="dashed", col = "white", lwd = 2))
upViewport(1)

## Transpose of matrix, width and height 0.75 "npc" units
downViewport("bottomleft")
sisalTable(t(labels1Mat), bg = t(colors1Mat),
           width = 0.75, height = 0.75, name = "blPlot",
           yAxisLabels = 1:4, xAxisLabels = LETTERS[1:3])
grid.rect(width = grobWidth("blPlot"), height = grobHeight("blPlot"),
          gp = gpar(lty="dashed", col = "white", lwd = 2))
upViewport(1)

## ?plotmath, some cells with no background color
labels2 <- expression(x^{y+x}, sqrt(x), bolditalic(x), NA)
bgCol <- c(rep("white", 3), NA)
sisalTable(labels2, nRows=3, nCols=5, bg = bgCol, naFill = NA,
           naStripes = "darkmagenta", vp="bottomright",
           main = "plotmath text")
}
\keyword{hplot}
