clear;
clc;

datafiles = {'corel_image'};

for datafile = datafiles
    
    load([datafile{1} '.mat']);
    
    view_nums = size(data,1);
    
    for i = 1:view_nums
        [N,d(i)] = size(data{i});
        data{i} = mapminmax(data{i}', 0, 1)';
    end
        
    option.com_dim = 50;
    option.lambda1 = 10.^-3 ;
    option.lambda2 = 10.^-3 ;
    option.Maxitems = 100;
    option.clusters = max(labels);
    option.m = 1.05;
    option.tolerance = 10.^-6;
    for iter = 1:1
        tic;
        [U, V, w, Hs, Hc] = MVFCM_JRLCP(data,option);
        t(iter)=toc;
        
        pred_labels = vec2lab(U');
        
        result_cluster = ClusteringMeasure(labels, pred_labels);
        nmi(iter) = result_cluster(2);
        acc(iter) = result_cluster(1);
        purity(iter) = result_cluster(3);
        ARI(iter) = result_cluster(4);
    end
    
end
