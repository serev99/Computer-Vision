%Question 3(b)

function zcr = zeroCrossingLOG(image, N, sigma)

grayimg = rgb2gray(image);
lplOG = make2DLOG(N, sigma);
cvimg = convIMG(grayimg, lplOG);

[cvimr, cvimc] = size(cvimg);
for x = 2 : cvimr-1
    for y = 2 : cvimc-1
        % A point IS of ZERO-CROSSING iff one of its neighborhoods is
        % greater than ZERO, and the other is smaller than ZERO
        if ( (cvimg(x-1,y)>0 && cvimg(x+1,y)<0) || (cvimg(x-1,y)<0 && cvimg(x+1,y)>0) || ...
             (cvimg(x,y-1)>0 && cvimg(x,y+1)<0) || (cvimg(x,y-1)<0 && cvimg(x,y+1)>0) || ...
             (cvimg(x-1,y+1)>0 && cvimg(x+1,y-1)<0) || (cvimg(x-1,y+1)<0 && cvimg(x+1,y-1)>0) || ...
             (cvimg(x-1,y-1)>0 && cvimg(x+1,y+1)<0) || (cvimg(x-1,y-1)<0 && cvimg(x+1,y+1)>0)   )
            image(x, y, 1) = 245;
            image(x, y, 2) = 150;
            image(x, y, 3) = 150;
        end
    end
end

zcr = image;

end