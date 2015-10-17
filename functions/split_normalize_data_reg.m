function[]=split_normalize_data_reg(data,label,name_data,split_ratio)
[index index_t] = get_index_splitted(label,split_ratio,0);
train=data(index,:);
test=data(index_t,:);
label_train=label(index);
label_test=label(index_t);
%% data normalization
[train test]=normalize_data_standard(train, test);
[label_train label_test]=normalize_data_standard(label_train, label_test);
save(name_data,'train','test','label_train','label_test','-v6');