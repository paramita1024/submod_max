#!/bin/bash
#
#no_of_kernel=26
#p=1.5
#c=10
#lambda=1
#train=Example/Classification/PrecomputedKernels/y_train
#model=Example/Classification/PrecomputedKernels/model_file
#kernel=Example/Classification/PrecomputedKernels/kernelfile
#curr2smo=../../smo-mkl
#smo2curr=../MATLAB/submod_max
## b=1
## echo $b > temp
## sh test.sh < temp




#echo $no_of_kernel $p  $c $lambda $train $model $kernel $curr2smo $smo2curr > temp
 #sh call_smo-mkl.sh < temp
## svm-train -s 0 -h 0 -m 400 -o 2.0 -a 26 -c 10.0 -l 1.0 -f 0 -j 1 -g 3 -k   
## svm-predict Example/Classification/PrecomputedKernels/y_test Example/Classification/PrecomputedKernels/model_file Example/Classification/PrecomputedKernels/prediction  

x=0
y=5
while [ $x -le $y ]
do
  echo "Welcome $x times"
  #x=$(( $x + 1 ))
  x=`expr $x + 1`
done
