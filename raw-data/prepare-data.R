devtools::load_all(".")

# UNDONE
suspectsPos <- suspectsNeg <- data.frame()
# suspectsPos <- read.csv(system.file("data-raw", "suspects-pos.csv", package = "patRoonDataIMS"), stringsAsFactors = FALSE)
# suspectsNeg <- read.csv(system.file("data-raw", "suspects-neg.csv", package = "patRoonDataIMS"), stringsAsFactors = FALSE)

usethis::use_data(suspectsPos, suspectsNeg, overwrite = TRUE)

for (pol in c("positive", "negative"))
{
    ai <- patRoon::generateAnalysisInfo(fromRaw = exampleDataPath(pol, "raw"),
                                        convIMS = exampleDataPath(pol, "ims"),
                                        convCentroid = exampleDataPath(pol, "centroid"))
    patRoon::convertMSFiles(ai, formatFrom = "bruker_ims", typeTo = "ims", overwrite = TRUE,
                            algorithm = "timsconvert")
    patRoon::convertMSFiles(ai, formatFrom = "bruker_ims", typeTo = "centroid", overwrite = TRUE,
                            algorithm = "im_collapse", includeMSMS = TRUE)
}
