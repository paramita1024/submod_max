function [C] = create_cov(K)%checked
no_of_kernel=size(K,3);
C = zeros(no_of_kernel , no_of_kernel);
for i = 1 : no_of_kernel
  for j = i : no_of_kernel
        temp =  squeeze(K(:,:,i)) .* squeeze(K(:,:,j));
        C(i,j) = sum(sum(temp));
        C(j,i) = C(i,j);
  end
end