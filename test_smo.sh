#!/bin/bash
#



#cd ../../smo-mkl
#echo -t 4 -f ../MATLAB/submod_max/smo/liver/9 > ../MATLAB/submod_max/kernel_file
##	echo -t 4 -f ../MATLAB/submod_max/smo/liver/9 >> ../MATLAB/submod_max/kernel_file
## echo -t 4 -f ../MATLAB/submod_max/smo/liver/3 >> ../MATLAB/submod_max/kernel_file
## echo -t 4 -f ../MATLAB/submod_max/smo/liver/4 >> ../MATLAB/submod_max/kernel_file
#./svm-train -a 1 -s 3 -g 3 -o 1.5 -f 0 -p 0 -q -j 1 -k ../MATLAB/submod_max/kernel_file -c 10 -l .1 ../MATLAB/submod_max/smo/liver/label_train ../MATLAB/submod_max/model_2
 ##./svm-train -a $no_of_kernel -s 3 -g 3 -o $p -p 0 -q -f 1 -j 1 -k $kernel -c $c -l $lambda  $train $model

 ##./svm-predict $test $model out	
 
## echo -a $no_of_kernel -s 3 -g 3 -o $p -f 0 -q -j 1 -k $kernel -c $c -l $lambda  $train $model
 
##echo -t 4 -f ../MATLAB/submod_max/smo/liver/2 >> ../MATLAB/submod_max/kernel_file
##./svm-train -s 3 -g 3 -o 1.5 -p 0.0068 -q -j 1 -a 2 -k ../MATLAB/submod_max/kernel_file -c 10 -l .1 
##./svm-predict ../MATLAB/submod_max/smo/liver/label_test ../MATLAB/submod_max/model_2 out
###echo -t 4 -f ../MATLAB/submod_max/smo/liver/3 >> ../MATLAB/submod_max/kernel_file
###./svm-train -a 3 -s 3 -g 3 -o 1.5 -p 0 -q -j 1 -k ../MATLAB/submod_max/kernel_file -c 10 -l .1 ../MATLAB/submod_max/smo/liver/label_train ../MATLAB/submod_max/model_2
#cd ../MATLAB/submod_max

#var=two
#case $var in
	#one)
	#echo one
	#;;
	#two)
	#echo two
	#;;
	
#esac



alpha=1;
k=1;
delta=1;
type_diversity=SDEN # SVAR #GRNK # 
##********************************************##
filename=f
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
