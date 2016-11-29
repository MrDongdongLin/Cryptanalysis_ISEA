function [image]=Todecimal(imagename)
%TODECIMAL: Gets decimal version of an image.
%   Todecimal(imagename) returns a decimal version of a binary version image.
% 
%   Example:
%      bimage = imread('Lenna_b.bmp');
%      image=Todecimal(bimage);

%   Copyright 2016

[~,~,idepth]=size(imagename);
if (idepth~=1)
    imagename=rgb2gray(imagename);
end
image=double(imagename);
newimage=ComImage(image);
image=uint8(newimage);
end

function [imt]=ComImage(ims)
    [h,w]=size(ims);
    imt=zeros(h,h);
    for i=1:h
        for j=1:w
            x = floor((j-1)/8)+1;
            imt(i,x) = imt(i,x) + bitshift(ims(i,j),bitand(j-1,7));
        end
    end
end