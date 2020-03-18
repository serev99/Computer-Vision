function keypts = Q3_findkp(above,cur,below,csigma,threshold)

% Initialization
% Note that in slides 28 Lecture 9, for a level L:
% the DOG level ABOVE is L-1;
% the DOG level BELOW is L+1.
above = imresize(above,0.5);
below = imresize(below,2);
[rows,cols] = size(cur);
keypts = {};
minIntensity = 0.1;
index =1;

% Loops
% Find both STRONG Min & Max using threshold with a minimum intensity required
for i=2:rows-1
    for j=2:cols-1
        
        % Find Min
        cMin = min(min(cur(i-1:i+1,j-1:j+1)));
        if (cur(i,j)==cMin) % Index at currentLevel(i,j)
           if (length(find(cur(i-1:i+1,j-1:j+1)==cMin))==1) % Uniqueness of minimum
               if ((cMin<min(min(above(i-1:i+1,j-1:j+1)))) && (cMin<min(min(below(i-1:i+1,j-1:j+1))))) % Minimum in ALL 3 levels
                   if (abs(cur(i,j))>=minIntensity) % minIntensity requirement
                       % Assure that even the MIN difference between 
                       % cur(i,j) and its neighbors in 3*3 girds is
                       % greater than the value of threshold
                       minDiff = min([abs(cur(i,j)-cur(i-1,j)) abs(cur(i,j)-cur(i+1,j))...
                                      abs(cur(i,j)-cur(i,j-1)) abs(cur(i,j)-cur(i-1,j))...
                                      abs(cur(i,j)-cur(i-1,j-1)) abs(cur(i,j)-cur(i-1,j+1))...
                                      abs(cur(i,j)-cur(i+1,j-1)) abs(cur(i,j)-cur(i+1,j+1))]);
                       if (minDiff>=threshold)
                           keypts{index}{1,1,1} = {j,i,csigma};
                           index = index+1; 
                       end
                   end
               end
           end
        end
        
        % Find Max
        cMax = max(max(cur(i-1:i+1,j-1:j+1)));
        if (cur(i,j)==cMax) % Index at currentLevel(i,j)
           if (length(find(cur(i-1:i+1,j-1:j+1)==cMax))==1) % Uniqueness of maximum
               if ((cMax>max(max(above(i-1:i+1,j-1:j+1)))) && (cMax>max(max(below(i-1:i+1,j-1:j+1))))) % Maximum in ALL 3 levels
                   if (abs(cur(i,j))>=minIntensity) % minIntensity requirement
                       % Assure that even the MIN difference between 
                       % cur(i,j) and its neighbors in 3*3 girds is
                       % greater than the value of threshold
                       minDiff = min([abs(cur(i,j)-cur(i-1,j)) abs(cur(i,j)-cur(i+1,j))...
                                      abs(cur(i,j)-cur(i,j-1)) abs(cur(i,j)-cur(i-1,j))...
                                      abs(cur(i,j)-cur(i-1,j-1)) abs(cur(i,j)-cur(i-1,j+1))...
                                      abs(cur(i,j)-cur(i+1,j-1)) abs(cur(i,j)-cur(i+1,j+1))]);
                       if (minDiff>=threshold)
                           keypts{index}{1,1,1} = {j,i,csigma};
                           index = index+1; 
                       end
                   end
               end
           end
        end
          
    end
end

end