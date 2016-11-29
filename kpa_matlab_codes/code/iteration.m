function [TM_SET, TN_SET, indTM_SET, indTN_SET] = iteration(px, cx, ind_TM, TM, ind_TN, TN)
%ITERATION: Do iteration process.
%   iteration(px, cx, ind_TM, TM, ind_TN, TN) need 6 input parameters, binary
%   plain image 'px', binary cipher image 'cx', indexes of subvector TM
%   'ind_TM', subvector 'TM', indexes of subvector TN and subvector 'TN'. For
%   each round, this function updates TM , TN and their indexes with a pair
%   of known image px and cx. 
% 
%   Example:
%      [TM_SET, TN_SET, indTM_SET, indTN_SET] = iteration(px, cx, ind_TM, TM, ind_TN, TN);

%   Copyright 2016

TM_SET{1,1} = TM;  TN_SET{1,1} = TN;
indTM_SET{1,1} = ind_TM;   indTN_SET{1,1} = ind_TN;
for i = 2:100
    lastml = length(uniqueInd(TM));
    lastnl = length(uniqueInd(TN));
    if lastml == length(TM) && lastnl == length(TN)
        break;
    else
        [ind_TM, ind_TN, TM, TN] = updProcess(px, cx, ind_TM, TM, ind_TN, TN);
        TM_SET{1,i} = TM; TN_SET{1,i} = TN;
        indTM_SET{1,i} = ind_TM;   indTN_SET{1,i} = ind_TN;
        oml = length(uniqueInd(TM_SET{1,i-1}));
        nml = length(uniqueInd(TM_SET{1,i}));
        onl = length(uniqueInd(TN_SET{1,i-1}));
        nnl = length(uniqueInd(TN_SET{1,i}));
        % If subvector doesn't increase:
        if nml==oml && nnl==onl
%             % 1. If subvectors' length cannot increase anymore, break:
%             if nml==length(TM) && nnl==length(TN)
%                 break;
            % If subvectors' length still can increase with a new pair of 
            % known image:
            if nml~=length(TM) || nnl~=length(TN)
                h = msgbox('Please add another pair of known image','Tip');
                [fname,dire]=uigetfile('*.bmp','select the plain image :)');
                p_path = [dire,fname];
                clear dire fname
                px = Tobinary(imread(p_path));
            
                [fname,dire]=uigetfile('*.bmp','select the cipher image :)');
                c_path = [dire,fname];
                clear dire fname
                cx = Tobinary(imread(c_path));
                close(h);
            end
        end
    end
    
end