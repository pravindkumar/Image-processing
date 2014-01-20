clear all;
clc 
vid=videoinput('winvideo',1,'YUY2_640x480');
set(vid,'FramesPerTrigger',1); % Setting frames per trigger
preview(vid);
im_rgb = getsnapshot(vid); % Storing Image in an array variable
[a b c]= size(im_rgb); % Determining the size of the captured frame.
y=a;
x=b;
% Defining Boundaries
x1=x/2-120;
x2=x/2+120;
y1=y/2-30;
y2=y/2+30;
import java.awt.Robot;
import java.awt.event.*;
mouse = Robot;
while(1)
image = getsnapshot(vid); % storing image in an array variable
flushdata(vid); %Flushing the buffer
rgb_image=ycbcr2rgb(image);
rbar=0;
cbar=0;
e=0;
fR=rgb_image(:,:,1);fG=rgb_image(:,:,2);fB=rgb_image(:,:,3);
% I=((fR<=30) & (fG<=30) & (fB>=30)); % Converting the RGB Image into binary image///Detecting only the red component
I=fR>200;
se=strel('disk',5);
B=imopen(I,se);
final=imclose(B,se);
[L,n]=bwlabel(final);
imshow(L);
for k=1:n
[r,c]=find(L==k);
rbar=mean(r);
cbar=mean(c);
end
mouse.mouseMove(cbar*2,rbar*1.666667);
end
