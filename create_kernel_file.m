function []=create_kernel_file(name,kernel,file)%checked
no_of_kernel = length(kernel);

fileID = fopen( name , 'w' );
for i = 1:no_of_kernel
    fprintf(fileID , '%s\n' , strcat('-t 4 -f ../MATLAB/submod_max/smo/',file,'/',num2str(kernel(i))));
end
fclose(fileID);
