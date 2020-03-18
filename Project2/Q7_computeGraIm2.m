function [graMag, graDir, wGraMag] = Q7_computeGraIm2(kps, image)

% Initialization
num = length(kps); % Record the number of keypoints at a level
sigma = cell2mat(kps{1}{1}(3)); % For a same level, the keypoints share a same Sigma
graMag = cell(num,1);
graDir = cell(num,1);
wGraMag = cell(num,1);

for i = 1:num
    % Construct a 15*15 window
    cx = cell2mat(kps{i}{1}(1));
    cy = cell2mat(kps{i}{1}(2)); 
    window = image(max(cy-7,1):min(cy+7,floor(1024*1.2/sigma)),max(cx-7,1):min(cx+7,floor(1024*1.2/sigma)));
    % Compute gradient magnitude, gradient direction & weighted gradient magnitude 
    [graMag{i}, graDir{i}] = imgradient(window,'central');
    wGraMag{i} = imgaussfilt(graMag{i},1.5); % Choose Gaussian Sigma = 1.5
end

end