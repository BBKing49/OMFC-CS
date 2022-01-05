function outVec = findindicator(X,V,W, P,i)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
clu_nums=size(V{1},1);
obj = zeros(clu_nums, 1);
tmp = eye(clu_nums);
view_nums = size(V,1) - 1;
for v = 1:view_nums
    temp1 = V{view_nums+1}*W{v};
    temp2 = V{v}*P{v};
    for c=1:clu_nums
        obj(c,1) = obj(c,1) + (norm(X{v}(i,:) - temp1(c,:) - temp2(c,:), 'fro').^2);
    end
end
[min_val, min_idx] = min(obj);
outVec = tmp(:, min_idx);
end


