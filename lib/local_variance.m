function [output] = local_variance(A,t)
% Calculates the local variance of image matrix A and returns a new matrix
% with variance value above threshold t
% Inputs : 
%   A : imput matrix
%   t : threshold
%Outputs : 
%   output: matrix output with edge detected

    output = zeros(size(A));
    
    a = padarray(A,[1,1],0)
    mu = conv2(A,[1 1 1;1 1 1;1 1 1], 'same')/9;
    mu2 = conv2(A^2,[1 1 1;1 1 1;1 1 1], 'same')/9;
    
    var = mu2 - mu^2;
    
    output(var>t) = 1;   
    output = output(2:size(output)-1,2:size(output)-1)
    
end

