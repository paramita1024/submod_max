#!/bin/bash
#
# call "sh get_accuracy_smo_mkl.sh < no_of_kernel p  c lambda train test model out kernel result curr2smo smo2curr"
read no_of_kernel p  c lambda train test kernel result curr2smo smo2curr function_type
# call smo-mkl
cd $curr2smo
# echo $curr2smo

case $function_type in
	cls)
		./svm-train -a $no_of_kernel -s 0 -g 3 -o $p  -q -f 0 -j 1 -k $kernel -c $c -l $lambda  $train model
		# echo it is cls
	;;
	reg)
		./svm-train -a $no_of_kernel -s 3 -g 3 -o $p  -q -f 0 -j 1 -k $kernel -c $c -l $lambda  $train model
		# echo it is regression
	;;
esac
./svm-predict $test model out >> $result	
cd $smo2curr
# done



