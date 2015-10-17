function v = generalized_rank_reg(set,opts)
    v=sum(eig(opts.covariance(set,set)).^opts.alpha);
    
    