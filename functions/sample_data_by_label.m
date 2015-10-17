function [data , label] = sample_data_by_label(filename , desired_label)
data_all = load(filename);
num_feature=size(data_all,2);
label=data_all(:,num_feature);
data=data_all(:,1:num_feature-1);
index=get_index_by_label(label,desired_label);
data=data(index,:);
label=label(index,:);