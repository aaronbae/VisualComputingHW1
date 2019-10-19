function [] = gaussian_pyramid(A,h)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    for l=1:log2(size(A))
        vector = 1:2:(size(A,1));
        B = imfilter(A,h);
        size(B)
        B = subsample(B,vector)
        imshow(B,'InitialMagnification','fit');
        A = B;
        pause(3);
    end

end

