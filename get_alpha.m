function [alpha] = get_alpha(name,no_of_train)%checked
% name='sample_model_file';
% no_of_train=125;
% common part
fp=fopen(name,'r');
while true
    l =fgetl(fp);
    l12=l(1:2);
    if l12=='SV'
        break  ;
    end
end
% specific part
[a]=textscan(fp,'%f %f:%d\n');
fclose(fp);
alpha=zeros(no_of_train,1);
data=cell2mat(a(:,1));
ind=cell2mat(a(:,3))+1;
for  i =1:size(data,1)
    alpha(ind(i))=data(i);
end