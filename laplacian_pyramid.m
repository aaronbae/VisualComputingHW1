function [outputArg1,outputArg2] = laplacian_pyramid(A,h)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    
    for l=1:log2(size(A))
        vector = 1:2:(size(A,1));
        G = imfilter(A,h)
        B = A - G;
        imshow(B,'InitialMagnification','fit');
        size(B)
        A = subsample(A,vector)
        pause(3);
    end
end

