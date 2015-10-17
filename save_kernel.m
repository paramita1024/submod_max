
function [] =save_kernel(K,K_t,name_smo,name)
no_of_train=size(K,1);
no_of_test=size(K_t,1);
for i=1:size(K,3)
    file=strcat(name_smo,'_',num2str(i));
    file_t=strcat(name_smo,'_',num2str(i),'.test');
    dlmwrite(file,[no_of_train no_of_train],'delimiter',' ');
    dlmwrite(file_t,[no_of_test no_of_train],'delimiter',' ');
    dlmwrite(file,K(:,:,i),'-append','delimiter',' ');
    dlmwrite(file_t,K_t(:,:,i),'-append','delimiter',' ');
end
save(name,'kernel','-v6');
save(strcat(name,'_test'),'kernel_t','-v6');