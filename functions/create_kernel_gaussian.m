function [kernel kernel_t] = create_kernel_gaussian(test,train,width)
no_of_train = size(train,1);
kernel = zeros(no_of_train , no_of_train);
for i=1:no_of_train
    for j=i:no_of_train
        kernel(i,j) = exp(-(norm(train(i,:)- train(j,:))^2)/width);
        kernel(j,i) = kernel(i,j);
    end
end
trace_val = trace(kernel);
kernel = kernel/trace_val;

no_of_test=size(test,1);
kernel_t = zeros(no_of_test , no_of_train); 
for i=1:no_of_test
    for j=1:no_of_train
        kernel_t(i,j) = exp(-(norm(test(i,:)- train(j,:))^2)/width);
        
    end
end
kernel_t = kernel_t/trace_val;


