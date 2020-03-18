% Question5 - Feature Vectors

% ---------------------------------- %
% ---------- Copy from Q4 ---------- %
% ---------------------------------- %
image = imread('manor.png');
im_gray = rgb2gray(image);
im = im2double(im_gray);

% -------- Gaussian Pyramid -------- %
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
im6 = imgaussfilt(im,64);;
im6 = imresize(im6,0.5^6);

% -------- Laplacian Pyramid -------- %
% L5
im6 = imresize(im6,2);
im6 = conv2(im6,G5,'same');
[pd1,pd2]=size(im6);
[pd3,pd4]=size(im5);
if pd1~=pd3|| pd2~=pd4
    im5 = padarray(im5,[abs(pd3-pd1) abs(pd4-pd2)],'replicate','post');
end
diff5 = im6-im5;

% L4
im5 = imresize(im5,2);
im5 = conv2(im5,G4,'same');
[pd1,pd2]=size(im5);
[pd3,pd4]=size(im4);
if pd1~=pd3|| pd2~=pd4
    im4 = padarray(im4,[abs(pd3-pd1) abs(pd4-pd2)],'replicate','post');
end
diff4 = im5-im4;

% L3
im4 = imresize(im4,2);
im4 = conv2(im4,G3,'same');
[pd1,pd2]=size(im4);
[pd3,pd4]=size(im3);
if pd1~=pd3|| pd2~=pd4
    im3 = padarray(im3,[abs(pd3-pd1) abs(pd4-pd2)],'replicate','post');
end
diff3 = im4-im3;

% L2
im3 = imresize(im3,2);
im3 = conv2(im3,G2,'same');
[pd1,pd2]=size(im3);
[pd3,pd4]=size(im2);
if pd1~=pd3|| pd2~=pd4
    im2 = padarray(im2,[abs(pd3-pd1) abs(pd4-pd2)],'replicate','post');
end
diff2 = im3-im2;

% L1
im2 = imresize(im2,2);
im2 = conv2(im2,G1,'same');
[pd1,pd2]=size(im2);
[pd3,pd4]=size(im1);
if pd1~=pd3|| pd2~=pd4
    im1 = padarray(im1,[abs(pd3-pd1) abs(pd4-pd2)],'replicate','post');
end
diff1 = im2-im1;

% L0
im1 = imresize(im1,2);
im1 = conv2(im1,G0,'same');
[pd1,pd2]=size(im1);
[pd3,pd4]=size(im0);
if pd1~=pd3|| pd2~=pd4
    im0 = padarray(im0,[abs(pd3-pd1) abs(pd4-pd2)],'replicate','post');
end
diff0 = im1-im0;

% Find SIFT Keypoints
% findkp(above,cur,below,csigma,threshold)
kp1 = Q3_findkp(diff0,diff1,diff2,2,0.01);
kp2 = Q3_findkp(diff1,diff2,diff3,4,0.015);
kp3 = Q3_findkp(diff2,diff3,diff4,8,0.015);
kp4 = Q3_findkp(diff3,diff4,diff5,16,0.015);
kp5 = Q3_findkp(diff4,diff5,im6,32,0.01);

% Question 4
% For each SIFT keypoint choose the image
% in the Gaussian pyramid at its scale.
% Note: keypoint scale is scale of DoG image
[graMag1, graDir1, wGraMag1] = Q4_computeGra(kp1,diff1);
[graMag2, graDir2, wGraMag2] = Q4_computeGra(kp2,diff2);
[graMag3, graDir3, wGraMag3] = Q4_computeGra(kp3,diff3);
[graMag4, graDir4, wGraMag4] = Q4_computeGra(kp4,diff4);
[graMag5, graDir5, wGraMag5] = Q4_computeGra(kp5,diff5);

% ---------------------------------- %
% ------ End of copy from Q4 ------- %
% ---------------------------------- %
% To illustrate
[V,cyclicV] = Q5_computefv(kp2,diff2);
figure,
plot(V{2}(4:39,1:1));title('Raw Histogram for the KP in Q4');

figure,
plot(cyclicV{2}(4:39,1:1));title('Histogram after cyclic shift for the KP in Q4');









