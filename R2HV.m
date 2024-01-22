function R2val = R2HV(data,ref,V,scale)
    dim = size(data,2); 
    len = abs(data-ref) ./ permute(V, [3,2,1]);
    len = squeeze(max(min(len,[],2),[],1));
    R2val = sum(len.^dim);
    if scale == true
        R2val = R2val*pi^(dim/2)/(dim*size(V,1)*2^(dim-1)*gamma(dim/2));
    end
end