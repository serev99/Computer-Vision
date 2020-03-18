% Question 6
% Write a Matlab function that takes five arguments as inputs (image,x0,y0,theta,s),

function newimage=Q6_rotation(image,x0,y0,theta,s)

[imHeight,imWidth,~] = size(image);
cx = floor(imWidth/2+1);
cy = floor(imHeight/2+1);
deltay = cy-x0;
deltax = cx-y0;

% Deal with boundary cases
[th, rho] = cart2pol(-deltax,deltay);
[nx, ny] = pol2cart(th+theta*(pi/180), rho);
shiftedx = round(y0-(cx+nx));
shiftedy = round(x0-(cy-ny));
paddedx = abs(shiftedx);
paddedy = abs(shiftedy);
padded = padarray(image, [paddedy paddedx]);

% Rotate around the center
rottatedimg = imrotate(padded, theta, 'crop');

% Crop image.
cropped = rottatedimg(paddedy+1-shiftedy:end-paddedy-shiftedy, paddedx+1-shiftedx:end-paddedx-shiftedx, :);

newimage = imresize(cropped,s);

end