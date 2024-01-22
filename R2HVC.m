function R2hvc = R2HVC(data, ref, V)
    [num,dim] = size(data);
    R2hvc = zeros(1, num);
    for k = 1:num
        data_copy = data;
        s = data_copy(k,:);
        data_copy(k,:) = [];
        ref_len = min(abs(s-ref)./V, [], 2);
        len = (s-data_copy)./permute(V, [3,2,1]);
        len = squeeze(min(max(len,[],2),[],1));
        R2hvc(k) = sum(min([ref_len,len], [], 2).^dim)/size(V,1);
    end
end