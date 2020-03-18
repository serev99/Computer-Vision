%Question 2(b)

function log = make2DLOG(N, sigma)

% N is assumed to be odd, and so the origin (0,0) is positioned at indices
% (M+1,M+1) where N = 2*M + 1.

% Given the above instructions
position = (N-1)/2;
domain = -position:position;
x = position;
y = position;
[x,y] = meshgrid(domain, domain);

% Computer the LOG
log = ((((x.*x+y.*y)/(2*sigma*sigma))-1)/(sigma*sigma*sigma*sigma)) .* (exp(-(x.*x+y.*y)/(2*sigma*sigma)));

% Normalize (TO ZERO !!)
s = sum(log(:))/(N.*N);
log = log - s;

end