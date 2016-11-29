function [ind] = getVecInd(vec)
%GETVECIND: Get the index of element that not equals to -1.
%   getVecInd(vec) returns a the index of element that not equals to -1 in an array.
% 
%   Example: 
%      vec = [-1,2,5,9,-1,5];
%      ind = getVecInd(vec);
%   
%   Output: 
%      ind = [-1,2,3,4,-1,6];

%   Copyright 2016
len = length(vec);
ind = zeros(1,len)-1;
for i = 1:len
    if vec(i) ~= -1
        ind(1,i) = i;
    end
end
end