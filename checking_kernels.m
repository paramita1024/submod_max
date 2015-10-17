filename='liver';
no_of_class=2;
split_ratio=.7;
FLAG.data_normalization =1;
kernel_number = 1;
% read data
data = load(strcat('data/',filename));
%rest parameter
no_of_sample = size(data,1);
no_of_features = size(data,2)-1;
%no_of_train =floor(split_ratio*no_of_sample);

% split in test and train 
label = data(:,no_of_features+1);
train_index = [];
test_index = [];

for i = 1:no_of_class
    class_index = find(label == i);
    train_per_cls = floor(length(class_index)*split_ratio);
    perm = randperm(length(class_index));
    train_index = [train_index ;  class_index( perm(1:train_per_cls) )];
    test_index = [test_index ; class_index(perm(train_per_cls+1:length(class_index)))] ;
end


labels.train = data(train_index, no_of_features+1 );
labels.test = data(test_index,no_of_features+1);
no_of_train = size(labels.train,1);
no_of_test = size(labels.test,1);
clear label;
% % write labels
if no_of_class==2
    labels.train(labels.train==2)=-1;
    labels.test(labels.test==2)=-1;
end
dlmwrite(strcat('kernel/',filename,'_labels_train'),labels.train);
dlmwrite(strcat('kernel/',filename,'_labels_test'),labels.test);
% % data normalization
if FLAG.data_normalization == 1
    data = data(:,1:no_of_features);
    m = mean(data,1);
    data = normc(data - m(ones(no_of_sample,1),:));
end
train =  data( train_index , :) ;
test =  data( test_index ,:) ;
feature = train(:,6);
feature_test = test(:,6);
for i = 1:length(feature)
    for j = 1:length(feature)
        K(i,j) = exp(-( ( feature(i)-feature(j) )^2 )/20000);
    end
end
K = K/trace(K);
kernel_param.polynomial_degree=[1 2 3];
%     for i = 6
%         kernel_train_init = train(:,i)*train(:,i)';
%         kernel_test_init = test(:,i)*train(:,i)';
%         kernel_test_square = test(:,i).*test(:,i);
%         for j = 3
%             kernel_train = kernel_train_init.^kernel_param.polynomial_degree(j);
%             kernel_test = kernel_test_init.^kernel_param.polynomial_degree(j);
%             trace_total = trace(kernel_train);
%             kernel_train = kernel_train/trace_total;
%              kernel_test = kernel_test/trace_total;
% %             dlmwrite(strcat('kernel/smo/',filename,'_kernel_',num2str(kernel_number)),[no_of_train no_of_train],'delimiter',' ');
% %             dlmwrite(strcat('kernel/smo/',filename,'_kernel_',num2str(kernel_number)),kernel_train,'-append','delimiter',' ');
% % %             dlmwrite(strcat('kernel/mkl/',filename,'_kernel_',num2str(kernel_number)),kernel_train,'delimiter',' ');
% %             dlmwrite(strcat('kernel/smo/',filename,'_kernel_',num2str(kernel_number),'.test'),[no_of_sample-no_of_train no_of_train],'delimiter',' ');
% %             dlmwrite(strcat('kernel/smo/',filename,'_kernel_',num2str(kernel_number),'.test'),kernel_test,'-append','delimiter',' ');
% % %            dlmwrite(strcat('kernel/mkl/',filename,'_kernel_',num2str(kernel_number),'.test'),kernel_test,'delimiter',' ');        
%             kernel_number =kernel_number + 1;
%         end
%     end
% max(max(K-kernel_train))
kernel_param.gaussian_width = [.001];
for i = 5
        kernel_train_init = train(:,i)*train(:,i)';
        kernel_test_init = test(:,i)*train(:,i)';
        kernel_test_square = test(:,i).*test(:,i);
        b=  diag(kernel_train_init);
        b_tr = b';
        kernel_train_init = 2*kernel_train_init - b(:,ones(1,size(kernel_train_init,2))) - b_tr(ones(size(kernel_train_init,1),1),:);
        % norms_test = sum(test.^2,2);
        kernel_test_init =  2*kernel_test_init - kernel_test_square(:,ones(1,no_of_train)) -b_tr(ones(no_of_sample - no_of_train,1),:);

        for j = 1 : length(kernel_param.gaussian_width)
            kernel_train = exp(kernel_train_init/kernel_param.gaussian_width(j))/no_of_train;
            kernel_test = exp(kernel_test_init/kernel_param.gaussian_width(j))/no_of_train;
%             dlmwrite(strcat('kernel/smo/',filename,'_kernel_',num2str(kernel_number)),[no_of_train no_of_train],'delimiter',' ');
%             dlmwrite(strcat('kernel/smo/',filename,'_kernel_',num2str(kernel_number)),kernel_train,'-append','delimiter',' ');
% %             dlmwrite(strcat('kernel/mkl/',filename,'_kernel_',num2str(kernel_number)),kernel_train,'delimiter',' ');
%             dlmwrite(strcat('kernel/smo/',filename,'_kernel_',num2str(kernel_number),'.test'),[no_of_sample-no_of_train no_of_train],'delimiter',' ');
%             dlmwrite(strcat('kernel/smo/',filename,'_kernel_',num2str(kernel_number),'.test'),kernel_test,'-append','delimiter',' ');
% %             dlmwrite(strcat('kernel/mkl/',filename,'_kernel_',num2str(kernel_number),'.test'),kernel_test,'delimiter',' ');        
            kernel_number =kernel_number + 1;
        end
end
    max(max(K-kernel_train))
