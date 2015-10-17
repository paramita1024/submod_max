function [v] = get_val_from_alpha(kernel_left,kernel_sel,alpha,name_kernel,q)%checked
load(name_kernel);
v=zeros(length(kernel_left),1);
for i=1:length(kernel_left)
    sum=0;
    for j=1:length(kernel_sel)
        sum = sum+(get_product(alpha(:,i),squeeze(kernel(:,:,kernel_sel(j)))) )^q;
    end
    sum = sum+get_product(alpha(:,i),squeeze(kernel(:,:,kernel_left(i))))^q;
    v(i) = sum^(2/q);
end

    