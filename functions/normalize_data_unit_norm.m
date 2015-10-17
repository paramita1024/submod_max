

function[data,data_t]=normalize_data_unit_norm(data,data_t)
for i=1:size(data,2)
    if norm(data(:,i))~=0
        data(:,i)=data(:,i)/norm(data(:,i));
        data_t(:,i)=data_t(:,i)/norm(data(:,i));
    end
end