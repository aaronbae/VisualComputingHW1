function output = gaussian_pyramid(image, filter, layer, resize)
% This function returns a specific layer, layer, of the Gaussian pyramid.
% image : image matrix
% filer : a smaller size matrix
% layer : integer representing the layer
% resize: boolean indicating whether to resize the image
    % Layer 0 or less doesn't exist for Laplacian Pyramid
    % Option: if resize is not given, default to 'true'
    if nargin == 3
        resize = true;
    end
    % make a copy of the image
    output = image(:,:);
    for l=1:layer
        output = imfilter(output, filter);
        output = double(output(1:2:end, 1:2:end));
    end
    if resize
        output = imresize(output, length(image)/length(output));
    end
end


