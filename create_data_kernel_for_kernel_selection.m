function[]=create_data_kernel_for_kernel_selection()
name_data='data_liver';
name_kernel='kernel_liver';
name_kernel_test='kernel_test_liver';
name_file='liver';

load(name_data);
OPT=[];
OPT.Gaussian.flag=1;
OPT.Gaussian.flag_all=1;
OPT.Gaussian.flag_feature=1;
OPT.Gaussian.width=[.0001 .001 .01 .1 1 10 100];
OPT.RBF.flag=1;
OPT.RBF.flag_all=1;
OPT.RBF.flag_feature=1;
OPT.RBF.degree=[ 1 2 3];
OPT.linear.flag=0;

%whos test
[kernel kernel_t]= create_kernel(test,train,OPT);
covariance=create_cov(kernel);


save(name_kernel,'kernel','-v6');
save(name_kernel_test,'kernel_t','-v6');
no_of_kernel=size(kernel,3);
save(name_data,'no_of_kernel','-append');
save(name_data,'covariance','-append');
dlmwrite(strcat('no_of_kernel_',name_file),[no_of_kernel round(no_of_kernel/2)],'delimiter',' ');
%check if smo exists
fPath='smo';
if exist(fPath, 'dir')~=7 % 7 = directory.
    mkdir(fPath);
end
write_kernel_smo(kernel,kernel_t,name_file);
write_label_smo(name_file,label_test,label_train);
clear all;%clear kernel kernel_t train test ;