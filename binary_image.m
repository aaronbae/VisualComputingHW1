function B = binary_image(A,t)
    B = A>t
    B(B==1) = 255; 
end
