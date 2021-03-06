#' return package dependencies from NAMESPACE file
#'
#' @param path path to NAMESPACE file
#' @param document Run function document of devtools package
#'
#' @return a vector
#' @export
#' @importFrom stringr str_match
#' @importFrom stats setNames na.omit
#' @importFrom utils read.table
#'
#' @examples
#' tmpdir <- tempdir()
#' file.copy(system.file("dummypackage",package = "attachment"), tmpdir,
#'  recursive = TRUE)
#' dummypackage <- file.path(tmpdir, "dummypackage")
#' # browseURL(dummypackage)
#' att_from_namespace(path = file.path(dummypackage,"NAMESPACE"))

att_from_namespace <- function(path = "NAMESPACE", document = TRUE) {
  if (isTRUE(document)) {
    devtools::document(dirname(path))
  }
  readLines(path)
  base <- try(read.table(path)[["V1"]], silent = TRUE)
  if (!isTRUE(inherits(base, "try-error"))) {
    out <- na.omit(unique(c(
      unique(str_match(base, "importFrom\\(([[:alnum:]\\.]+),.*")[, 2]),
      unique(str_match(base, "import\\(([[:alnum:]\\.]+).*")[, 2])
  )))
  } else {
    out <- NULL
  }
  c(out, NULL)
}
