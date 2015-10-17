function f=init_diversity(opts,option)
switch(option)
    case 'SDEN'
        f=@(A) smoothed_diff_ent(A,opts);
    case 'GRNK'
        f=@(A) generalized_rank_reg(A,opts);
    case 'SVAR'
        f=@(A) spectral_variance(A,opts);
end
%     cov 
%     delta k
%     alpha
%     k