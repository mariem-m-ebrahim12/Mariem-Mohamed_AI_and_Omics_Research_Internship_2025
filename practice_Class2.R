#define the input and output folders
input_dir <- "raw_data"
output_dir <- "results"
#check if they already exist if not create it

if(!dir.exists(output_dir)){
  dir.create(ourput_dir)
  
}

#the files that we will process
 processed_file <- c("BMI_data_1.csv", "BMI_data_2.csv")
 
 #empty list to store the results 
 result <- list()
 
 #function for BMI calculation
calculated_BMI <- function(weight, height){
  bmi <- weight / (height^2)
  return(bmi)
}

 # For each file with in a loop:
 #       - import data
 #       - handle NA values
 #       - calculate BMI using calculate_BMI function
 #       - save results (both as CSV and inside R list)
 
 
 
 for (practice_files in processed_file){
   cat("/nprocessing:",practice_files,"/n")
   
   input_file_path <- file.path(input_dir, practice_files)
   data <- read.csv(input_file_path, header = TRUE)
   cat("file imported. cheking for missing vales...\n")
   
   #for handling missing values
   
   if("height" %in% names(data)){
     missing_count <- sum(is.na(data$height))
     
     cat("missing value in 'height':", missing_count,"\n")
     
     data$height[is.na(data$height)] <- mean(data$height, na.rm = TRUE )
   }
     if ("weight" %in% names(data)){
       missing_count <- sum(is.na(data$weight))
       cat("missing value in'weight':", missing_count,"\n")
       
       data$weight[is.na(data$weight)] <- mean(data$weight, na.rm = TRUE)
       
     }
   if ("age" %in% names(data)){
     missing_count <- sum(is.na(data$age))
     cat("missing value in'age':", missing_count,"\n")
     
     data$age[is.na(data$age)] <- mean(data$age, na.rm = TRUE)
     
   }
     
   cat ("now there is no missing values")
   
  #calculate bmi using the function made before 
   #store it i column named BMI
    data$BMI <- calculated_BMI(data$weight,data$height)
    cat("BMI has been calculated successfully.\n")
    
    
    #save result in the list maded before "result" in R
    result[[practice_files]] <- data
    
    #save file in result folder 
    output_file_path <- file.path(output_dir, paste0("BMI_result_",practice_files))
    write.csv(data, output_file_path, row.names = FALSE)
    cat("Results saved to:", output_file_path, "\n")
   
 }


results_1 <- result[[1]]
results_2 <- result[[2]]