
# read files
# call smo-mkl
# read parameters
read filename q delta < parameters
read c lambda eta < temporary_parameters
# write to model file 
read  model_file_ext kernels < parameter_for_smo-mkl # check
# path for smo-mkl
prefix_smo="../MATLAB/submod_max/kernel/$filename"
kernel_file=$prefix_smo"_kernel_file"
train_file=$prefix_smo"_labels_train"
# test_file=$prefix_smo"_labels_test"
model_file=$prefix_smo"_model_file"$model_file_ext
# out_file=$prefix_smo"_out"
# folder paths
submod_to_smo=../../smo-mkl
smo_to_submod=../MATLAB/submod_max
# write kernel files
rm -f "kernel/"$filename"_kernel_file"
no_of_kernel=0
while read kernel
do
	no_of_kernel=`expr $no_of_kernel + 1`
	echo -t 4 -f ../MATLAB/submod_max/kernel/smo/$filename"_kernel_"$kernel >> "kernel/"$filename"_kernel_file"
done < kernel_smo
# call smo-mkl
cd $submod_to_smo
./svm-train -a $no_of_kernel -s 0 -g 3 -o $q -f 0 -q -j 1 -k $kernel_file -c $c -l $lambda  $train_file $model_file			
cd $smo_to_submod
# done
