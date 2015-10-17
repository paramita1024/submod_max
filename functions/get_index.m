function [index_to_select] = get_index(labels,no_of_sample)
% tested
label_val=unique(labels);
no_of_label=length(label_val);
sample_per_label=floor(no_of_sample/no_of_label);
index_to_select=[];
for i=1:no_of_label
    label_now=label_val(i);
    index=find(labels==label_now);
    permuted=index(randperm(length(index)));
    index_to_select = [ index_to_select ; permuted(1:sample_per_label) ];
end
