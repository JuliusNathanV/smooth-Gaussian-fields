M = 20;
N = 1001;
x = linspace(-M,M,N);
y = x;
[X,Y] = meshgrid(x,y);
x1 = x(abs(x)<=1);
y1=x1;
[X1,Y1] = meshgrid(x1,y1);
dW = normrnd(0,1/sqrt(N),N,N);
colMap = [127 127 255; 255 255 127]/255;

q1 = exp(-1./max(0,1-(X1.^2 + Y1.^2)));


f1 = conv2(dW,q1,'same');
figure
clf
hold on
contourf(X,Y,sign(f1),'edgecolor','none')
colormap(colMap)

m= 5;
rectangle('Position',[-m,-m,2*m,2*m],'EdgeColor','g')
rectangle('Position',[-(m+1),-(m+1),2*(m+1),2*(m+1)],'EdgeColor','r')
rectangle('Position',[-(m-1),-(m-1),2*(m-1),2*(m-1)],'EdgeColor','m')


C = and(abs(X)<=m,abs(Y)<=m);
dW3 = -dW.*(1-C) + dW.*C;
f3 = conv2(dW3,q1,'same');


figure
contourf(X,Y,sign(f3),'edgecolor','none')
colormap(colMap)
rectangle('Position',[-m,-m,2*m,2*m],'EdgeColor','g')
rectangle('Position',[-(m+1),-(m+1),2*(m+1),2*(m+1)],'EdgeColor','r')
rectangle('Position',[-(m-1),-(m-1),2*(m-1),2*(m-1)],'EdgeColor','m')

