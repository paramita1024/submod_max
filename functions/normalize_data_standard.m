

function[data,data_t]=normalize_data_standard(data,data_t)
m = mean(data,1);
v=sqrt(var(data,0,1));
for i=1:size(data,2)
    data(:,i)=(data(:,i)-m(i))/v(i);
      data_t(:,i)=(data_t(:,i)-m(i))/v(i);
end