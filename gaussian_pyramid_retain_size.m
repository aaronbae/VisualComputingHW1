function [] = gaussian_pyramid_retain_size(A,h)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    for l=1:log2(size(A))
        vector = 1:2:(size(A,1));
        size(A)
        B = imfilter(A,h);
        imshow(B,'InitialMagnification','fit');
        A = B;
        pause(2)
    end
end

