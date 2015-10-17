function[return_label]=get_index_by_label(label,desired_label)
return_label=[];
for i=1:length(desired_label)
    return_label=[return_label (find(label==desired_label(i))) ];
end
