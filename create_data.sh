# call "sh create_data.sh < filename split_fraction current kernel_prefix kernel_prefix_smo cov data test train"
# data create
read filename split_fraction current kernel_prefix kernel_prefix_smo cov data test train
# read the data , split into test and train , create kernels , writes them . 
# write no_of_class no_of_kernel no_of_train to filename_data_info file
# also create covariance
  matlab -nodisplay -nodesktop -r "cd $current; run_init_mkl('$split_fraction','$kernel_prefix' ,'$kernel_prefix_smo','$data','$test','$train',$cov') ; quit;" 
