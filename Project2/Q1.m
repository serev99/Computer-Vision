% Question1 - Gaussian Pyramid
% 7 levels

% Read img in gray mode
image = imread('manor.png');
im_gray = rgb2gray(image);
im = im2double(im_gray);

% L0
im0 = imgaussfilt(im,1);

% L1
im1 = imgaussfilt(im,2);
im1 = imresize(im1,0.5);

% L2
im2 = imgaussfilt(im,4);
im2 = imresize(im2,0.5^2);

% L3
im3 = imgaussfilt(im,8);
im3 = imresize(im3,0.5^3);

% L4
im4 = imgaussfilt(im,16);
im4 = imresize(im4,0.5^4);

% L5
im5 = imgaussfilt(im,32);
im5 = imresize(im5,0.5^5);

% L6
im6 = imgaussfilt(im,64);
im6 = imresize(im6,0.5^6);

figure,imshow(im0,[]);
figure,imshow(im1,[]);
figure,imshow(im2,[]);
figure,imshow(im3,[]);
figure,imshow(im4,[]);
figure,imshow(im5,[]);
figure,imshow(im6,[]);


