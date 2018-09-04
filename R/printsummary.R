#' Print Summary
#' 
#' Wrapper for summary
#' 
#' @export
#' @param df_full some object or dataset
printsummary <- function(df_full){
  #override default 
  options(max.print=99999999);
  options(width=120);
  
    ##Calling the Data Cleaning function HERE!!
	#
	#
	#
	write.csv(df_full,"C:/opencpuapp_ip/cleaned_data.csv");
	
  ## 80% of the sample size
  smp_size <- floor(0.8 * nrow(df_full))
  
  ## set the seed to make your partition reproducible
  set.seed(123)
  train_ind <- sample(seq_len(nrow(df_full)), size = smp_size)
  
  train_from_user <- df_full[train_ind, ]
  test_from_user <- df_full[-train_ind, ]
  
  write.csv(train_from_user,"C:/opencpuapp_ip/train_comp.csv");
  write.csv(test_from_user,"C:/opencpuapp_ip/test_comp.csv");
  
  #print
  #print(summary(read.csv(paste("c:/opencpuapp_ip/",substr("c:/fakepath/train_comp.csv",13,nchar("c:/fakepath/train_comp.csv")),sep=""))))
  print(summary(df_full))
  invisible()
}
