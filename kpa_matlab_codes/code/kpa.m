% Description:    Function "kpa" returns an image gets from applying
%                 known plain image attack on cImg, both cImg and aImg are
%                 binary images.
% Input:          Cipher image 'cImg' and equivalent screct keys TM and TN.
% Output:         Decrypt image 'aImg'.
% Format:         aImg = kpa(cImg, TM, TN);
function [aImg] = kpa(cImg, TM, TN)
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