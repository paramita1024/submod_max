function [] = calculate_ratio(eta , obj_val_inner,function_val,upper_bound,filename, no_of_kernel)
%**************************************************
% eta
% obj_val_inner
% function_val
%**************************************************
obj_val_outer = obj_val_inner - eta*function_val;
% read selected kernels by our algo
kernel_sel = load(strcat('kernel/',filename,'_kernel_selected_',num2str(eta)));
index_comb  = zeros(upper_bound,1);
kernel_sel_comb= [];
%  selected kernel matching with combination
for i = 1:upper_bound
    kernel_sel_comb=sort([kernel_sel_comb kernel_sel(i)]) ;
    comb = load(strcat('kernel/',filename,'_combination_',num2str(i)));
    index_comb(i) = check_match(comb,kernel_sel_comb);
end     
% get index for nchoosek
n_choose_k = get_n_choose_k(upper_bound,no_of_kernel);
% find optimal obj
optimal_obj = zeros(upper_bound , 1);
for i = 1:upper_bound
    optimal_obj(i) = min(obj_val_outer(n_choose_k(i) : (n_choose_k(i+1)-1) )) ;
end
obj_for_kernel_sel=obj_val_outer(index_comb+n_choose_k);
ratio = obj_for_kernel_sel./optimal_obj;
dlmwrite(strcat('kernel/',filename,'_ratio'),ratio','-append');
dlmwrite(strcat('kernel/',filename,'_optimal_objective'),optimal_obj','-append');
dlmwrite(strcat('kernel/',filename,'_objective_selected_kernels'),obj_for_kernel_sel','-append');