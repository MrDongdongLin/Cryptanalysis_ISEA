% Lenna = imread('../256/Lenna.bmp');
% Lenna_bin = Tobinary(Lenna);
% for i =1:4
%     I1 = Todecimal(kpa(Lenna_bin,TM_SET1{1,i},TN_SET1{1,i}));
%     I2 = Todecimal(kpa(Lenna_bin,TM_SET2{1,i},TN_SET2{1,i}));
%     I3 = Todecimal(kpa(Lenna_bin,TM_SET3{1,i},TN_SET3{1,i}));
%     IX1 = Tobinary(I1);
%     IX2 = Tobinary(I2);
%     IX3 = Tobinary(I3);
%     
%     dec1 = double(Lenna) - double(I1);
%     dec2 = double(Lenna) - double(I2);
%     dec3 = double(Lenna) - double(I3);
%     bin1 = double(Lenna_bin) - double(IX1);
%     bin2 = double(Lenna_bin) - double(IX2);
%     bin3 = double(Lenna_bin) - double(IX3);
%     
%     len_d1 = length(find(dec1==0));
%     len_d2 = length(find(dec2==0));
%     len_d3 = length(find(dec3==0));
%     
%     len_b1 = length(find(bin1==0));
%     len_b2 = length(find(bin2==0));
%     len_b3 = length(find(bin3==0));
%     
%     cor_dec1(1,i) = len_d1 / (256*256);
%     cor_dec2(1,i) = len_d2 / (256*256);
%     cor_dec3(1,i) = len_d3 / (256*256);
%     
%     cor_bin1(1,i) = len_b1 / (256*2048);
%     cor_bin2(1,i) = len_b2 / (256*2048);
%     cor_bin3(1,i) = len_b3 / (256*2048);
% end
% clear I1 I2 I3 IX1 IX2 IX3 dec1 dec2 dec3 bin1 bin2 bin3 len_d1 len_d2 len_d3 len_b1 len_b2 len_b3 i Lenna Lenna_bin
% 
% 
% 
% hold on;
% grid on;
% box on;
% plot(cor_dec1,'-^');
% plot(cor_dec2,'-o');
% plot(cor_dec3,'-d');
% 
% plot(cor_bin1,'--^');
% plot(cor_bin2,'--o');
% plot(cor_bin3,'--d');
% 
% x=xlabel('$$n_0$$');
% y=ylabel('$$P_c$$');
% 
% legend1 = legend('\it{Airplane}','\it{Candy}','\it{Airplane & Candy}');
% 
% set(gca,'fontsize',11);
% set(gca,'Fontname','times new Roman');
% set(legend1,'Location','SouthEast');
% set(x,'Interpreter','LaTex');
% set(y,'Interpreter','LaTex');
% set(get(gca,'xlabel'),'FontSize',14);
% set(get(gca,'ylabel'),'FontSize',14);


lenTM = 256;   lenTN = 2048;
for i = 1:8
    lenTM1(i) = length(uniqueInd(TM_SET{1,i}));
    
    lenTN1(i) = length(uniqueInd(TN_SET{1,i}));
end
clear i lenTM lenTN;

hold on;
grid on;
box on;
plot(lenTM1/256,'-o');
plot(lenTN1/2048,'-^');
% 
plot(5*ones(1,2),ylim,'r:');%画区间间隔线
plot(7*ones(1,2),ylim,'r:');%画区间间隔线

x=xlabel('$$k^*$$');
y=ylabel('$$p$$');

legend1 = legend('\it{R}','\it{C}');

set(gca,'fontsize',11);
set(gca,'Fontname','times new Roman');
set(legend1,'Location','SouthEast');
set(x,'Interpreter','LaTex');
set(y,'Interpreter','LaTex');
set(get(gca,'xlabel'),'FontSize',14);
set(get(gca,'ylabel'),'FontSize',14);
