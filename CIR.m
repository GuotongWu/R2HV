function ratio = CIR(R2HVC, HVC)
    [~,HVCidx] = min(HVC,[],1);
    [~,R2idx] = min(R2HVC,[],1);
    ratio = sum(HVCidx==R2idx)/size(HVC,2);
end