function [A] = segment(A)
%This function returns the segmented matrix of image, values greater than 0
%gets the value 1 and 0 otherwise
% Inputs : A : Image matrix
% Outputs : Segmented Image
    A(A>0) = 1;
    A(A<=0) = 0;      
end

