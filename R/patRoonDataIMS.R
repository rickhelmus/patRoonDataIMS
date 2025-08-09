#' Test IMS-HRMS data for the patRoon package
#'
#' A small set of LC-IMS-HRMS data to test and demonstrate the functionality of patRoon.
#'
#' This package contains data files from (1) a standard mixture containing various contaminants and (2) a blank. Both
#' were analysed in triplicate, using an Shimadzu Nexera UHPLC coupled to Bruker timsTOF Pro 2.0 using positive and
#' negative electrospray ionization. See also the \href{https://github.com/rickhelmus/patRoonData}{patRoonData} package
#' for example LC-HRMS data.
#'
#' The complete data processing script can be found in data-raw/process.R
#'
#' @param polarity Either \code{"positive"} or \code{"negative"}.
#'
#' @author Jan C. Specker, Patricia Aguilar-Alarcón and Rick Helmus
#'
#' @name patRoonDataIMS
NULL

assertPolarity <- function(polarity)
{
    if (length(polarity) != 1 || !polarity %in% c("positive", "negative"))
        stop("polarity should be 'positive' or 'negative'", call. = FALSE)
}

#' @details \code{exampleDataPath} is a helper function that returns the file path of the example data.
#' @rdname patRoonDataIMS
#' @export
exampleDataPath <- function(polarity = "positive", type = "ims")
{
    assertPolarity(polarity)
    if (!identical(type, "raw") && !identical(type, "ims") && !identical(type, "centroid"))
        stop("type should be either 'raw', 'ims' or 'centroid'", call. = FALSE)
    return(file.path(getOption("patRoonDataIMS.path"), polarity, type)) # UNDONE
    system.file(file.path("extdata", type, if (polarity == "positive") "pos" else "neg"), package = "patRoonDataIMS")
}

#' @details \code{exampleAnalysisInfo} is a helper function that generate analysis information that can be directly used
#'   by \pkg{patRoon}.
#' @rdname patRoonDataIMS
#' @export
exampleAnalysisInfo <- function(polarity = "positive")
{
    assertPolarity(polarity)
    if (!requireNamespace("patRoon", quietly = TRUE))
        stop("Please make sure that patRoon is installed!", call. = FALSE)
    suffix <- if (polarity == "positive") "pos" else "neg"
    ret <- patRoon::generateAnalysisInfo(fromCentroid = exampleDataPath(polarity, "centroid"),
                                         fromIMS = exampleDataPath(polarity, "ims"),
                                         fromRaw = exampleDataPath(polarity, "raw"),
                                         replicate = c(rep(paste0("blank-", suffix), 3),
                                                       rep(paste0("standard-", suffix), 3)),
                                         blank = paste0("blank-", suffix))
    return(ret)
}

#' Example suspect lists
#'
#' The \code{suspectsPos} and \code{suspectsNeg} datasets are example suspect lists for a set of environmental
#' contaminants (measured in positive and negative ionization, respectively). The datasets can be directly used with the
#' \code{\link[patRoon]{screenSuspects}} function.
#'
#' @format A \code{data.frame} with column \code{name}, \code{mz}, \code{rt} and \code{SMILES}, specifying the analyte
#'   name, \emph{m/z}, retention time (in seconds) and SMILES, respectively.
#' @name suspects
#' @author Jan C. Specker, Patricia Aguilar-Alarcón and Rick Helmus
#' @keywords datasets
NULL

#' @aliases suspectsPos
#' @rdname suspects
"suspectsPos"

#' @aliases suspectsNeg
#' @rdname suspects
"suspectsNeg"

