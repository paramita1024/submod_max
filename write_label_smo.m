function[]=write_label_smo(file,label_test,label_train)%checked
if size(label_test,1)==1
    label_test=label_test';
end
if size(label_train,1)==1
    label_train=label_train';
end

dlmwrite(strcat('smo/',file,'/label_test'),label_test);
dlmwrite(strcat('smo/',file,'/label_train'),label_train);
