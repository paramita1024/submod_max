function[acc]=read_smo_accuracy(name,function_type)%checked
fp=fopen(name,'r');

if strcmp(function_type,'cls')
     [a]=textscan(fp,'%s = %f%s (%d/%d) %s\n');
     acc=cell2mat(a(2));
%     Accuracy = 72.2222% (39/54) (classification)
% Accuracy = 72.2222% (39/54) (classification)
else
    
    [a]=textscan(fp,'%s %s %s %s %f %s\n');
    data=cell2mat(a(5));
    ind1=1:(length(data)/2);
    ind2=2*ind1;
    ind1=ind2-1;
    MSE=data(ind1); % Mean squared error
    SCC=data(ind2);
    acc(:,1)=MSE;
    acc(:,2)=SCC;
end
%   whos a;
%   celldisp(a(5));
% alpha=zeros(no_of_train,2);
% for  i =1:size(data,1)
%     alpha(ind(i),:)=data(i,1);
% end
fclose(fp);