# practice exercises

## 1. Check Cholesterol level (using if) 
# Write an If statement to check cholesterol level is greater than 240, 
# if true, it will prints “High Cholesterol”

cholesterol <- 230

if (cholesterol > 240 ) {print("High cholesterol")}

#----------------------------------------------------------------

## 2. Blood Pressure Status (using if...else)
# Write an if…else statement to check if blood pressure is normal.
# If it’s less than 120, print: “Blood Pressure is normal”
# If false then print: “Blood Pressure is high”


Systolic_bp <- 130

if (Systolic_bp < 120) {
  print("Blood Pressure is normal")
} else{
  print("Blood Pressure is high")
}

#-----------------------------------------------------------------------

## 3. Automating Data Type Conversion with for loop

# Use patient_info.csv data and metadata.csv
# Perform the following steps separately on each dataset (patient_info.csv data and metadata.csv)
# Create a copy of the dataset to work on.
# Identify all columns that should be converted to factor type.
# Store their names in a variable (factor_cols).

patient_info <- read.csv(file.choose())
data <- read.csv(file.choose())

clean_patient_info <- patient_info
str(clean_patient_info)
factor_cols <- c("gender", "diagnosis", "smoker")

for (i in factor_cols){
  clean_patient_info[[i]] <- as.factor(clean_patient_info[[i]])
}

str(clean_patient_info)

     #   -----------------------------------------------  #
clean_data <- data
str(clean_data)
factor_cols2 <- c("height", "gender")

for (x in factor_cols2) {
  clean_data[[x]] <- as.factor(clean_data[[x]])
}

# Convert 'height' column to an ordered factor
# so that "Short" < "Medium" < "Tall" instead of alphabetical order

clean_data$height <- factor(clean_data$height,
                            levels = c("Short", "Medium", "Tall"),
                            ordered = TRUE)  
str(clean_data)

#---------------------------------------------------------------------------------

## 4. Converting Factors to Numeric Codes

# Choose one or more factor columns (e.g., smoking_status).
# Convert "Yes" to 1 and "No" to 0 using a for loop.

# for clean_patient_info

numeric_codes1 <- c("diagnosis")

for (i in numeric_codes1) {
  clean_patient_info[[i]] <- ifelse(clean_patient_info[[i]] == "Cancer", 1, 0)
}

#for clean data

numeric_codes2 <- c("gender")


for (i in numeric_codes2) {
  clean_data[[i]] <- ifelse(clean_data[[i]] == "Female", 1, 0)
}
 
#-----------------------------------------------------------------------

#  Verification:

str(patient_info)
str(clean_patient_info)

str(data)
str(clean_data)





