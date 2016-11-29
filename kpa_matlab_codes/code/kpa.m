function [aImg] = kpa(cImg, TM, TN)
%KPA: Recover image from cipher image and two equivalent keys TM and TN.
% kpa(cImg, TM, TN) returns an image gets from applying known plain image 
% attack on cImg, both cImg and aImg are binary images.
% 
% Example:
%    aImg = kpa(cImg, TM, TN);
% 
% Output:   
%    Decrypt image 'aImg'.

%   Copyright 2016

[height,width] = size(cImg);
aImg = zeros(height,width);
for i = 1:height
    if TM(i) == -1
        TM(i) = i;
    end
end
for i = 1:width
    if TN(i) == -1
        TN(i) = i;
    end
end
for i = 1:height
    for j = 1:width
        aImg(i,j) = cImg(TM(i),TN(j));
    end
end
end