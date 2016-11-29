function [ind_TM, ind_TN, TM, TN] = updProcess(px, cx, ind_TM, vec_TM, ind_TN, vec_TN)
% UPDPROCESS: One iteration.
%   updProcess needs 6 input parameters, binary plain image 'px', binary cipher 
%   image 'cx', indexes of subvector TM 'ind_TM', subvector 'TM', indexes of 
%   sub-vector TN and sub-vector 'TN'. This function will update TM , TN and
%   their indexes with a pair of known image px and cx.
% 
%   Example:
%       [TM_SET, TN_SET, indTM_SET, indTN_SET] = updProcess(px, cx, ind_TM, ...
%           TM, ind_TN, TN);

%   Copyright 2016

[nindTM, nTM] = subVecCmp(px', cx', ind_TN, vec_TN);
[nindTN, nTN] = subVecCmp(px, cx, ind_TM, vec_TM);
ind_TM        = updateVec(ind_TM, nindTM);
ind_TN        = updateVec(ind_TN, nindTN);
TM            = updateVec(vec_TM, nTM);
TN            = updateVec(vec_TN, nTN);
end