% process letter data
l=load('data/letter');

[train label_train] = select_samples_from_data('train_mnist',1000);
[test label_test] = select_samples_from_data('test_mnist',500);
[train test]=normalize_data_unit_norm(train,test);
[label_train label_test]=normalize_data_unit_norm(label_train,label_test);
save data_mnist train test label_train label_test -v6;
% add normalization