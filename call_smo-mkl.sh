#!/bin/bash
#

# checked
read no_of_kernel p  c lambda train test model kernel curr2smo smo2curr function_type
# echo $no_of_kernel $p  $c $lambda $train $test $model $kernel $curr2smo $smo2curr 
# call smo-mkl
cd $curr2smo

case $function_type in
	cls)
		./svm-train -a $no_of_kernel -s 0 -g 3 -o $p  -q -f 0 -j 1 -k $kernel -c $c -l $lambda  $train $model
		# echo it is classification
	;;
	reg)
		./svm-train -a $no_of_kernel -s 3 -g 3 -o $p  -q -f 0 -j 1 -k $kernel -c $c -l $lambda  $train $model
		echo it is regression
	;;
esac

# echo  ./svm-train -a $no_of_kernel -s 3 -g 3 -o $p  -q -f 0 -j 1 -k $kernel -c $c -l $lambda  $train $model
 
 # ./svm-predict $train $model out
 #./svm-predict $test $model out	
 
# echo -a $no_of_kernel -s 3 -g 3 -o $p -f 0 -q -j 1 -k $kernel -c $c -l $lambda  $train $model
cd $smo2curr
# done

