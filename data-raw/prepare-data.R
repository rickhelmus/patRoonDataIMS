devtools::load_all(".")

suspectsPos <- read.csv(file.path("data-raw", "suspects-pos.csv"), check.names = FALSE)
suspectsNeg <- read.csv(file.path("data-raw", "suspects-neg.csv"), check.names = FALSE)

ISTDListPos <- read.csv(file.path("data-raw", "istds-pos.csv"), check.names = FALSE)
ISTDListNeg <- read.csv(file.path("data-raw", "istds-neg.csv"), check.names = FALSE)

usethis::use_data(suspectsPos, suspectsNeg, ISTDListPos, ISTDListNeg, overwrite = TRUE)

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
