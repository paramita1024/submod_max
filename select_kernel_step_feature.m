function[]=select_kernel_step_feature(lambda,eta,p,delta,name_kernel,file,name_data)

q=p/(p-1);
load(name_data);
no_of_train=size(train,1);
% load covariance 
% load selected kernels and remaining kernels
kernel_sel=[];
if exist('kernel_sel', 'file') == 2
    kernel_sel = load('kernel_sel');
end
kernel_left = load('kernel_left');
% read alpha values from model files
name_model='model_';

% alpha=no_of_train*no_of_alpha_file
alpha=get_alpha_batch(kernel_left,name_model,no_of_train);%checked
% save alpha.mat alpha;
sum_alpha=label_train'*alpha;
% getting terms for remaining kernels
zero_array=sum_alpha';
first_array = get_val_from_alpha_feature(kernel_left,kernel_sel,alpha,train,q);

%first_array =get_val_from_alpha(kernel_left,kernel_sel,alpha ,name_kernel,q);% check alpha later
second_array=get_differential_entropy(kernel_left , kernel_sel,covariance,delta);
temp_first_array=(1/(8*lambda))*first_array;
obj=zero_array-temp_first_array;
final_array=temp_first_array+eta*second_array;
final=[zero_array temp_first_array obj temp_first_array second_array eta*second_array final_array];


disp(final);
%disp(obj)
%disp(zero_array)
%disp(temp_first_array)
% selecting the kernel with maximum value in greedy approach
%disp(first_array)
%disp(second_array)
temp=(1/(8*lambda))*first_array + eta*second_array;
[~ , select ] = max( temp);
% disp(temp)
selected_kernel=kernel_left(select);
disp('selected kernel');disp(selected_kernel);
kernel_left=setdiff(kernel_left,selected_kernel);
kernel_sel=union(kernel_sel,selected_kernel);
dlmwrite('kernel_sel',selected_kernel,'-append');
dlmwrite('kernel_left',kernel_left);
% creating kernel files for next batch
create_kernel_file_batch(kernel_sel,kernel_left,file);

