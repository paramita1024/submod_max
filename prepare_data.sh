
# input details
filename=liver
no_of_train=241
no_of_class=2
no_of_kernel=70
no_of_kernel_to_select=20
#other parameter
q=3.0
exp_no=0 #change later
#paths for smo-mkl
path_smo=/home/paramita/Documents/smo-mkl/
prefix="../MATLAB/submod_max/kernel/$filename"
kernel_file=$prefix"_kernel_file"
train_file=$prefix"_labels_train"
test_file=$prefix"_labels_test"
model_file=$prefix"_model_file"
out_file=$prefix"_out"
#path for current folder
current=/home/paramita/Documents/MATLAB/submod_max
# read the data , split into test and train , create kernels , writes them . 
  matlab -nodisplay -nodesktop -r "cd $current; run_init_mkl('$filename','$no_of_class') ; quit;"
# read all the kernels and create the covariance matrix
# create_covariance_matrix(int no_of_kernel , String file_kernel , String file_covariance) 
  java File_reading create_covariance_matrix  $no_of_kernel kernel/smo/$filename"_kernel" kernel/$filename"_covariance"
