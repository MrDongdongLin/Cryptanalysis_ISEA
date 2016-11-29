function [vec] = onesRow(exImg)
%ONSROW: Elements 1's of a vector.
%   onesRow(exImg) returns the number of element 1's in each row of an image.
% 
%   Example:
%       exImg = [0,1,1,0;
%                1,0,0,1;
%                1,1,1,0];
%       vec1 = onesRow(exImg);
%       vec2 = onesRow(exImg');
%       
%   Output:
%       vec1 = [2,2,3];
%       vec2 = [2,2,2,1];

%   Copyright 2016

[height,~] = size(exImg);
vec = zeros(1,height);
for i = 1:height
    vec(1,i) = length(find(exImg(i,:)==1));
end
end