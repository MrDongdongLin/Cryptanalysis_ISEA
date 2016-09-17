% for i=1:512
%     for j=1:512
%         b1(i,j) = bitget(P(i,j),1);
%         b2(i,j) = bitget(P(i,j),2);
%         b3(i,j) = bitget(P(i,j),3);
%         b4(i,j) = bitget(P(i,j),4);
%         b5(i,j) = bitget(P(i,j),5);
%         b6(i,j) = bitget(P(i,j),6);
%         b7(i,j) = bitget(P(i,j),7);
%         b8(i,j) = bitget(P(i,j),8);
%     end
% end

for start = 1:4096-512
    origin = double(P);
    cutpic = double(image(1:512,start:start+511));
    count(start) = ssim_index(origin,cutpic);
%     count(start) = length(find(origin-cutpic)==0);
end