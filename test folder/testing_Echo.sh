#a=1
#echo $a >> svm_result

fileID = fopen( strcat('kernel/',filename,'_kernel_file') , 'w' );
for i = 1:no_of_kernel
    fprintf(fileID , '%s\n' , strcat('-t 4 -f ../MATLAB/submod_max/kernel/smo/',filename,'_kernel_',num2str( i) ));
end
fclose('all');

