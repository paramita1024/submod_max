filename=letter
input_file=letter
no_of_train=1206
no_of_class=3
no_of_kernel=170
no_of_select_kernel=15
q=3.0
c=7
lambda=.1
eta=.01
kernel_file=../MATLAB/submod_max/kernel/letter_kernel_file
train_file=../MATLAB/submod_max/kernel/letter_labels_train
test_file=../MATLAB/submod_max/kernel/letter_labels_test
model_file=../MATLAB/submod_max/kernel/letter_model_file
out_file=../MATLAB/submod_max/kernel/letter.out
itr_no=0
no_of_kernel_to_select=10
no_of_kernel_selected=0
flag_init=1
matlab -nodisplay -nodesktop -r "cd /home/paramita/Documents/MATLAB/submod_max; greedy_step( '$filename'  , '$eta' , '$lambda' , '$q' , '$flag_init' , '$no_of_kernel' ); quit;" 
flag_init=0
no_of_kernel_selected=1
no_of_kernel_to_select=10
while [ $no_of_kernel_selected -lt $no_of_kernel_to_select ]
do
matlab -nodisplay -nodesktop -r "cd /home/paramita/Documents/MATLAB/submod_max; greedy_step( '$filename'  , '$eta' , '$lambda' , '$q' , '$flag_init' , '$no_of_kernel' ); quit;" 
no_of_kernel_selected=`expr $no_of_kernel_selected + 1`
done
