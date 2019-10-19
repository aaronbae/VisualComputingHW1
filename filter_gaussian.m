function [B] = filter_gaussian(A,h)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    vector = 1:2:(size(A,1));
    B = imfilter(A,h);
    size(B)
    B = subsample(B,vector)
end

