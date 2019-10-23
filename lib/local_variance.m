function [output,t] = local_variance(A,Z,t)
% Calculates the local variance of image matrix A and returns a new matrix
% with variance value above threshold t
% Inputs : 
%   A : imput matrix
%   t : threshold
%Outputs : 
%   output: matrix output with edge detected

    output = zeros(size(A));
    var_zero = zeros(size(A));
    
%     a = padarray(A,[1,1],0);
%     mu = conv2(a,[1 1 1;1 1 1;1 1 1], 'same')/9;
%     mu2 = conv2(a.^2,[1 1 1;1 1 1;1 1 1], 'same')/9;
%     
%     var = mu2 - mu.^2;
%     var = var(2:size(var)-1,2:size(var)-1);
%     
    sdImage = stdfilt(A);
    var = sdImage.^2;
    size(var)
    size(var_zero)
    var_zero = var(Z==1);
    %for t=[t1,t2,t3]
    output(var_zero>t) = 1;   
    output(var_zero<=t) = 0;    
        %imshow(output)
   % end

