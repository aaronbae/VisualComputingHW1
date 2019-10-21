function B = binary_image(A,t)
% This function returns a binary-thresheld image.
% A: the matrix 
% t: the threshold value
    B = A>t;
    B(B==1) = 255; 
end
