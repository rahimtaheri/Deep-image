resultmatrixw=zeros(10,10);
a=[0;2;9;34;50;77;4;1;0;0];
b=[569;557;986;1674;1989;2625;3565;5184;3216;704];
c=[0;0;0;0;0;0;0;4;242;80];
resultmatrixw(:,6)=a;
resultmatrixw(:,8)=b;
resultmatrixw(:,9)=c;
resultmatrix=resultmatrixw;

resultmatrixl=zeros(10,10);
a=[0;2;9;34;50;77;4;1;0;0];
b=[569;559;986+9;1674+34;1989+50;2625+77;3565+4;5184+1+4;3216+242;704+80];
resultmatrixl(:,10)=b;
resultmatrix=resultmatrixl;