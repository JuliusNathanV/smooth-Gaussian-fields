%approximates bargmann fock with convolution with discrete white noise

N = 500;
M =50;
x = linspace(-M,M,N);
y = linspace(-M,M,N);
dx = x(2)-x(1);
[X,Y] = meshgrid(x,y);
q = (2/pi())^(-1/2)*exp(-(X.^2+Y.^2));
W = normrnd(0,dx^2*sqrt(10),size(X));
Z =conv2(W,q);
Z = Z(floor(N/2):floor(N/2)+N-1,floor(N/2):floor(N/2)+N-1);
figure
surf(X,Y,Z,'edgecolor','none')
Zapprox = sign(Z);
figure
% surf(X,Y,Zapprox,'edgecolor','none')
contourf(X,Y,Zapprox,'edgecolor','none')