
function[]=create_kernel_file_initial(file,no_of_kernel)%checked
kernel_sel=[];
kernel_left=(1:no_of_kernel)';
create_kernel_file_batch(kernel_sel,kernel_left,file);
dlmwrite('kernel_left',kernel_left);