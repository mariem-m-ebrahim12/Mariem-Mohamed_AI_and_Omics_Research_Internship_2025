install.packages("dplyr")

#sub folder 
dir.create("raw_data")
dir.create("clean_data")
dir.create("scripts")
dir.create("results")
dir.create("plots")

#import data

data <- read.csv(file.choose())

# view the data and check the structure of it 
View(data)

str(data)

## Identify variables with incorrect or inconsistent data types
  # "gender" need to convert into factor
  # "diagnoses" need to convert into factor 
  # "smoker" need to covert into factor 


# conver gender into factor 

data$gender_fac <- as.factor(data$gender)
class(data$gender_fac)
levels(data$gender_fac)

#convert diagnosis into factor

data$diagnosis_fac <- as.factor(data$diagnosis)
class(data$diagnosis_fac)
levels(data$diagnosis_fac)

#convert smoker into factor 

data$smoker_fac <- as.factor(data$smoker)
class(data$smoker_fac)
levels(data$smoker_fac)

#new variable for smoker as binary factor
data$smoker_num <- ifelse(data$smoker_fac == "Yes", 1, 0)
class(data$smoker_num)
levels(data$smoker_num)
data$smoker_num <- as.factor(data$smoker_num)
class(data$smoker_num)
##creat a clean dataset
  #load the package 
library("dplyr")

clean_data <- data %>% select(patient_id, age, gender_fac, diagnosis_fac, bmi, smoker_fac, smoker_num)
View(clean_data)

#save clean data
write.csv(clean_data, file = "clean_data/patient_info_clean.csv")
save.image(file = "Mariem Mohamed_Class_Ib_Assignment.RData")


