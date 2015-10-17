function [covariance]=get_covariance_feature(train)%checked
no_of_feature=size(train,2);
covariance=zeros(no_of_feature,no_of_feature);
for i=1:no_of_feature
    for j=i:no_of_feature
        % get matrix
        A=train(:,i)*train(:,i)';
        B=train(:,j)*train(:,j)';
        % get cov
        covariance(i,j)=sum(sum(A.*B));
        covariance(j,i)=covariance(i,j);
    end
end






