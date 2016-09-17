% Description:  function "uniqueInd" returns indexes of unique elements of
%               vector 'vec'.
% Input:        vec  = [1, 2, 3, 4, 5, 5, 4, 3, 2, 66]
% Format:       [ind1,ind2] = soleInd(vec);
% Output:       ind1 = [1,66]
%               ind2 = [1,-1,-1,-1,-1,-1,-1,-1,-1, 66]
function [ind1, ind2] = uniqueInd(vec)
len = length(vec);
mark = zeros(1,len)-1;
for i = 1:len
    for j = 1:len
        if vec(i) == vec(j) && i~=j  % if i and j are the same elements, mark both of them
            mark(1,i) = 0;
            mark(1,j) = 0;
        end
    end
end
% set repeatly elements' indexes = -1
for i = 1:len
    if mark(i)==0 
        vec(i) = -1;
    end
end
ind2 = vec;
vec(vec==-1) = [];  % delete repeatly elements
ind1 = vec;
end