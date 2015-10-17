function [ data label] = select_samples_from_data(name , no_of_sample)
% for this function to work, $name.mat must contain data as images(no_of_feature*no_of_sample) , labels(no_of_sample,1) 
load(name);
if size(labels,1)==1
    labels=labels';
end
index=get_index(labels,no_of_sample);
data=images(:,index)';
label=labels(index);



