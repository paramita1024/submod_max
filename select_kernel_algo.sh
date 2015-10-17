# select_kernel_algo
# write input parameters
filename=liver
q=3
delta=1
split_fraction=.7
kernel_sel=kernel/$filename"_kernel_selected"
kernel_prefix=kernel/mkl/$filename"_kernel"
kernel_prefix_smo=kernel/smo/$filename"_kernel_"
cov=kernel/$filename"_covariance"
data=data/$filename
test=kernel/$filename"_test"
train=kernel/$filename"_train"
no_of_kernel_to_sel=5
current=submod_max # current_folder_name if any, inside matlab
echo filename q delta > parameters
# call create_data
sh create_data.sh < $filename $split_fraction $current $kernel_prefix $kernel_prefix_smo $cov $data $test $train
# call select_kernel < pass kernel_selected file
sh select_kernel.sh < $kernel_sel $no_of_kernel_to_sel $current $kernel_prefix $kernel_prefix_smo $cov
# get the file in $kernel_sel file

# call "sh select_kernel.sh < file_for_kernel_selected no_of_kernel_to_select current kernel_prefix kernel_prefix_smo
