function [vec] = updateVec(updVec, newVec)
%UPDATECEV: Updates vector.
%   updateVec(updVec, newVec) returns an vector which updated form a new vector.

%   Copyright 2016

len = length(updVec);
for i = 1:len
    if updVec(i) == -1 && newVec(i) ~= -1
        updVec(i) = newVec(i);
    end
end
vec = updVec;
end