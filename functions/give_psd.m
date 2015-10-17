function [A] = give_psd(dim)
A=rand(dim);
A=A+A';
m=min(eig(A));
if m<=0
    A=A+(-m+.1)*eye(dim);
end