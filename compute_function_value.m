function[] =  compute_function_value( file  ,  delta_i , upper_bound_i )
% read increments for function1 from file_vector file
% create increments for function 2, read cov from file_covariance.
% select element with maximum increment
% modify kernel_left or rewrite kernel_left
% add extra element in kernel_selected

delta = str2double(delta_i);
upper_bound=str2num(upper_bound_i);
%read data
if exist(strcat('kernel/',file,'_function_values'), 'file')==2
  delete(strcat('kernel/',file,'_function_values'));
end
cov_mat = load(strcat('kernel/',file , '_covariance'));
for i=1:upper_bound
   C=load(strcat('kernel/',file,'_combinations_',num2str(i))); 
   diff_entropy = zeros(size(C,1),1);
   for j = 1:size(C,1)
       kernels = C(j,:);
       cov_mat_current = cov_mat(kernels , kernels);
       diff_entropy(j) = sum(log2(delta+eig(cov_mat_current)));
   end
   dlmwrite(strcat('kernel/',file,'_function_values'),diff_entropy,'-append','delimiter',' ');
end