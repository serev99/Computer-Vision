%Question 2(a)

function g = make2DGaussian(N, sigma)

% N is assumed to be odd, and so the origin (0,0) is positioned at indices
% (M+1,M+1) where N = 2*M + 1.

% Given the above instructions
position = (N-1)/2;
domain = -position:position;
x = position;
y = position;
[x,y] = meshgrid(domain, domain);

% Compute the Gaussian
g = exp(-(x.*x+y.*y)/(2*sigma*sigma));

% Normalize
g = g/sum(g(:));

end
