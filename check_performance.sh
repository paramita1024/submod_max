# check performance
filename="liver"
prefix="../MATLAB/submod_max/kernel/$filename"
kernel_file=../MATLAB/submod_max/kernel/$filename"_kernel_file"
#echo $kernel_file
train_file=$prefix"_labels_train"
test_file=$prefix"_labels_test"
model_file=$prefix"_model_file"
out_file=$prefix"_out"
c=1
lambda=.1
eta=.001
path_smo=/home/paramita/Documents/smo-mkl
current=/home/paramita/Documents/MATLAB/submod_max
no_of_kernel=0
echo check v2 performance >> svm_result
rm -f 	kernel/$filename"_kernel_file"
#while read kernel_sel
#do
	echo -t 4 -f ../MATLAB/submod_max/kernel/smo/$filename"_kernel_28" >> kernel/$filename"_kernel_file"
	no_of_kernel=`expr $no_of_kernel + 1`
	echo selected kernel  >> svm_result	
	cd $path_smo
	echo $no_of_kernel
	  ./svm-train -a $no_of_kernel -s 0 -g 3 -o $q -f 0 -q -j 1 -k $kernel_file -c $c -l $lambda  $train_file $model_file 				
	 #./svm-predict $test_file $model_file $out_file >> ../MATLAB/submod_max/svm_result	
	cd $current
#done < ../MATLAB/submod_max/kernel/$filename"_kernel_selected"
