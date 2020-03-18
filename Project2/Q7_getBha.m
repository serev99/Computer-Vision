function d=Q7_getBha(X1,X2)

% https://www.mathworks.com/matlabcentral/fileexchange/18662-bhattacharyya-distance-measure-for-pattern-recognition?focused=5100018&tab=function

[n,m]=size(X1);
% check dimension 
% assert(isequal(size(X2),[n m]),'Dimension of X1 and X2 mismatch.');
assert(size(X2,2)==m,'Dimension of X1 and X2 mismatch.');
mu1=mean(X1);
C1=cov(X1);
mu2=mean(X2);
C2=cov(X2);
C=(C1+C2)/2;
dmu=(mu1-mu2)/chol(C);
try
    d=0.125*dmu*dmu'+0.5*log(det(C/chol(C1*C2)));
catch
    d=0.125*dmu*dmu'+0.5*log(abs(det(C/sqrtm(C1*C2))));
    warning('MATLAB:divideByZero','Data are almost linear dependent. The results may not be accurate.');
end