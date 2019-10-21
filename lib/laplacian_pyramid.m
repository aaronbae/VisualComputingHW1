function L = laplacian_pyramid(image, filter, l)
% This function returns a specific layer, l, of the Laplacian pyramid.
% image: image matrix
% filer: a smaller size matrix
% l    : integer representing the layer
    % Layer 0 or less doesn't exist for Laplacian Pyramid
    if l <= 0
        L = image;
    else 
        G_prev = gaussian_pyramid(image, filter, l-1, false);
        G = gaussian_pyramid(image, filter, l, false);
        L = double(G_prev(1:2:end,1:2:end)) - G;
    end
    % Note that it always resizes
    L = imresize(L, length(image)/length(L));
end


