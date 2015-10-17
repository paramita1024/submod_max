function get_div=read_diversity_parameter(covariance,name_diversity)
% check string and initialize handle accordingly
%file_diversity=fopen('parameter_diversity','r');
file_diversity=fopen(name_diversity,'r');
l =fgetl(file_diversity);
option=l(1:4);
switch option
    case 'SDEN'
        [a]=textscan(file_diversity,'%f %f\n');
        data=cell2mat(a);
        opts.delta=data(1);
        opts.k=data(2);
    case 'GRNK'
        [a]=textscan(file_diversity,'%f\n');
        opts.alpha=cell2mat(a);
    case 'SVAR'
        [a]=textscan(file_diversity,'%d\n');
        opts.k=cell2mat(a);
end
opts.covariance=covariance;
fclose(file_diversity);
get_div=init_diversity(opts,option);
