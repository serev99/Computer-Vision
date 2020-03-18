% Question 7

image = imread('manor.png');
im_gray = rgb2gray(image);
im = im2double(im_gray);

% center at (500,450), rotation of 45deg ccw, scaling at 0.8
trim = Q6_rotation(im,500,450,45,0.8);
trim_colored = Q6_rotation(image,500,450,45,0.8);

% ---------------------------------- %
% -------- Gaussian Pyramid -------- %
% ---------------------------------- %
% L0
im0 = imgaussfilt(trim,1);

% L1
im1 = imgaussfilt(trim,2);
im1 = imresize(im1,0.5);

% L2
im2 = imgaussfilt(trim,4);
im2 = imresize(im2,0.5^2);

% L3
im3 = imgaussfilt(trim,8);
im3 = imresize(im3,0.5^3);

% L4
im4 = imgaussfilt(trim,16);
im4 = imresize(im4,0.5^4);

% L5
im5 = imgaussfilt(trim,32);
im5 = imresize(im5,0.5^5);

% L6
im6 = imgaussfilt(trim,64);;
im6 = imresize(im6,0.5^6);
% ------------------------------------ %
% ----- End of Gaussian Pyramid  ----- %
% ------------------------------------ %


% ----------------------------------- %
% -------- Laplacian Pyramid -------- %
% ----------------------------------- %
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
% ------------------------------------- %
% ----- End of Laplacian Pyramid  ----- %
% ------------------------------------- %

% Question 3
% Find SIFT Keypoints

% findkp(above,cur,below,csigma,threshold)
kp1 = Q3_findkp(diff0,diff1,diff2,2,0.01);
kp2 = Q3_findkp(diff1,diff2,diff3,4,0.015);
kp3 = Q3_findkp(diff2,diff3,diff4,8,0.015);
kp4 = Q3_findkp(diff3,diff4,diff5,16,0.015);
kp5 = Q3_findkp(diff4,diff5,im6,32,0.01);

% Question 7

[graMag1, graDir1, wGraMag1] = Q7_computeGraIm1(kp1,diff1);
[graMag2, graDir2, wGraMag2] = Q7_computeGraIm1(kp2,diff2);
[graMag3, graDir3, wGraMag3] = Q7_computeGraIm1(kp3,diff3);
[graMag4, graDir4, wGraMag4] = Q7_computeGraIm1(kp4,diff4);
[graMag5, graDir5, wGraMag5] = Q7_computeGraIm1(kp5,diff5);

[V1,cyclicV1] = Q7_computefvIm1(kp1,diff1);
[V2,cyclicV2] = Q7_computefvIm1(kp2,diff2);
[V3,cyclicV3] = Q7_computefvIm1(kp3,diff3);
[V4,cyclicV4] = Q7_computefvIm1(kp4,diff4);
[V5,cyclicV5] = Q7_computefvIm1(kp5,diff5);


% ------------------------------------------------------------------------------------- %
% ------------------------------------------------------------------------------------- %


image = imread('manor.png');
im_gray = rgb2gray(image);
im = im2double(im_gray);

% ---------------------------------- %
% -------- Gaussian Pyramid -------- %
% ---------------------------------- %
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
% ------------------------------------ %
% ----- End of Gaussian Pyramid  ----- %
% ------------------------------------ %


% ----------------------------------- %
% -------- Laplacian Pyramid -------- %
% ----------------------------------- %
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
% ------------------------------------- %
% ----- End of Laplacian Pyramid  ----- %
% ------------------------------------- %

% Question 3
% Find SIFT Keypoints

% findkp(above,cur,below,csigma,threshold)
okp1 = Q3_findkp(diff0,diff1,diff2,2,0.01);
okp2 = Q3_findkp(diff1,diff2,diff3,4,0.015);
okp3 = Q3_findkp(diff2,diff3,diff4,8,0.015);
okp4 = Q3_findkp(diff3,diff4,diff5,16,0.015);
okp5 = Q3_findkp(diff4,diff5,im6,32,0.01);

% Question 7

[ograMag1, ograDir1, owGraMag1] = Q4_computeGra(okp1,diff1);
[ograMag2, ograDir2, owGraMag2] = Q4_computeGra(okp2,diff2);
[ograMag3, ograDir3, owGraMag3] = Q4_computeGra(okp3,diff3);
[ograMag4, ograDir4, owGraMag4] = Q4_computeGra(okp4,diff4);
[ograMag5, ograDir5, owGraMag5] = Q4_computeGra(okp5,diff5);

[oV1,ocyclicV1] = Q5_computefv(okp1,diff1);
[oV2,ocyclicV2] = Q5_computefv(okp2,diff2);
[oV3,ocyclicV3] = Q5_computefv(okp3,diff3);
[oV4,ocyclicV4] = Q5_computefv(okp4,diff4);
[oV5,ocyclicV5] = Q5_computefv(okp5,diff5);


% ------------------------------------------------------------------------------------- %
% ------------------------------------------------------------------------------------- %

% Question 7
% Center at (500,450)
% Choose interested area (350-650, 300-600)
figure,
imshow(trim_colored,[]);

hold on
rectangle('Position',[350,300,300,300],'linewidth',1,'EdgeColor','w')

for i = 1:length(oV1)
    veci = oV1{i}(4:39,1:1);
    sumi = sum(veci(1:36));
    veci = veci/sumi;
    for j = 1:length(V1)
        vecj = V1{j}(4:39,1:1);
        sumj = sum(vecj(1:36));
        vecj = vecj/sumj;
        if (2*V1{j}(1,1)>350) && (2*V1{j}(1,1)<650) && (2*V1{j}(2,1)>300) && (2*V1{j}(2,1)<600)
            dist = Q7_getBha(veci,vecj);
            if (dist<0.04)
                cx = 2*V1{j}(1,1);
                cy = 2*V1{j}(2,1);
                rd = 2*V1{j}(3,1);
                rectangle('Position',[cx-rd,cy-rd,2*rd,2*rd],'linewidth',1,'EdgeColor','b')
            end
        end
    end
end

for i = 1:length(oV2)
    veci = oV1{i}(4:39,1:1);
    sumi = sum(veci(1:36));
    veci = veci/sumi;
    for j = 1:length(V2)
        vecj = V2{j}(4:39,1:1);
        sumj = sum(vecj(1:36));
        vecj = vecj/sumj;
        if (4*V2{j}(1,1)>350) && (4*V2{j}(1,1)<650) && (4*V2{j}(2,1)>300) && (4*V2{j}(2,1)<600)
            dist = Q7_getBha(veci,vecj);
            if (dist<0.04)
                cx = 4*V2{j}(1,1);
                cy = 4*V2{j}(2,1);
                rd = 2*V2{j}(3,1);
                rectangle('Position',[cx-rd,cy-rd,2*rd,2*rd],'linewidth',1,'EdgeColor','g')
            end
        end
    end
end

for i = 1:length(oV3)
    veci = oV3{i}(4:39,1:1);
    sumi = sum(veci(1:36));
    veci = veci/sumi;
    for j = 1:length(V3)
        vecj = V3{j}(4:39,1:1);
        sumj = sum(vecj(1:36));
        vecj = vecj/sumj;
        if (8*V3{j}(1,1)>350) && (8*V3{j}(1,1)<650) && (8*V3{j}(2,1)>300) && (8*V3{j}(2,1)<600)
            dist = Q7_getBha(veci,vecj);
            if (dist<0.04)
                cx = 8*V3{j}(1,1);
                cy = 8*V3{j}(2,1);
                rd = 2*V3{j}(3,1);
                rectangle('Position',[cx-rd,cy-rd,2*rd,2*rd],'linewidth',1,'EdgeColor','y')
            end
        end
    end
end

for i = 1:length(oV4)
    veci = oV4{i}(4:39,1:1);
    sumi = sum(veci(1:36));
    veci = veci/sumi;
    for j = 1:length(V4)
        vecj = V4{j}(4:39,1:1);
        sumj = sum(vecj(1:36));
        vecj = vecj/sumj;
        if (16*V4{j}(1,1)>350) && (16*V4{j}(1,1)<650) && (16*V4{j}(2,1)>300) && (16*V4{j}(2,1)<600)
            dist = Q7_getBha(veci,vecj);
            if (dist<0.04)
                cx = 16*V4{j}(1,1);
                cy = 16*V4{j}(2,1);
                rd = 2*V4{j}(3,1);
                rectangle('Position',[cx-rd,cy-rd,2*rd,2*rd],'linewidth',1,'EdgeColor','m')
            end
        end
    end
end

for i = 1:length(oV5)
    veci = oV5{i}(4:39,1:1);
    sumi = sum(veci(1:36));
    veci = veci/sumi;
    for j = 1:length(V5)
        vecj = V5{j}(4:39,1:1);
        sumj = sum(vecj(1:36));
        vecj = vecj/sumj;
        if (32*V5{j}(1,1)>350) && (32*V5{j}(1,1)<650) && (32*V5{j}(2,1)>300) && (32*V5{j}(2,1)<600)
            dist = Q7_getBha(veci,vecj);
            if (dist<0.04)
                cx = 32*V5{j}(1,1);
                cy = 32*V5{j}(2,1);
                rd = 2*V5{j}(3,1);
                rectangle('Position',[cx-rd,cy-rd,2*rd,2*rd],'linewidth',1,'EdgeColor','r')
            end
        end
    end
end


hold off




% Illustrate your keypoints by drawing circles at their locations 
% overlayed on the original 1024x1024 image
figure,
imshow(trim_colored,[]);

hold on
rectangle('Position',[350,300,300,300],'linewidth',1,'EdgeColor','w')

for i = 1:length(kp1)
    cx = 2*cell2mat(kp1{i}{1}(1));
    cy = 2*cell2mat(kp1{i}{1}(2));
    rd = 2*cell2mat(kp1{i}{1}(3));
    rectangle('Position',[cx-rd,cy-rd,2*rd,2*rd],'Curvature',[1,1],'linewidth',1,'EdgeColor','b')
end
for i = 1:length(kp2)
    cx = 4*cell2mat(kp2{i}{1}(1));
    cy = 4*cell2mat(kp2{i}{1}(2));
    rd = 2*cell2mat(kp2{i}{1}(3));
    rectangle('Position',[cx-rd,cy-rd,2*rd,2*rd],'Curvature',[1,1],'linewidth',1,'EdgeColor','g')
end
for i = 1:length(kp3)
    cx = 8*cell2mat(kp3{i}{1}(1));
    cy = 8*cell2mat(kp3{i}{1}(2));
    rd = 2*cell2mat(kp3{i}{1}(3));
    rectangle('Position',[cx-rd,cy-rd,2*rd,2*rd],'Curvature',[1,1],'linewidth',1,'EdgeColor','y')
end
for i = 1:length(kp4)
    cx = 16*cell2mat(kp4{i}{1}(1));
    cy = 16*cell2mat(kp4{i}{1}(2));
    rd = 2*cell2mat(kp4{i}{1}(3));
    rectangle('Position',[cx-rd,cy-rd,2*rd,2*rd],'Curvature',[1,1],'linewidth',1,'EdgeColor','m')
end
for i = 1:length(kp5)
    cx = 32*cell2mat(kp5{i}{1}(1));
    cy = 32*cell2mat(kp5{i}{1}(2));
    rd = 2*cell2mat(kp5{i}{1}(3));
    rectangle('Position',[cx-rd,cy-rd,2*rd,2*rd],'Curvature',[1,1],'linewidth',1,'EdgeColor','r')
end
hold off



figure,
imshow(image,[]);

hold on
for i = 1:length(okp1)
    cx = 2*cell2mat(okp1{i}{1}(1));
    cy = 2*cell2mat(okp1{i}{1}(2));
    rd = 2*cell2mat(okp1{i}{1}(3));
    rectangle('Position',[cx-rd,cy-rd,2*rd,2*rd],'Curvature',[1,1],'linewidth',1,'EdgeColor','b')
end
for i = 1:length(okp2)
    cx = 4*cell2mat(okp2{i}{1}(1));
    cy = 4*cell2mat(okp2{i}{1}(2));
    rd = 2*cell2mat(okp2{i}{1}(3));
    rectangle('Position',[cx-rd,cy-rd,2*rd,2*rd],'Curvature',[1,1],'linewidth',1,'EdgeColor','g')
end
for i = 1:length(okp3)
    cx = 8*cell2mat(okp3{i}{1}(1));
    cy = 8*cell2mat(okp3{i}{1}(2));
    rd = 2*cell2mat(okp3{i}{1}(3));
    rectangle('Position',[cx-rd,cy-rd,2*rd,2*rd],'Curvature',[1,1],'linewidth',1,'EdgeColor','y')
end
for i = 1:length(okp4)
    cx = 16*cell2mat(okp4{i}{1}(1));
    cy = 16*cell2mat(okp4{i}{1}(2));
    rd = 2*cell2mat(okp4{i}{1}(3));
    rectangle('Position',[cx-rd,cy-rd,2*rd,2*rd],'Curvature',[1,1],'linewidth',1,'EdgeColor','m')
end
for i = 1:length(okp5)
    cx = 32*cell2mat(okp5{i}{1}(1));
    cy = 32*cell2mat(okp5{i}{1}(2));
    rd = 2*cell2mat(okp5{i}{1}(3));
    rectangle('Position',[cx-rd,cy-rd,2*rd,2*rd],'Curvature',[1,1],'linewidth',1,'EdgeColor','r')
end
hold off