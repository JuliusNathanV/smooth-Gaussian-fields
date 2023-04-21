N = 500;
M =50;
x = linspace(-M,M,N);
y = linspace(-M,M,N);
[X,Y] = meshgrid(x,y);
%get polar coords for grid
R = abs(X + 1i*Y);
T = angle(X + 1i*Y);
%maximum order for RPW
a = 100;
%generate complex random variables (real/im parts are iid N(0,1/2))
A = normrnd(0,1/2,a,2);
C0 = normrnd(0,1);
%Z is the field
Z = zeros(size(X));
%do n=0 first
Z = Z + C0*besselj(0,R);
for n = 1:a
    Z = Z+2*besselj(n,R).*(A(n,1)*cos(n*T)-A(n,2)*sin(n*T));
end
figure
%plot the field
surf(X,Y,Z,'edgecolor','none')
%also plot the excursion sets
figure
contourf(X,Y,sign(Z),'edgecolor','none')
        