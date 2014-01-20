clear all;
clc 
vid=videoinput('winvideo',1,'YUY2_640x480');
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
while(1)
    image = getsnapshot(vid); % storing image in an array variable
    flushdata(vid); %Flushing the buffer
    rgb_image=ycbcr2rgb(image);
    rbar=0;
    cbar=0;
    e=0;
    fR=rgb_image(:,:,1);fG=rgb_image(:,:,2);fB=rgb_image(:,:,3);% Storing RGB components of the image in seperate arrays
    %this willbe different for different objectr
    I=fB>=0&fB<30&fR>=0&fR<10&fG>=0&fG<5; % this value is given on the basis of your object 
    se=strel('disk',23);
    B=imopen(I,se);
    final=imclose(B,se);
    [L,n]=bwlabel(final);
    imshow(L);
    for k=1:n
        [r,c]=find(L==k);
        rbar=mean(r);
        cbar=mean(c);
        e=(((cbar>=x1)*2*2*2) + ((cbar<=x2)*2*2) + ((rbar>=y1)*2) + (rbar<=y2)); % Converting to decimal number
    end
    % Decision Making Conditions
    switch (e)
        case 5
            disp('Move left');
        
        case 6
            disp('Move left');

        case 7
            disp('Move left');

        case 9
            disp('Move right');

        case 10
            disp('Move right');

        case 11
            disp('Move right');

        case 13
            disp('Move forward');

        case 14
            disp('Move back');

        otherwise
            disp('Stop Moving');

    end
end
