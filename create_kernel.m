function [kernel kernel_t] = create_kernel( test,train,OPT)
no_of_features=size(train,2); %data should have test train label_test label_train
n=1;
if OPT.Gaussian.flag==1
    for i=1:length(OPT.Gaussian.width) 
        if OPT.Gaussian.flag_all==1
             [K K_t] = create_kernel_gaussian(test,train  , OPT.Gaussian.width(i));
             kernel(:,:,n)=K;
             kernel_t(:,:,n)=K_t;n=n+1;

        end
        if OPT.Gaussian.flag_feature==1
            for j=1:no_of_features
                [K K_t]= create_kernel_gaussian(test(:,j),train(:,j)  , OPT.Gaussian.width(i));
                kernel(:,:,n)=K;
                 kernel_t(:,:,n)=K_t;n=n+1;
            end
        end
    end
end
if OPT.RBF.flag==1
    for i=1:length(OPT.RBF.degree)
        if OPT.RBF.flag_all==1
            [K K_t]= create_kernel_RBF(test,train,OPT.RBF.degree(i));
            kernel(:,:,n)=K;
             kernel_t(:,:,n)=K_t;n=n+1;
        end
        if OPT.RBF.flag_feature==1
            for j=1:no_of_features
                [K K_t]= create_kernel_RBF(test(:,j),train(:,j),OPT.RBF.degree(i));
                kernel(:,:,n)=K;
                 kernel_t(:,:,n)=K_t;n=n+1;
            end
        end
    end
end
if OPT.linear.flag==1
    [K K_t]= create_kernel_linear(test,train);
    kernel(:,:,n)=K;
    kernel_t(:,:,n)=K_t;n=n+1;
end
       