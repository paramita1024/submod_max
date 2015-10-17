function[]=create_kernel_file_batch(set_old,set_new,file)%checked

for i=1:length(set_new)
    current_set=union(set_old,set_new(i));
    
    name=strcat('kernel_file_',num2str(set_new(i)));
    
    create_kernel_file(name,current_set,file);
end