% Description:    Function getVecInd returns a vector's indexes that its 
%                 element are not -1.
% Input:          vec = [-1,2,5,9,-1,5]
% Output:         ind = [-1,2,3,4,-1,6]
% Format:         ind = getVecInd(vec);
function [ind] = getVecInd(vec)
len = length(vec);
ind = zeros(1,len)-1;
for i = 1:len
    if vec(i) ~= -1
        ind(1,i) = i;
    end
end
end