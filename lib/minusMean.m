function B = minusMean(A)
% This function returns the mean subtracted matrix
% A: the matrix
    m = mean(mean(A));
    B = A - m;
    B(B<0) = 0;
end

