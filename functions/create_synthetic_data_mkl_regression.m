function [X,Y] = create_synthetic_data_mkl_regression(no_of_sample,no_of_feature,mu,sigma)
X=rand(no_of_sample,no_of_feature);
w=rand(no_of_feature,1);
noise=normrnd(mu,sigma,no_of_sample,1);
Y=X*w+noise;
