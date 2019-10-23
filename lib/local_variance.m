function [output] = local_variance(second_derivative, zero_crossing, t)
% Calculates the local variance of image matrix A and returns a new matrix
% with variance value above threshold t
% Inputs : 
%   A : imput matrix
%   t : threshold
%Outputs : 
%   output: matrix output with edge detected

    output = zeros(size(second_derivative));
    
    second_derivative_padded = padarray(second_derivative,[1,1],0);
    mu = conv2(second_derivative_padded,[1 1 1;1 1 1;1 1 1], 'same')/9;
    mu2 = conv2(second_derivative_padded.^2,[1 1 1;1 1 1;1 1 1], 'same')/9;
    
    var = mu2 - mu.^2;
    var = var(2:size(var)-1,2:size(var)-1);
    
    output(var>t & zero_crossing==1) = 1;   
end

