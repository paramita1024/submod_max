% get index for nchoosek
function [n_choose_k] = get_n_choose_k(upper_bound,no_of_kernel)
upper_bound=5;
no_of_kernel=10;
n=zeros(upper_bound,1);
n_choose_k = zeros(upper_bound,1);
for i=1:upper_bound-1
    n(i) = nchoosek(no_of_kernel,i);
    n_choose_k(i+1)=sum(n);
end
