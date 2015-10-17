function v=spectral_variance(set,opts)
    v=9*opts.k*opts.k-sum((eig(opts.covariance(set,set))-1).^2);
    