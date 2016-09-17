% Description:    Function buildMap compares two vectors of the number of
%                 1's elements in plain image and cipher image, and build
%                 a map from pImg to cImg.
% Input:          p_vec = [1,  -1, 3,  7,  6,  14]
%                 c_vec = [3,  1,  -1, 6,  7,  14]
% Format:         c_ind = buildMap(p_vec, c_vec);
% Output:         c_ind = [2, -1, 1, 5, 4, 6]
%                 It means map: p_vec = c_vec[c_ind]
function [c_ind] = buildMap(p_vec, c_vec)
len = length(p_vec);
c_ind = zeros(1,len)-1;
for i = 1:len
    for j = 1:len
        % if find j in cipher image equals to i in plain image
        if p_vec(i) == c_vec(j) && p_vec(i) ~= -1
%             p_ind(1,i) = i;
            c_ind(1,i) = j;
        end
    end
end
end