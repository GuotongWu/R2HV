clc,clear,close all
addpath(genpath(pwd));
dataFile = "./Data/Solutions/100_5_100_linear_triangular_0.mat";
hvcFile = "./Data/HVC/100_5_100_linear_triangular_0.mat";
load(dataFile, "dataset")

r2hvc = zeros(size(dataset,1), size(dataset,3));
ref = zeros(1,size(dataset,2));
[V,~] = UniformVector(500,size(dataset,2),0,"UNV");
enNum = 10;

tic
for k = 1:size(dataset,3)
    data = squeeze(dataset(:,:,k));
    r2hvc(:,k) = R2HVC(data, ref, V);
end
toc

load(hvcFile, "HVC")
ratio = CIR(r2hvc, HVC)

