% For the same keypoint you used in part 4, create a plot of the 1D orientation histogram

function [V,cyclicV] = Q7_computefvIm2(kps, image)

% Initialization
num = length(kps); % Record the number of keypoints at a level
sigma = cell2mat(kps{1}{1}(3)); % For a same level, the keypoints share a same Sigma
graMag = cell(num,1);
graDir = cell(num,1);
wGraMag = cell(num,1);

V = cell(num,1);
cyclicV = cell(num,1);

for i = 1:num
    % Construct a 15*15 window
    cx = cell2mat(kps{i}{1}(1));
    cy = cell2mat(kps{i}{1}(2)); 
    window = image(max(cy-7,1):min(cy+7,floor(1024*1.2/sigma)),max(cx-7,1):min(cx+7,floor(1024*1.2/sigma)));
    % Compute gradient magnitude, gradient direction & weighted gradient magnitude 
    [graMag{i}, graDir{i}] = imgradient(window,'central');
    wGraMag{i} = imgaussfilt(graMag{i},1.5); % Choose Gaussian Sigma = 1.5
    
    % Compute featrue Vector
    complexGra = wGraMag{i} + 1i*graDir{i};
    vector = zeros(36, 1);
    for j = -17:18
        vector(j+18) = sum(real(complexGra((j-1)*10<imag(complexGra)&imag(complexGra)<=j*10)),'all');
    end
    for k = 0:8
        vector([19+k, 36-k]) = vector([36-k, 19+k]);
    end
    V{i} = [cx; cy; sigma; vector];
    % Cyclic shift CCW
    [~,locs] = max(vector);
    vector([1, locs]) = vector([locs, 1]);
    cyclicV{i} = [cx; cy; sigma; vector];
    
end

end