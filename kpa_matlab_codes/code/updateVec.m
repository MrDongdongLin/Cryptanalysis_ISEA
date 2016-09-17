% Description:    Function "updateVec" returns an vector which updated with
%                 a new vector.
% Input:          An vector that waitting for updating, and a vector used
%                 for updating.
% Output:         Updated vector.
function [vec] = updateVec(updVec, newVec)
len = length(updVec);
for i = 1:len
    if updVec(i) == -1 && newVec(i) ~= -1
        updVec(i) = newVec(i);
    end
end
vec = updVec;
end