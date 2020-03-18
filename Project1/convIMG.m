%Question 3(a)

function c = convImg(image, filter)

% Preparations
image = im2double(image);
imr = size(image,1);
imc = size(image,2);
[fr, fc] = size(filter);

% Padding Strategy:
% Fill the blanks outside image with ZEROs with:
% (fr-imr) rows of zeros on the bottom
% (fc-imc) columns of zeros on the right
% Then, the top-left pixel of image remain at (1,1)
% -------------------------------------------------
% ----"image"----||----"filter"---||---"pad-img"---
% xxxxxxx        || fffffffffffff || xxxxxxx000000
% xxxxxxx        || fffffffffffff || xxxxxxx000000
% xxxxxxx        || fffffffffffff || xxxxxxx000000
%                || fffffffffffff || 0000000000000
%                || fffffffffffff || 0000000000000

padimg = padarray(image, [(fr-imr), (fc-imc)], 0, "post");
padconv = conv2(padimg, filter, "same");
c = padconv(1:imr, 1:imc);

end