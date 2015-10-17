function[]=write_kernel_smo(kernel,kernel_t,file)%checked
no_of_kernel=size(kernel,3);
no_of_train=size(kernel,1);
no_of_test=size(kernel_t,1);
%check if directory exists
fPath=strcat('smo/',file);
if exist(fPath, 'dir')~=7 % 7 = directory.
    mkdir(fPath);
end
for i=1:no_of_kernel
    filename=strcat('smo/',file,'/',num2str(i));
    filename_test=strcat(filename,'.test');
    dlmwrite(filename,[no_of_train no_of_train],'delimiter',' ');
    dlmwrite(filename,squeeze(kernel(:,:,i)),'-append','delimiter',' ');   
    dlmwrite(filename_test,[no_of_test no_of_train],'delimiter',' ');
    dlmwrite(filename_test,squeeze(kernel_t(:,:,i)),'-append','delimiter',' ');
end    