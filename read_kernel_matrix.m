start = cputime;
for i = 1:136
    l = load(strcat('kernel/mkl/letter_kernel_',num2str(i)));
end
endt = cputime;
totaltime = endt - start;