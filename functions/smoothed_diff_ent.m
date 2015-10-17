function v = smoothed_diff_ent(set, opts)
    v = sum(log2(eig(opts.covariance(set,set))+opts.delta))-3*opts.k*log2(opts.delta);
end
