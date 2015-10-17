
function [kernel kernel_t] =create_kernel_RBF(test,train,degree)
kernel=1+train*train';
kernel_t=1+ test*train';
kernel=kernel.^degree;
kernel_t= kernel_t.^degree;
trace_val=trace(kernel);
kernel=kernel/trace_val;
kernel_t=kernel_t/trace_val;
        
