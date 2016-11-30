function [ind_TM, ind_TN, TM_SET, TN_SET, indTM_SET, indTN_SET] = KPA_ISEA(~)
%KPA_ISEA: KPA_ISEA reveals cipher image with equivalent secret keys TM and TN.
%   [~, ~, SET_TM, SET_TN] = KPA_ISEA() - Get TM and TN of all iteration rounds.
%   KPA_ISEA() - Get decrypt image.
%   
%   KPA_ISEA gets approximate TM and TN, and uses them to reveal a group of
%   cipher images that encrypeted with the same screct keys. Concrete approaches are
%   described as follows.
%   
%   Step 1: Read a pair of known images.
%   Step 2: Get binary value version of plain image and cipher image.
%   Step 3: Reveal TM and TN, these two processes are similar:
%       a) Get the number of elements 1's in each row vector of plain image and 
%         cipher image respectively;
%       b) Get unique number in vectors of elements 1's from Step 3-a);
%       c) Reveal approximate TM or TN with comparing the unique number of elements
%         1's in plain image and cipher image.
%         
%   Example:
%       [~, ~, SET_TM, SET_TN] = KPA_ISEA();
%       KPA_ISEA();
%       
%   Output:       
%       Approximate TM and TN.
  
%   Copyright 2016

[fname,dire]=uigetfile('*.bmp;*.jpg','select the cipher image :)');
imagepath=[dire,fname];
clear dire fname;
cprImg = imread(imagepath);
msgbox('Please wait...','Running program...');
%% To get binary images of plain image and cipher image respectively:
[fname,dire]=uigetfile('*.bmp','Choose the first plain image:');
imagepath=[dire,fname];
clear dire fname;
pImg = imread(imagepath);
[fname,dire]=uigetfile('*.bmp','Choose the first cipher image:');
imagepath=[dire,fname];
clear dire fname;
cImg = imread(imagepath);
px = Tobinary(pImg);
cx = Tobinary(cImg);
%% Process of revealing TM:
vp = onesRow(px);
vc = onesRow(cx);
[~,uniquevp] = uniqueInd(vp);
[~,uniquevc] = uniqueInd(vc);
TM = buildMap(uniquevp, uniquevc);
ind_TM = getVecInd(TM);
%% Process of revealing TN:
vp1 = onesRow(px');
vc1 = onesRow(cx');
[~,uniquevp1] = uniqueInd(vp1);
[~,uniquevc1] = uniqueInd(vc1);
TN = buildMap(uniquevp1, uniquevc1);
ind_TN = getVecInd(TN);
%% Process of updating TM and TN:
[TM_SET, TN_SET, indTM_SET, indTN_SET] = iteration(px, cx, ind_TM, TM, ind_TN, TN);
aImg = Todecimal(kpa(Tobinary(cprImg), TM_SET{1,end}, TN_SET{1,end}));
imshow(aImg);
% To iterate one time, do the following command:
% [ind_TM, ind_TN, TM, TN] = updProcess(px, cx, ind_TM, TM, ind_TN, TN);
end