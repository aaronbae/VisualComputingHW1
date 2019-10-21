function B = subsample(A,vector)
% This function returns the matrix subsampled.
% A     : the matrix
% vector: the vector indicating how to subsample
    B = double(A(vector,vector));
end

