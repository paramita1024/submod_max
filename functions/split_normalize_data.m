function [] = split_normalize_data(data,label,split_ratio,name_data)%checked
[index index_t] = get_index_splitted(label,split_ratio);
train=data(index,:);
test=data(index_t,:);
label_train=label(index);
label_test=label(index_t);
%% data normalization
[train test]=normalize_data_standard(train, test);
if length(unique(label))==2
    flag_cls=1;
    % disp('everything going right');
else
    flag_cls=0;
    % disp('wrong');
end
if flag_cls==0
    [label_train label_test]=normalize_data_standard(label_train, label_test);
end
save(name_data,'train','test','label_train','label_test','-v6');
