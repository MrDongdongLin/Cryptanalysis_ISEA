function [image]=CorrAttack(imagename)
    %% 输入处理
    if ~exist('imagename','var')
        [fname,dire]=uigetfile('*.bmp;*.jpg','select the image :)');
        imagename=[dire,fname];
        clear dire fname
    end
    image=imread(imagename);
    [~,~,idepth]=size(image);
    if (idepth~=1)
        image=rgb2gray(image);
    end
    image=double(image);
    %% 横向处理
    imr=RawCorrResort(image);
    imc=RawCorrResort(imr');
    image=imc';
    image=255*uint8(image);
    imshow(image);
     %% 输出处理
    [f,p]=uiputfile({'*.bmp'},'保存文件');
    str=strcat(p,f);
    imwrite(image,str,'bmp');
end

function [imt]=RawCorrResort(ims)
    [height,~]=size(ims);
    %% 计算相关
    cor=zeros(height,height)-1;
    for i=1:height
        for j=i+1:height
            a=ims(i,:); b=ims(j,:);
            cor(i,j)=sum(a.*b)/sqrt(sum(a.*a)+1e-10)/sqrt(sum(b.*b+1e-10));
        end
    end
    %% 最大相关边链接
    mark=zeros(height,4); color=1;
    for i=1:height-1
        while 1
%             maxn = iterCor(i,1,height);
            maxcor=max(max(cor));
%             maxcor=cor(i,maxn);
            s=find(cor==maxcor,1);
            cor(s)=-1;
            x=floor((s-1)/height)+1; y=mod(s-1,height)+1;
            if mark(y,4)==0 || mark(x,4)==0 || mark(y,4)~=mark(x,4)
                break;
            end
        end
        if i==479
            s=1;
        end
        if mark(y,1)==0
            mark(y,4)=color;
            color=color+1;
        end
        if mark(x,1)==0
            mark(x,4)=color;
            color=color+1;
        end
        mark(mark(:,4)==mark(y,4),4)=mark(x,4);
        mark(y,1)=mark(y,1)+1;
        mark(x,1)=mark(x,1)+1;
        mark(y,mark(y,1)+1)=x;
        mark(x,mark(x,1)+1)=y;
        if mark(y,1)==2
            cor(:,y)=-1; cor(y,:)=-1;
        end
        if mark(x,1)==2
            cor(:,x)=-1; cor(x,:)=-1;
        end
    end
    s=find(mark(:,1)==1,1);
    link=zeros(height,1);
    link(1)=s; link(2)=mark(s,2);
    for i=3:height
        a=link(i-1);
        if mark(a,2)==link(i-2)
            link(i)=mark(a,3);
        else
            link(i)=mark(a,2);
        end
    end
    imt=ims(link,:);
end
