clear
clc
n=1;
Rylist=[];
%求贝塞尔矩阵
while n<21   
m=2*pi*0.3*n;
Ry(n)=besselj(0,m)
Rylist=[Rylist,Ry(n)];
n=n+1;
end
ci=1     
shuchu=[];%记录c
errorlist=[];%记录均方差
 while ci<21
%      duijiao=ones(1,n);
%      R=diag(duijiao);
     R=eye(ci);
     r=transpose(flip(Rylist(1:ci)));%生成列向量

     %生成矩阵
     for i=1:ci
         for j=1:ci
             if i-j==0
                R(i,j)=1;
             else
                  R(i,j)=Rylist(abs(i-j));
             end
         end
      end
        
     %求逆
     niR=inv(R);
     %输出c=R-1*r
     c=niR*r
     %shuchu=[shuchu,c];
     rr=transpose(r);
     zi=rr*niR;
     error=1-zi*r;
     errorlist=[errorlist,error];
     ci=ci+1
 end
%%
x=[1:20];
plot(x,errorlist)
title('mean-square error with respect to n')
xlabel('n')
ylabel('mean-square error')