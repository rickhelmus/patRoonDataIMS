devtools::load_all(".")

# UNDONE
suspectsPos <- suspectsNeg <- data.frame()
# suspectsPos <- read.csv(system.file("data-raw", "suspects-pos.csv", package = "patRoonDataIMS"), stringsAsFactors = FALSE)
# suspectsNeg <- read.csv(system.file("data-raw", "suspects-neg.csv", package = "patRoonDataIMS"), stringsAsFactors = FALSE)

usethis::use_data(suspectsPos, suspectsNeg, overwrite = TRUE)
