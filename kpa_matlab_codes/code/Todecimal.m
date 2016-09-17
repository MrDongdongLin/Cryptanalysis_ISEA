% Description:    Function "Todecimal" returns a decimal version of binary
%                 image.
% Input:          A binary image.
% Output:         A decimal image.
function [image]=Todecimal(imagename)
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