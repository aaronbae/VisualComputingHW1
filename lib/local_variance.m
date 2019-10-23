function [output] = local_variance(second_derivative, zero_crossing)
    SCALE_CONSTANT = 2; %[10, 7, 10, 5, 2] This depends on the image
    output = zeros(size(second_derivative));
    var = stdfilt(second_derivative).^2;
    t = mean(mean(var(zero_crossing==1)))/SCALE_CONSTANT; %[10, 7, 10, 5, 2]
    output(var>t & zero_crossing==1) = 1;   
end

