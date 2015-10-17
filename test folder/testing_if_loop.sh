# testing if loop shell

filename=liver
no_of_train=241
no_of_class=2
no_of_kernel=70
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

no_of_kernel_to_select=20

# read the data , split into test and train , create kernels , writes them . 
  matlab -nodisplay -nodesktop -r "cd $current; run_init_mkl('$filename','$no_of_class') ; quit;"
# read all the kernels and create the covariance matrix
  java File_reading create_covariance_matrix  $no_of_kernel kernel/smo/$filename"_kernel" kernel/$filename"_covariance"
# create_covariance_matrix(int no_of_kernel , String file_kernel , String file_covariance) 

# testing for loop
for eta in  .01 .1  1 
do
	for c in 1 5 10
	do
		for lambda in .1 .3 .5 1
		do
			# run the code
			# echo $lambda
			exp_no=`expr $exp_no + 1`
			echo exp$exp_no" : lambda-"$lambda",  c-"$c", eta-"$eta >> svm_result
			no_of_kernel_selected=0
			flag_init=1
			# create kernel file
			rm -f "kernel/"$filename"_kernel_file"
			i=1
			while [ $i != $no_of_kernel ]
			do
				echo -t 4 -f ../MATLAB/submod_max/kernel/smo/$filename"_kernel_"$i >> "kernel/"$filename"_kernel_file"
				i=`expr $i + 1`
			done
		    # selecting kernels
			while [ $no_of_kernel_selected -lt $no_of_kernel_to_select ]
			do
				cd $path_smo
				if [ $flag_init = 1 ]
				then
				   no_of_kernel_selected=$no_of_kernel
				fi
				echo lambda-$lambda",  c-"$c >> ../MATLAB/submod_max/svm_result
				./svm-train -a $no_of_kernel_selected -s 0 -g 3 -o $q -f 0 -j 1 -k $kernel_file -c $c -l $lambda  $train_file $model_file >> ../MATLAB/submod_max/svm_train_result
				./svm-predict $test_file $model_file $out_file >> ../MATLAB/submod_max/svm_result
				## run javac once
				if [ $flag_init = 1 ]
				then
				   no_of_kernel_selected=0
				fi
				 cd $current
				
				 java File_reading read_alpha_from_smo kernel/$filename"_model_file" kernel/$filename"_alpha" $no_of_train $no_of_class
				# f.read_alpha_for_matlab_from_smo_mkl( , "/home/paramita/Documents/MATLAB/submod_max/".concat(args[0]+"alpha"),no_of_sample);
				 java File_reading read_alpha_n_vector kernel/$filename"_alpha" $no_of_train kernel/smo/$filename"_kernel" $no_of_kernel kernel/$filename"_vector" $q
				# f.read_alpha_n_vector(String file_alpha , int no_of_train , String file_kernel , int no_of_kernel , String file_vector , double q)
				 
				 # matlab -nodisplay -nodesktop -r "cd /home/paramita/Documents/MATLAB/submod_max; run_lazy_greedy('$q','$eta','$LAMBDA','$filename','$no_of_kernel','$no_of_select_kernel'); quit;" >> matlab_result
				matlab -nodisplay -nodesktop -r "cd $current; greedy_step( '$filename'  , '$eta' , '$lambda' , '$q' , '$flag_init' , '$no_of_kernel' ); quit;" 
				 # greedy_step( filename  , eta , lambda, q , flag_init , no_of_kernel )
				flag_init=0
				no_of_kernel_selected=`expr $no_of_kernel_selected + 1`
			done
			mv kernel/$filename"_kernel_selected" kernel/$filename"_kernel_selected_$exp_no" #working
		done
	done	
done

# check kernel and kernel vector
