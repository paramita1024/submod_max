function[]=create_data_kernel_smo()
%written to be used in select kernel algo when we do not use precomputed
%kernel and use linear kernel for all feature instead
name_data='data_mnist';
name_kernel='kernel_mnist';
name_kernel_test='kernel_test_mnist';
name_file='mnist';



load(name_data);
%[kernel kernel_t]= create_kernel(test,train,OPT);
%covariance=create_cov(kernel);

%check if smo exists
fPath='smo';
if exist(fPath, 'dir')~=7 % 7 = directory.
    mkdir(fPath);
end

write_kernel_smo_feature(kernel,kernel_t,name_file);
write_label_smo(name_file,label_test,label_train);
covariance=get_covariance_feature(train);
no_of_kernel=size(train,2);
save(name_data,'no_of_kernel','-append');
save(name_data,'covariance','-append');
clear all;%clear kernel kernel_t train test ;