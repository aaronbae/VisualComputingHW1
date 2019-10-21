function [A] = segment(A)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
    A(A>0) = 1;
    A(A<=0) = 0;
    imshow(A,'InitialMagnification','fit');        
end

