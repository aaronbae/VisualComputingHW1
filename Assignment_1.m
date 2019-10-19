A = im2double( imread( 'cartoon.jpg' ) );
X = zeros(1,10000,'uint8');
A_OneD = reshape(A',[1 size(A,1)*size(A,2)]);
A_sorted = sort(A_OneD);

histogram(A_sorted,32);

X = binary_image(A,0);
imshow(X);

X = minusMean(A);
imshow(X);

y = 1:8;
B = reshape(y,[4,2]);

vector = 1:2:(size(A,1));
X = subsample(A,vector); % putting uint8 gives another output image
imshow(X)

h = fspecial('gaussian',20,24);
B = imfilter(A,h);
imshow(B);

h = fspecial('gaussian',30,45);
B = imfilter(A,h);
imshow(B);

h = fspecial('gaussian',10,12);
B = imfilter(A,h);
imshow(B);

B = conv2(A,h);
imshow(B);

box_filter = [1/4 1/4;1/4 1/4];
gaussian_pyramid(A,box_filter);
gaussian_pyramid_retain_size(A,box_filter);

laplacian_pyramid(A,box_filter)

laplacian_op = [-1/8 -1/8 -1/8; -1/8 1 -1/8; -1/8 -1/8 -1/8];
detectedge(A,box_filter,laplacian_op)