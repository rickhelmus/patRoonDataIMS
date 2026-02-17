source("utils.R")

url <- "https://zenodo.org/records/18668591/files/patRoonDataIMS.zip"
chkSum <- "83cc0d061fd8e99e8f4591f98cc5793178d76c8bcbc6f34650d1ce94992ca894"

destPath <- file.path("..", "inst", "extdata")
dlPath <- tempdir()
destFile <- "patRoonDataIMS.zip"
dir.create(destPath, recursive = TRUE, showWarnings = FALSE)

if (!downloadFile("patRoonDataIMS files", url, file.path(dlPath, destFile), chkSum))
{
    stop("Failed to download patRoonDataIMS files")
}
unzipFile(file.path(dlPath, destFile), destPath, "patRoonDataIMS files", clear = TRUE)
