% currently of no use
set = [ 1 3 5 6 ];
fileID = fopen('data/ionosphere/kernel_file','w');
for i = 1:length(set)
    fprintf(fileID , '%s\n' , strcat('-t 4 -f ../MATLAB/data/ionosphere/kernel_',num2str(i)));
end
fclose('all');