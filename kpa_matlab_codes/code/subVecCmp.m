% Description:    Function "subVecCmp" returns a map from 'pImg' to 'cImg'.
% Input:          Binary plain image 'pImg' and cipher image 'cImg', and a 
%                 recovered mapping vector that indicates the relationship be-
%                 tween pImg to cImg and it's indexes which gets from func-
%                 tion "buildMpa".
% Output:         Two new map vector indicates the relationship between
%                 pImg and cImg. Means: pImg(np_ind) = cImg(nc_ind).
function [np_ind, nc_ind, mark] = subVecCmp(pImg, cImg, p_ind, c_ind)
[subVec1,~] = uniqueInd(p_ind);
[subVec2,~] = uniqueInd(c_ind);
len = length(subVec1);
[~,width] = size(pImg);
np_ind = zeros(1,width)-1;
nc_ind = zeros(1,width)-1;
mark{1,width} = [];
for i = 1:width
    sub_col_p = double(pImg(subVec1,i));
    for j = 1:width
        sub_col_c = double(cImg(subVec2,j));
        diff = sub_col_p - sub_col_c;
        if length(find(diff==0)) == len
            mark{1,i} = [mark{1,i},j];
        end
    end
    % if the element is unique
    if length(mark{1,i}) == 1
        np_ind(1,i) = i;
        nc_ind(1,i) = mark{1,i};
    end
end
end