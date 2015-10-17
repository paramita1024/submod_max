function [] = process_standard_dataset(name_src,name_dest,split_ratio)
 data = load(name_src);
 no_of_feature=size(data,2)-1;
 split_normalize_data(data(:,1:no_of_feature),data(:,no_of_feature+1),split_ratio,name_dest);
 
 