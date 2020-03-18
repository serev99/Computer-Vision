%Question 3(d)

function zcr = zeroCrossingGabor(image, N, lambda)

grayimg = rgb2gray(image);
[e0, od0] = make2DGabor(N, lambda, 0);
[e45, od45] = make2DGabor(N, lambda, 45);
[e90, od90] = make2DGabor(N, lambda, 90);

% Check angle=0
cvimg = convIMG(grayimg, od0);
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

% Check angle=45
cvimg = convIMG(grayimg, od45);
[cvimr, cvimc] = size(cvimg);
for x = 2 : cvimr-1
    for y = 2 : cvimc-1
        % A point IS of ZERO-CROSSING iff one of its neighborhoods is
        % greater than ZERO, and the other is smaller than ZERO
        if ( (cvimg(x-1,y)>0 && cvimg(x+1,y)<0) || (cvimg(x-1,y)<0 && cvimg(x+1,y)>=0) || ...
             (cvimg(x,y-1)>0 && cvimg(x,y+1)<0) || (cvimg(x,y-1)<0 && cvimg(x,y+1)>=0) || ...
             (cvimg(x-1,y+1)>0 && cvimg(x+1,y-1)<0) || (cvimg(x-1,y+1)<0 && cvimg(x+1,y-1)>=0) || ...
             (cvimg(x-1,y-1)>0 && cvimg(x+1,y+1)<0) || (cvimg(x-1,y-1)<0 && cvimg(x+1,y+1)>=0)   )
            image(x, y, 1) = 245;
            image(x, y, 2) = 150;
            image(x, y, 3) = 150;
        end
    end
end

% Check angle=90
cvimg = convIMG(grayimg, od90);
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