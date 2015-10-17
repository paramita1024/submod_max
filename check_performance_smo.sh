#!/bin/bash
#

# call "sh call_smo-mkl.sh < kernel_smo result_file"
# read files
# read parameters
read  kernel_smo result_file
read filename q delta < parameters
read c lambda eta < temporary_parameters
# path for smo-mkl
prefix_smo="../MATLAB/submod_max/kernel/$filename"
kernel_file=$prefix_smo"_kernel_file"
train_file=$prefix_smo"_labels_train"
test_file=$prefix_smo"_labels_test"
model_file=$prefix_smo"_model_file"
out_file=$prefix_smo"_out"
result_file=?
# folder paths
submod_to_smo=../../smo-mkl
smo_to_submod=../MATLAB/submod_max
# write kernel files
rm -f kernel_file
kernel_number=0
while [ $kernel_number -lt $no_of_kernel ] 
do
	kernel_number=`expr $kernel_number + 1`
	echo -t 4 -f ../MATLAB/submod_max/smo/$filename"/"$kernel_number >> kernel_file
	
done  
# call smo-mkl
cd $submod_to_smo
./svm-train -a $no_of_kernel -s 0 -g 3 -o $q -f 0 -q -j 1 -k $kernel_file -c $c -l $lambda  $train_file $model_file			
./svm-predict $test_file $model_file $out_file >> $result_file	
cd $smo_to_submod
# done
