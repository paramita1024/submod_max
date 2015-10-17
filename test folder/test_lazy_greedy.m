% test_lazy_greedy
% clear all;
% v = [ 1 2 3 4 2 3 7 8 3 ]';
% A = rand(length(v));
% A = A+A';
% if min(eig(A)) < 0 
%     A = A + .1*eye(length(v)) - min(eig(A))*eye(length(v));
% end
% cov_mat = A;
% 
% 
% marginal = (1/(8*lambda))*(v.^(2/q))+eta*log(diag(cov_mat)); 
% [marginal,index] = sort(marginal,'descend');
% dlmwrite('kernel/testing_covariance',A);
% dlmwrite('kernel/testing_vector',v);
% dlmwrite('kernel/testing_marginal',marginal);
% dlmwrite('kernel/testing_index',index);
% 

lambda = .1;
q = 3;
eta = 100;
flag_init = 0; 
lazy_greedy_step( 'testing' , eta , lambda, q , flag_init);

