function [kernel kernel_t]= create_kernel_linear(test,train)

kernel = train*train';
trace_val = trace(kernel);
kernel = kernel/trace_val;
kernel_t = test*train';
kernel_t = kernel_t/trace_val;