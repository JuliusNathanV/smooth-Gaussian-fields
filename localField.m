%Some stationary Gaussian fields have a so-called moving average representation;
%f = q * W, say, where W is a spatial white noise and q is some kernel.
%This is possible when the covariance of f is K(x,y) = K(x-y) = (q*q)(x-y).
%This script simulates such fields when we specify q.

%We simulate in the box [-M,M]^2 using N data points for the white noise
%and approximation of q.

%This simulation procedure works particularly well when K and q decay
%sufficiently fast or is compactly supported. In this case we can shrink
%the size of our matrix for q and the convolution computation becomes
%much quicker.

N = 1000;
M =50;
x = linspace(-M,M,N);
y = linspace(-M,M,N);
[X,Y] = meshgrid(x,y);


%Simulates a field where q is 1 for ||x-y||_inf <=R and 0 otherwise
R = 5;
x1 = x(abs(x)<=1);
y1 = y(abs(y)<=1);
[X1,Y1] = meshgrid(x1,y1);
q=ones(size(X1));


%Simulates a field where q is a bump function of radius 1.
% q=exp(-1./max(0,1-((X.^2+Y.^2)/100)));
% x1 = x(abs(x)<=1);
% y1 = y(abs(y)<=1);
% [X1,Y1] = meshgrid(x1,y1);
% q = exp(-1./max(0,1-(X1.^2 + Y1.^2)));

%Simulates a field with exp(-|x|) covariance.
% q = besselk(0,sqrt(X.^2 + Y.^2));

W = normrnd(0,1,size(X));
Z =conv2(W,q,'same');
figure
surf(X,Y,Z,'edgecolor','none')
figure
contourf(X,Y,sign(Z))