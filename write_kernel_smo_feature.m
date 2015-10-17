function[]=write_kernel_smo_feature(train,test,file)%checked
no_of_feature=size(train,2);
no_of_train=size(train,1);
no_of_test=size(test,1);
%check if directory exists
fPath=strcat('smo/',file);
if exist(fPath, 'dir')~=7 % 7 = directory.
    mkdir(fPath);
end
for i=1:no_of_feature
    filename=strcat('smo/',file,'/',num2str(i));
    filename_test=strcat(filename,'.test');
    %create
    tr=train(:,i);
    t=test(:,i);
    kernel=tr*tr';
    kernel_t=t*tr';
    %normalize
    norm_val=trace(kernel);
    if norm_val~=0
        kernel=kernel/norm_val;
        kernel_t=kernel_t/norm_val;
    end
    dlmwrite(filename,[no_of_train no_of_train],'delimiter',' ');
    dlmwrite(filename,kernel,'-append','delimiter',' ');   
    dlmwrite(filename_test,[no_of_test no_of_train],'delimiter',' ');
    dlmwrite(filename_test,kernel_t,'-append','delimiter',' ');
end