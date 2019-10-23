clear all;
addpath('lib');
addpath('img');
image_files = dir(fullfile('img','*.jpg'));

%% Part 0. Getting Started - part a
% Sort all the intensities in A, put the result in a single 
% 10000-dimensional vector x, and plot the values in x.
A = im2double( imread( 'cartoon.jpg' ) );
A_flattened = reshape(A',[1 size(A,1)*size(A,2)]);
A_sorted = sort(A_flattened);
total_length = length(A_sorted);
figure();
plot(1:total_length, A_sorted);
title("Sorted Intensity Values of Cartoon");
xlabel("Indices");
ylabel("Intensities");
xticks([[0:10000:total_length]]);
ax = gca;
ax.XRuler.Exponent = 0;
saveas(gcf,'img/part0/intensity_graph_of_cartoon.jpg')
close gcf;

%% part b
% Display a figure showing a histogram of A's intensities with 32 bins.
figure();
histogram(A_sorted,32);
title("Histogram of the Image Pixel Intensities with 32 bins");
xlabel("Intensities");
ylabel("Frequency");
ax = gca;
ax.YRuler.Exponent = 0;
saveas(gcf,'img/part0/histogram_of_cartoon.jpg')
close gcf;

%% part c
% Create and display a new binary image with the same size as A, which is
% white wherever the intensity in A is greater than a threshold t, and
% black everywhere else
for t=[0.0, 0.2, 0.8, 1.0]
    X = binary_image(A,t);
    saveImage(X, "part0", "Binary of Cartoon with Threshold "+num2str(t));
end

%% part d
% Generate a new image (matrix), which as the same size as A, but with A's
% mean intensity value subtracted form each pixel. Set any negative values
% to 0.
X = minusMean(A);
saveImage(X, "part0", "Mean Subtracted Cartoon");


%% part e
% Let y be the vector: y=[1:8]. Use the reshape command to form a new
% matrix s whose first column is [1,2,3,4]', and whose second column is
% [5,6,7,8]'.
y = 1:8
B = reshape(y,[4,2])

%% part f
% Create a vector [1,3,5,...,99]. Extract corresponding pixel from the
% image in its two dimensions, ie., subsample the original image to its
% half size.
vector = 1:2:(size(A,1));
X = subsample(A,vector); % putting uint8 gives another output image
saveImage(X, "part0", "Subsampled Cartoon");

%% part g
% Use fspecial to create a Gaussian Filter and then apply the imfilter
% function to the image with the created Gaussian Filter, by doing so you
% should see a blurred image. Change three combinations of parameters of
% the Gaussian Filter and compare the results.
h = fspecial('gaussian',20,24);
B = imfilter(A,h);
saveImage(B, "part0", "Cartoon with hsize 20 and sigma 24");

h = fspecial('gaussian',30,45);
B = imfilter(A,h);
saveImage(B, "part0", "Cartoon with hsize 30 and sigma 45");

h = fspecial('gaussian',10,12);
B = imfilter(A,h);
saveImage(B, "part0", "Cartoon with hsize 10 and sigma 12");

%% part h
% Apply the conv2 instead of imfilter function to the same process (for one
% Gaussian Filter), do you see any changes? Why?
B = conv2(A,h);
saveImage(B, "part0", "Cartoon with conv2 Filter");

%% Part 1: Gaussian Pyramid
box_filter = [1/4 1/4;1/4 1/4];
% Iterate through all images
for j=1:length(image_files)
    image_name = image_files(j).name;

    img = im2double( imread( image_name ) ); 
    % Iterate through until img dimensions become 1x1
    for i=0:log2(size(img))
        G = gaussian_pyramid(img, box_filter, i);
        title_name = image_name + " Gaussian Pyramid Layer = " + num2str(i);
        saveImage(G, "part1", title_name);
    end

end

%% Part 2: Laplacian Pyramid
% Iterate through all images
for j=1:length(image_files)
    image_name = image_files(j).name;
    img = im2double( imread( image_name ) ); 
    % Iterate through until img dimensions become 1x1
    for i=1:log2(size(img))
        L = laplacian_pyramid(img, box_filter, i);
        title_name = image_name + " Laplacian Pyramid Layer " + num2str(i);
        saveImage(L, "part2", title_name);
        exit(code)
    end
end

%% Part 3: Multi-Scale Edge Detection
laplacian_op = [-1/8 -1/8 -1/8; -1/8 1 -1/8; -1/8 -1/8 -1/8];

% Iterate through all images
for j=1:length(image_files)
    image_name = image_files(j).name;
    
    img = im2double( imread( image_name ) ); 
    % Iterate through until img dimensions become 1x1
    for i=1:1
	%for i=0:log2(size(img))
        G = gaussian_pyramid(img, box_filter, i);
        Lop = imfilter(G,laplacian_op); 
        S = segment(Lop);
        Z = zerocrossing(S);
        
        for t=[0.001, 0.0001, 0.01]
            LZ = local_variance(Lop, Z,t);
            title_name = image_name + " Local variance Layer " + num2str(i)+" with threshold " + num2str(t);
            saveImage(LZ, "part3", title_name);
        end
    end

end

%% Part 4: Multi-Resolution Spline
close all; clc; 
img_size = 256;
mask_filter = [zeros(img_size,img_size/2) ones(img_size,img_size/2)];

% Show Filter
saveImage(mask_filter, "part4", "Mask Filter");
image_pairs = [3,5;3,7;4,3];

% Iterate through each image pair
for i=1:length(image_pairs)
    p=image_pairs(i,:);
    imgA_name = image_files(p(1)).name;
    imgA = im2double(imread(imgA_name));
    imgB_name = image_files(p(2)).name;
    imgB = im2double(imread(imgB_name));
    final_image = zeros(size(imgA));
    
    % Iterate through until img dimensions become 1x1
    for j=1:log2(size(imgA))
        L_A = laplacian_pyramid(imgA, box_filter, j);
        L_B = laplacian_pyramid(imgB, box_filter, j);
        G = gaussian_pyramid(mask_filter, box_filter, j);
        L_S = G.*L_A + (1-G).*L_B;
        final_image = final_image + L_S;
    end
    
    % Show image
    title_name = "Splined "+imgA_name+" and "+imgB_name;
    saveImage(final_image, "part4", title_name)
end
