#!/bin/bash
#
# kernel selection algorithm
# call "sh select_kernel.sh < file_for_kernel_selected no_of_kernel_to_select current kernel_prefix kernel_prefix_smo names_cov"
# parameter
read filename name_data name_performance name_kernel_sel c lambda eta p function_type

#
current=submod_max
curr2smo=../../smo-mkl/
smo2curr=../MATLAB/submod_max
kernel=$smo2curr"/kernel_file"
train=$smo2curr"/smo/"$filename"/label_train"
test=$smo2curr"/smo/"$filename"/label_test"
model_prefix=$smo2curr"/model"
kernel_file=kernel_file
result=$smo2curr"/result_file"
result_file=result_file

# delete existing kernel file
rm -f $kernel_file
rm -f $result_file
no_of_kernel=1
echo name of file kernel selected is $name_kernel_sel
while read kernel_l
do
	# for each of remaining kernel, call smo
	echo -t 4 -f ../MATLAB/submod_max/smo/$filename"/"$kernel_l>> $kernel_file
	echo $no_of_kernel $p  $c $lambda $train $test $kernel $result $curr2smo $smo2curr $function_type> temp
	# echo $no_of_kernel $p  $c $lambda $train $test $model $out $kernel $result $curr2smo $smo2curr 
	./get_accuracy_smo_mkl.sh < temp
	no_of_kernel=`expr $no_of_kernel + 1`    
done < $name_kernel_sel


#**************************ekta switch je check korbe tumi kon div fn ta chao r serokom kaj korbe
matlab -nodisplay -nodesktop -r "  get_kernel_performance('$name_kernel_sel','$name_data','$result_file','$name_performance','$function_type'); quit;" ##check
