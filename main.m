clear all;
clc;
warning('OFF');

%gets the co-ordinates of the coins in 3D plane
%although it is drawn in 2D here
[y,f] = getCoor();

%gets the number of coins
s = size(y);
s = s(1);

%resolution and other constants
xRes = 1920;
yRes = 1080;
XC = 610;
YC = 950;
r = 100; %radius
im = getCircle2(2000,2000,xRes,yRes,r);
inf = 1;
for i=1:s
    %creating a circle
    %mixing it with the image
    z = getCircle2(y(i,1),y(i,2),xRes,yRes,r);
    if f(inf) == i
        im = dimIt(im,0.6);
        inf = inf+1;
    end
    im = xBS(z,im,0,0);
    y1 = y(1:i,:); %gets the part of co-orditante that are used
    s1 = size(y1);
    s1 = s1(1);
    y1 = [sum(y1(:,1)) sum(y1(:,2)) sum(y1(:,3))]/s1;
    %getting the centre of mass
    z = getCircle2(y1(1),y1(2),xRes,yRes,10);
    z = xBS(z,im,0,0.1);
    imshow(z);
    %str = [num2str(i) '.png'];
    %imwrite(z,str,'png');
    pause(0.2);
end

%Written By
%Mohammad Tariqul Islam
%ponir.bd @ hotmail.com
