% Description:  function onesRow returns to the number of 1's element of each row.
% Input:        exImg = [0,1,1,0;
%                        1,0,0,1;
%                        1,1,1,0]
% Format:       vec1 = onesRow(exImg);
%               vec2 = onesRow(exImg');
% Output:       vec1 = [2,2,3]
%               vec2 = [2,2,2,1]
function [vec] = onesRow(exImg)
[height,~] = size(exImg);
vec = zeros(1,height);
for i = 1:height
    vec(1,i) = length(find(exImg(i,:)==1));
end
end