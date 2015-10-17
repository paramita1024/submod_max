filename=ionosphere
input_file=ionosphere
no_of_train=175
no_of_class=2
no_of_kernel=136

no_of_select_kernel=5
q=3.0
C=7
LAMBDA=.1
eta=.01
kernel_file=../MATLAB/submod_max/kernel/letter_kernel_file
train_file=../MATLAB/submod_max/kernel/letter_labels_train
test_file=../MATLAB/submod_max/kernel/letter_labels_test
model_file=../MATLAB/submod_max/kernel/letter_model_file
out_file=../MATLAB/submod_max/kernel/letter.out
itr_no=0
no_of_itr=1

cd /home/paramita/Documents/smo-mkl/
./svm-train -a $no_of_kernel -s 0 -g 3 -o $q -f 0 -j 1 -k $kernel_file -c $C -l $LAMBDA  $train_file $model_file
./svm-predict $test_file $model_file $out_file >> ../MATLAB/submod_max/svm_result

