
% % % % % fPath='smo';
% % % % % 
% % % % % 
% % % % % % To see what each of these "magic numbers" mean, go to, 
% % % % % % http://www.mathworks.com/help/techdoc/ref/exist.html
% % % % % if exist(fPath, 'dir')~=7 % 7 = directory.
% % % % %     % We have a folder!
% % % % %     mkdir(fPath);
% % % % % end
% % % % % 
% % % % % read_smo_accuracy('result');
% %  kernel(:,:,1)=[0 1; 1 2];
% %  kernel(:,:,2)=[1 2 ; 1 3 ];
% %  save kernel_test kernel
% % % % %[cov] = create_cov(K)
% % % % kernel_t=kernel+1;
% % % name_file='test';
% % % label_test=[1 2 3 4];
% % % label_train=[1 2 3];
% % % % write_kernel_smo(kernel,kernel_t,file);
% % % write_label_smo(name_file,label_test,label_train);
% % file='test';
% % no_of_kernel=3;
% % %create_kernel_file_batch([0 1 ],[2 3 ],file)
% % % create_kernel_file_initial(file,no_of_kernel);
% % no_of_train=216;
% % name='sample_alpha';
% % %a=get_alpha_batch([2 1],'model_',216);
% % %[alpha] = get_alpha(name,no_of_train);
% % 
% % [v] = get_val_from_alpha(2,1,[1;3],'kernel_test',3)
% %a=read_smo_accuracy('result');
% alpha=[1 3;2 4];
% [v v1] = get_val_from_alpha([ 1 2 ],[],alpha,'kernel_test',3);%checked
% 
% train=[1 2;3 4];
% test=[5 6;7 8];
% %write_kernel_smo_feature(train,test,'mnist_test ');
% [covariance]=get_covariance_feature(train);
% % alpha=[1 3;2 4];
% % train=[1 3 5 ; 2 4 6];
% [v] = get_val_from_alpha_feature([1 3],[2],alpha,train,1);
% label = [1 2 2 2 1 2 2 1 2 1 1 1 ]';
% [i i_t] = get_index_splitted(label,.67);

% if exist(strcat()'a', 'file') ~= 2
%     MSE=[];
%     SCC=[];
%     differential_entropy=[];
%     %echo file not there
%     disp('there was no previous file named');disp('a');
% else
%     disp('previous file was there');
%     %load(name_performance);
% end
%opts.covariance=give_psd(4);
% opts.delta=1;
% opts.k=4;
% opts.alpha=.5;
% f=init_diversity(opts,'SVAR');
% f([1])
%     cov 
%     delta k
%     alpha
%     k

% f='cls';
% if strcmp(f,'cls')
%     disp('cls');
% else
%     disp('reg');
% end
a=read_smo_accuracy('acc_file_delete','cls');