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
figure(1)
clf
hold on
contourf(X,Y,sign(f1),'edgecolor','none')
colormap(colMap)

m = 5;
rectangle('Position',[-m,-m,2*m,2*m],'EdgeColor','g')
rectangle('Position',[-(m+1),-(m+1),2*(m+1),2*(m+1)],'EdgeColor','r')
rectangle('Position',[-(m-1),-(m-1),2*(m-1),2*(m-1)],'EdgeColor','m')


k = 5;
for i=2:k

%     x2 = x(abs(x)<=m);
%     n2 = numel(x2);
    C = and(abs(X)<=m,abs(Y)<=m);
%     s = size;
%     dW2 = dW.*(1-C);
    dW2 = dW.*(1-C) + normrnd(0,1/sqrt(N),N,N).*C;
%     dW2(C==1) = normrnd(0,1/sqrt(N),s);
    f = conv2(dW2,q1,'same');
    figure(i)
    clf
    hold on

    contourf(X,Y,sign(f),'edgecolor','none')
    colormap(colMap)
    
    rectangle('Position',[-m,-m,2*m,2*m],'EdgeColor','g')
    rectangle('Position',[-(m+1),-(m+1),2*(m+1),2*(m+1)],'EdgeColor','r')
    rectangle('Position',[-(m-1),-(m-1),2*(m-1),2*(m-1)],'EdgeColor','m')
end
