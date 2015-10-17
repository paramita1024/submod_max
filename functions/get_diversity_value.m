function[div]=get_diversity_value(name_kernel_sel,get_div)%checked but values are not checked
kernel_sel=load(name_kernel_sel);
div=zeros(length(kernel_sel),1);
kernel=[];
for i=1:length(kernel_sel)
    kernel=union(kernel,kernel_sel(i));
    div(i)=get_div(kernel);
end