setwd("data/")

anthropometrics <- read.csv2(file = 'anthropometrics.csv', 
                             header = TRUE, 
                             sep = ",")
pathology <- read.csv2(file = 'pathology.csv', 
                       header = TRUE, 
                       sep = ",")
transcriptome <- read.csv2(file = 'transcriptome.csv', 
                       header = TRUE, 
                       sep = ",")
morphome <- read.csv2(file = 'morphome.csv', 
                       header = TRUE, 
                       sep = ",")
telomeres <- read.csv2(file = 'telomeres.csv', 
                       header = TRUE, 
                       sep = ",")