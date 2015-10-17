#!/bin/bash
#

# kernel selection algorithm
# call "sh select_kernel.sh < file_for_kernel_selected no_of_kernel_to_select current kernel_prefix kernel_prefix_smo names_cov"
# parameter
read filename name_kernel_sel name_kernel name_data c lambda eta p no_of_kernel no_of_kernel_to_select function_type
#
current=submod_max
curr2smo=../../smo-mkl
smo2curr=../MATLAB/submod_max
kernel_prefix=$smo2curr"/kernel_file_"
train=$smo2curr"/smo/"$filename"/label_train"
test=$smo2curr"/smo/"$filename"/label_test"
model_prefix=$smo2curr"/model_"
kernel_left=kernel_left
kernel_sel=kernel_sel

#write kernel_left file
rm -f $kernel_sel
rm -f $kernel_left
# create kernel files for first iteration

matlab -nodisplay -nodesktop -r " create_kernel_file_initial('$filename',$no_of_kernel); quit;"
# selecting kernels
no_of_kernel_selected=1


while [ $no_of_kernel_selected -le $no_of_kernel_to_select ]
do
	# for each of remaining kernel, call smo
	
	while read kernel_l
	do		
		kernel=$kernel_prefix$kernel_l
		model=$model_prefix$kernel_l
		echo $no_of_kernel_selected $p  $c $lambda $train $test $model $kernel $curr2smo $smo2curr  $function_type > temp
		#echo $no_of_kernel_selected $p  $c $lambda $train $test $model $kernel $curr2smo $smo2curr
		./call_smo-mkl.sh < temp
		
				
					
			
		done < $kernel_left
	# remove all kernel file
	#rm -f  kernel_file_* # ******************************** remove the comment
	# select_kernel_step.m does following jobs
	# read alpha
	# create vector
	# select kernel
	# write kernel file for next bunch of smo calls
	# echo $lambda , $eta , $p ,$delta , $name_kernel, $filename,$name_data

#**************************ekta switch je check korbe tumi kon div fn ta chao r serokom kaj korbe
	matlab -nodisplay -nodesktop -r "select_kernel_step($lambda,$eta,$p,'$name_kernel','$filename','$name_data'); quit;" ##check
	
	 
	# remove all model file
	#rm -f model_*
	no_of_kernel_selected=`expr $no_of_kernel_selected + 1`
    
done
#rm -f kernel_file_*
# move selected kernels to a special file
mv $kernel_sel $name_kernel_sel #*****************************remove comment
