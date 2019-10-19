function [] = detectedge(A,h,op)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    for l = 1:log2(size(A))
        B = imfilter(A,op);
        imshow(B,'InitialMagnification','fit');        
        A = filter_gaussian(A,h);
        B = segment(B);
        zerocrossing(B);
        pause(3);
    end
end

