function[alpha]=get_alpha_batch(set_left,name_model,no_of_train)%checked
alpha=zeros(no_of_train,length(set_left));

for i=1:length(set_left)
    alpha(:,i)=get_alpha(strcat(name_model,num2str(set_left(i))),no_of_train);
end
    
