setwd("C:/Users/nicol/OneDrive/Documents/GitHub/prostate_project/data")

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

#----focus on anthropometrics----

summary(anthropometrics)

#the features are load as characters so we need to modify their classes to study them
anthropometrics$AGE_ACTUAL <- as.factor(anthropometrics$AGE_ACTUAL)
anthropometrics$SEX <- as.factor(anthropometrics$SEX)
anthropometrics$COHORT <- as.factor(anthropometrics$COHORT)
anthropometrics$HARDY_SCALE<- as.factor(anthropometrics$HARDY_SCALE)
anthropometrics$BMI <- as.factor(anthropometrics$BMI)
anthropometrics$WEIGHT <- as.factor(anthropometrics$WEIGHT)
anthropometrics$HEIGHT <- as.factor(anthropometrics$HEIGHT)
anthropometrics$AGE_GAP <- as.numeric(anthropometrics$AGE_GAP)
anthropometrics$ISCHEMIC_TIME <- as.numeric(anthropometrics$ISCHEMIC_TIME)

summary(anthropometrics)

#plot the distribution of the 9 variables
par(mfrow = c(3, 3))
features =c(colnames(anthropometrics))
n_features = length(features)
features <- features[2:n_features] # excluding the subj id column
for (feature in features) {
  if (is.numeric(anthropometrics[[feature]])) {
    hist(anthropometrics[[feature]], main = feature, freq = FALSE, xlab = feature)
  } else {
    plot(anthropometrics[feature], main = feature)
  }
}

#quantify the asymmetry of the two cohorts
n_donor = sum(anthropometrics$COHORT == 0)
n_postmortem = sum(anthropometrics$COHORT == 1)
prop_donor = ( n_donor / (n_donor+n_postmortem)) * 100
prop_postmortem = 100 - prop_donor
message(round(prop_donor, 2), '% of organ donor')
message(round(prop_postmortem, 2), '% of organ donor')

#quantify the proportion of the circumstances of death
n_0 = sum(anthropometrics$HARDY_SCALE == '0.0')
n_1 = sum(anthropometrics$HARDY_SCALE == '1.0')
n_2 = sum(anthropometrics$HARDY_SCALE == '2.0')
n_3 = sum(anthropometrics$HARDY_SCALE == '3.0')
n_4 = sum(anthropometrics$HARDY_SCALE == '4.0')
total = sum(c(n_0, n_1, n_2, n_3, n_4))
prop_0 = n_0 / total
prop_1 = n_1 / total
prop_2 = n_2 / total
prop_3 = n_3 / total
prop_4 = n_4 / total
message(round(prop_0*100, 2), '% of organ donor')
message(round(prop_1*100, 2), '% of organ donor')
message(round(prop_2*100, 2), '% of organ donor')
message(round(prop_3*100, 2), '% of organ donor')
message(round(prop_4*100, 2), '% of organ donor')
(prop_0 + prop_2) * 100
