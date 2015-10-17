function [index index_t]=get_index_splitted(label,split_ratio)%checked
label_val=unique(label);
no_of_label=length(label_val);
index=[];
index_t=[];
for i=1:no_of_label
    label_now=label_val(i);
    index_c=find(label==label_now);
    no_of_sample_in_train=floor(split_ratio*length(index_c));
    permuted=index_c(randperm(length(index_c)));
    index=[index; permuted(1:no_of_sample_in_train) ];
    index_t=[index_t; permuted(no_of_sample_in_train+1:length(permuted)) ];
    
end
