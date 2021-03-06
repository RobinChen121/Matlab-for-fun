function [x,minf]=minSimpSearch(f,X,alpha,sita,gama,beta,var,eps) %单纯形法
 %X 初始单纯形
 %alpha：反映系数
 %site：紧缩系数
 %gama:扩展系数
 %beta：收缩系数
 %var:自变量向量
 %eps:精度
 %x:目标函数取最小值时的自变量值
 %minf:目标函数的最小值
 format long;
 if nargin==7
     eps=1.0e-6;
 end
 
 N=size(X);
 n=N(2);
 FX=zeros(1,n);
 j=1;
 
 while 1
     for i=1:n
         FX(i)=Funval(f,var,X(:,i));
     end
     [XS,IX]=sort(FX);%将单纯形的顶点按目标函数值的大小重新编号，IX为数值排列的顺序索引
     Xsorted=X(:,IX);%排序后的编号
     
     px=sum(Xsorted(:,1:(n-1)),2)/(n-1);%单纯形的中心
     Fpx=Funval(f,var,px);
     SumF=0;
     for i=1:n
         SumF=SumF+(FX(IX(i))-Fpx)^2;
     end
     SumF=sqrt(SumF/n)
     if SumF<=eps
         x=Xsorted(:,1);
         break;
     else
         x2=px+alpha*(px-Xsorted(:,n));%将中心点向单纯形外反射
         fx2=Funval(f,var,x2);
         if fx2<XS(1)
             x3=px+gama*(x2-px);
             fx3=Funval(f,var,x3);
             if fx3<XS(1)
                 Xsorted(:,n)=x3;
                 X=Xsorted;
                 continue;
             else
                 Xsorted(:,n)=x2;
                 X=Xsorted;
                 continue;
             end
         else
             if fx2<XS(n-1)
                 Xsorted(:,n)=x2;
                 X=Xsorted;
                 continue;
             else
                 if fx2<XS(n)
                     Xsorted(:,n)=x2;
                 end
                 x4=px+beta*(Xsorted(:,n)-px);
                 fx4=Funval(f,var,x4);
                 FNnew=Funval(f,var,Xsorted(:,n));
                 if fx4<FNnew
                     Xsorted(:,n)=x4;
                     X=Xsorted;
                     continue;
                 else
                     x0=Xsorted(:,1);
                     for i=1:n
                         Xsorted(:,j)=x0+sita*(Xsorted(:,j)-x0);
                     end
                 end
             end
         end
     end
     X=Xsorted;
     TG(j)=Funval(f,var,Xsorted(:,1))
     j=j+1;
 end
 minf=Funval(f,var,x);
 format short;
 
