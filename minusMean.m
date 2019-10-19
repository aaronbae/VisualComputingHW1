function B = minusMean(A)
    m = mean(A,'all');
    B = A - m;
    B(B<0) = 0;
end

