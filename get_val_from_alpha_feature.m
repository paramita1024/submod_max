function [v] = get_val_from_alpha_feature(kernel_left,kernel_sel,alpha,train,q)%checked
v=zeros(length(kernel_left),1);
for i=1:length(kernel_left)
    sum=0;
    for j=1:length(kernel_sel)
        sum = sum+(alpha(:,i)'*train(:,kernel_sel(j)))^(2*q);
    end
    sum = sum+(alpha(:,i)'*train(:,kernel_left(i)))^(2*q);
    v(i) = sum^(2/q);
end

    