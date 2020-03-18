% Question 6 - Rotation and Scaling

image = imread('manor.png');
im = im2double(image);

% center at (500,500), rotation of 45deg ccw, scaling at 0.8
trim1 = Q6_rotation(im,500,450,45,0.8);
% center at (450,650), rotation of 60deg cw, scaling at 1.5
trim2 = Q6_rotation(im,450,650,-60,1.5);
% center at (500,500), rotation of 30deg ccw, scaling at 1.2
trim3 = Q6_rotation(im,500,500,30,1.2);

figure,
imshow(im,[]);
figure,
imshow(trim1,[]);
cx = 0.8*500;
cy = 0.8*450;
rd = 10;
rectangle('Position',[cx-rd,cy-rd,2*rd,2*rd],'Curvature',[1,1],'linewidth',3,'EdgeColor','m')
figure,
imshow(trim2,[]);
cx = 1.5*450;
cy = 1.5*650;
rd = 10;
rectangle('Position',[cx-rd,cy-rd,2*rd,2*rd],'Curvature',[1,1],'linewidth',3,'EdgeColor','m')
figure,
imshow(trim3,[]);
cx = 1.2*500;
cy = 1.2*500;
rd = 10;
rectangle('Position',[cx-rd,cy-rd,2*rd,2*rd],'Curvature',[1,1],'linewidth',3,'EdgeColor','m')