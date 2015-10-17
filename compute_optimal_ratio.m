 function [] = compute_optimal_ratio(filename , no_of_train_i,no_of_kernel_i , upper_bound_i , q_i ,c_i,lambda_i)
 upper_bound=str2num(upper_bound_i);
no_of_train= str2num(no_of_train_i);
no_of_kernel=str2num(no_of_kernel_i);
q=str2double(q_i);
c=str2double(c_i);
lambda=str2double(lambda_i);
%%
%  // read all kernels
%             
%         // for every combination 
%             //  from the model file read alpha,
%             //  from corresponding kernel, get the kernel.
%             //  get inner objective
%             //  save for each combination
%             
% //        for each val of eta
% //                 compute objective
% //                 get optimal
% //                 save in another array
%                     //get corr kernel selected
%             // for them also get the array of objectives
%                 // compare with optimal
%             // write ratio
%             // at the same time, at another file write specification
%             // done
%             // exit
%% 
% 
% no_of_kernel
% upper_bound
% q
% eta
% c
% lambda
%%
function_val = load(strcat('kernel/',filename,'_function_values'));
kernel = zeros(no_of_train,no_of_train,no_of_kernel);
for i=1:no_of_kernel
    kernel(:,:,i)=load(strcat('kernel/mkl/',filename,'_kernel_',num2str(i)));
end
  
% compute obj val for all combination
index=0;
obj_val_inner = [];
for i=1:upper_bound
    comb = load(strcat('kernel/',filename,'_combination_',num2str(i)));
    for j = 1 : size(comb,1)
        % inner objective computation
        index = index + 1 ;
        curr_kernel = comb(j,:);
        alpha = load(strcat('kernel/'+filename+'_alpha_',num2str(index)));
        temp = 0;
        for k=1:length(curr_kernel)
            temp = temp + (alpha'*squeeze(kernel(:,:,curr_kernel(k)) )*alpha)^q;
        end
        temp = ones(1,length(alpha))*alpha - temp^(2/q);
        obj_val_inner = [ obj_val_inner  ;temp];
    end
end
eta=load('kernel/eta');
for i = 1:length(eta)
    dlmwrite(strcat('kernel/',filename,'_specification_c_lambda_eta'),[c lambda eta(i)],'-append');
    %call for each eta
    calculate_ratio(eta(i) , obj_val_inner,function_val,upper_bound,filename);
end
