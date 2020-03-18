%Question 2(c)

function [even, odd] = make2DGabor(N, lambda, angle)

% N is assumed to be odd, and so the origin (0,0) is positioned at indices
% (M+1,M+1) where N = 2*M + 1.
% lambda : wavelength of the Gabor filter
% angle : orientation of the Gabor filter
% Set sigma of Gaussian part of filter = wavelength lambda

% Given the above instructions
position = (N-1)/2;
domain = -position:position;
x = position;
y = position;
[x,y] = meshgrid(domain, domain);

% DEFAULT SpatialFrequencyBandwidth: SIGMA=lambda
% DEFAULT SpatialPhase: PSI=0

% Compute the gaussian
sigma = lambda;
g = exp(-(x.*x+y.*y)/(2*sigma*sigma));

% Compute the Gabor
even = g.*cos(2*pi.*(x.*cosd(angle)+y.*sind(angle))/lambda);
odd = g.*sin(2*pi.*(x.*cosd(angle)+y.*sind(angle))/lambda);

% Normalize
even = even/sum(even(:));
odd = odd/sum(odd(:));

end