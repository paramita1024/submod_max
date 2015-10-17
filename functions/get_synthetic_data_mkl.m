function []=get_synthetic_data_mkl()
no_of_sample=1000;
no_of_feature=10;
mu=0;
sigma=.1;
split_ratio=.5;
name_data='data_regression';
 [X,Y] = create_synthetic_data_mkl_regression(no_of_sample,no_of_feature,mu,sigma); split_normalize_data_reg(X,Y,name_data,split_ratio);