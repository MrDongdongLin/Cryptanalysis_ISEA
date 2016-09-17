% Description:  Use KPA_ISEA function to get approximate TM and TN, and then
%               use them to reveal a group of cipher images that are en-
%               crypeted with same screct keys.
% step 1:       Read one pair of known images,
% step 2:       Get binary value version of plain image and cipher image,
% step 3:       Reveal TM and TN, the two processes are similar:
%               a) To get the number vector of 1's element of the rows in pl-
%                   ain image and cipher image respectively,
%               b) To get the unique number of vectors of 1's elements from
%                   step 3-a),
%               c) To reveal approximate TM or TN with comparing the unique 
%                   number of 1's elements in plain image and cipher image.
% Input:        Decimal value plain image and cipher image, pImg & cImg
% Output:       Approximate TM and TN.
% Format:       1. To get all rounds of TM and TN:
%                   [~, ~, SET_TM, SET_TN] = KPA_ISEA();
%               3. To get decrypt result:
%                   KPA_ISEA();
function [ind_TM, ind_TN, TM_SET, TN_SET, indTM_SET, indTN_SET] = KPA_ISEA(~)
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