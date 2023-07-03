library("singleCellTKPlus")
context("testing example data")

data()
data("musicBulkexample")
data(musicSCEexample)

inSCE <- runMusic(inSCE = musicSCEexample,
                  bulkData = musicBulkexample,
                 analysisName = "testSingleCellClust",
                 clusters = 'cellType', groups = 'clusterType', 
                 samples = 'sampleID',  
                 analysisType ="SingleCellClust")

inSCE <- runMusic(bulkData = musicBulkexample, 
                 inSCE = musicSCEexample,
                 clusters = 'cellType', groups = 'clusterType', 
                 samples = 'sampleID',  
                 analysisType ="EstCellProp", 
                 analysisName = "testEstCellProp")


test_that("Input SCE is correct", {
  expect_equal(class(musicSCEexample)[1],"SingleCellExperiment")
})

test_that("Input bulk is correct", {
  expect_equal(class(musicBulkexample)[1],"matrix")
})

#estplot <- plotMusicResults(inSCE, analysisType ="EstCellProp", analysisName = "testEstCellProp", heatmapTitle = "test")
#singlecellplot<- plotMusicResults(inSCE, analysisType ="SingleCellClust", analysisName = "testSingleCellClust")

test_that(desc = "plotting test", {
  
 # expect_equal(class(estplot)[1], "gg")
})
  






  
  