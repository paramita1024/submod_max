function [error] = get_performance(set,names_data)%checked  
load(names_data);
w=linear_regression(train(:,set),label_train)
error=linear_regression_testing(w,test(:,set),label_test);