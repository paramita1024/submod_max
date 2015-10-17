function [v]=get_diversity_batch(f_handle,set_old,set_new)
v=zeros(length(set_new),1);
for i=1:length(set_new)
    current=union(set_old,set_new(i));
    v(i)=f_handle(current);
end