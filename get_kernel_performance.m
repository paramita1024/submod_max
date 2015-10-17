function[]=get_kernel_performance(name_kernel_sel,name_data,name_result,name_performance,function_type)
%sub fns checked
% check string and initialize handle accordingly
data=matfile(name_data);
get_div=read_diversity_parameter(data.covariance,'parameter_diversity');
diff_ent=get_diversity_value(name_kernel_sel,get_div);
acc=read_smo_accuracy(name_result,function_type);
whos acc
diversity=[];
if strcmp(function_type,'cls')
    

    if exist(strcat(name_performance,'.mat'), 'file') ~= 2
        Accuracy=[];
        
        %echo file not there
        disp('there was no previous file named');disp(name_performance);
    else
        disp('previous file was there');
        load(name_performance);
    end
    Accuracy=[Accuracy acc];
    
    
    save(name_performance,'Accuracy');
else
    if exist(strcat(name_performance,'.mat'), 'file') ~= 2
        MSE=[];
        SCC=[];
        diversity=[];
        %echo file not there
        disp('there was no previous file named');disp(name_performance);
    else
        disp('previous file was there');
        load(name_performance);
    end
    MSE=[MSE acc(:,1)];
    SCC=[SCC acc(:,2)];
    save(name_performance,'MSE','SCC');
end
diversity=[diversity diff_ent];
save(name_performance,'diversity','-append');