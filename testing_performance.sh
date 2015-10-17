#!/bin/bash
#
# run_select_kernel_algo_batch.sh
# input : 
# file number 1: "no_of_kernel_"filename"" should contain number of kernel and no of kernel to select separated by space
# file number 2: "exp_no" should contain current experiment number 
## specify ***********************************##
filename=liver
p=1.5
function_type=cls # reg for regression , cls for classification
#alpha=1;
k=1; #( number of kernel to select )
delta=1;
type_diversity=SDEN # GRNK for generalized rank function (pass only alpha), SVAR for spectral variance(pass k only) , SDEN for smoothed differential entropy (pass k and delta )
##********************************************##
name_kernel_sel_prefix=kernel_selected_
name_kernel=kernel_$filename
name_data=data_$filename
name_diversity_param=parameter_diversity 

# write diversity function parameter
echo $type_diversity > $name_diversity_param
case $type_diversity in
	SDEN)
	echo $delta $k >> $name_diversity_param
	;;
	GRNK)
	echo $alpha >> $name_diversity_param
	;;
	SVAR)
	echo $k >> $name_diversity_param
	;;
esac


read no_of_kernel no_of_kernel_to_sel < no_of_kernel_$filename 
k=$no_of_kernel_to_sel
#echo now K is $k
#echo $no_of_kernel and $no_of_kernel_to_sel
read exp_no < exp_no
name_performance=performance_$filename"_"$exp_no"_all"
#echo $exp_no
#echo $filename >> log_file
#date >> log_file
# experiment start
for eta in  1000  
do
	for c in 10 #.1 1 10 100  
	do
		for lambda in .1 # .1 1 10 100
		do
			
			
			#echo exp number $exp_no - $eta , c - $c , lambda - $lambda >> log_file
			#name_kernel_sel=$name_kernel_sel_prefix$exp_no
			#echo $filename $name_kernel_sel $name_kernel $name_data $c $lambda $eta $p $no_of_kernel $no_of_kernel_to_sel  $function_type> temp
			#echo $filename $name_kernel_sel $name_kernel $name_data $c $lambda $eta $p $no_of_kernel $no_of_kernel_to_sel 
			#liver kernel_selected_ kernel_liver data_liver 1 1 1 1.5 10

			#./select_kernel.sh < temp
			# echo outside select kernel
			#read filename name_data name_performance name_kernel_sel c lambda eta p delta
			rm -f all_kernel
			
			kernel_number=0
			while [ $kernel_number -lt $no_of_kernel ] 
			do
				kernel_number=`expr $kernel_number + 1`
				echo $kernel_number >> all_kernel
				
			done  
			name_kernel=all_kernel
			echo $filename $name_data $name_performance $name_kernel  $c $lambda $eta $p $function_type > temp
			sh get_accuracy_smo_mkl_batch.sh < temp
			#exp_no=`expr $exp_no + 1`
		done
	done
done

# echo $exp_no > exp_no
