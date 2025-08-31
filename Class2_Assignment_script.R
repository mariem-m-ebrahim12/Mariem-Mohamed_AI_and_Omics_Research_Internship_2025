#Function to classify_gene

classify_gene <- function(logFC, padj){
  result <- ifelse(padj < 0.05 & logFC > 1, "Upregulated",
                   ifelse(padj < 0.05 & logFC < -1, "Downregulated", 
                          "Not_significant"))
  return(result)
}

classify_gene(-3.704878,0.000474)  #check the function


#the output and input folders 
input_dir <- "raw_data"
outpur_dir <- "results"

#choose our data 
our_datasets <- c("DEGs_Data_1.csv", "DEGs_Data_2.csv")
# the list for the results 
results <- list()


 # Loop to process the data 

for (datasets in our_datasets){
  cat("\nprocessing:", datasets,"\n")
  
  input_file_path <- file.path(input_dir, datasets)
  
  data <- read.csv(input_file_path, header=TRUE)
  cat("File imported successfully....Now check for missing values")
  
  #handling missing values
  if("padj" %in% names(data)){
    missing_count <- sum(is.na(data$padj))
    
    cat("NA value in padj =",missing_count,"\n")
    data$padj[is.na(data$padj)] <- 1
  }
  
  cat("No missing data\n")
  #classifying of th genes (adding new column "status")
  
  data$status <- classify_gene(data$logFC,data$padj)
  
  #save result in R
  results[[datasets]] <- data
  #save result in results folder
  
  output_file_path <- file.path(outpur_dir, paste0("status_result_",datasets))
  write.csv(data, output_file_path, row.names = FALSE)
  cat("results saved successfuly to", output_file_path, "\n")
  status_summary <- table(data$status)
  cat("\nsummary for the status:\n")
  print(status_summary)
}

first_data <- results[[1]]
second_data <- results[[2]]

status_summary <- table(data$status)
status_summary


save.image(file="Mariem Mohamed_Class_2_Assignment.RData")










