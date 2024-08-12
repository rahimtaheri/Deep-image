clear all;
clc;
monitoringtime=60;
numberoffeatures=482;
load('vectordataset.mat');
l=length(vectordataset);
t=1;
beginpoint=1;
maxrows=0;
maxcolumns=0;
while beginpoint < l
nonzerorows=zeros(numberoffeatures,1);
nonzercolumns=zeros(monitoringtime,1);
s=sampleextractor(vectordataset,beginpoint);
samplelength=length(s);
sampletoimage=zeros(numberoffeatures,monitoringtime);
for i=1:floor(samplelength/2)-1
    if (s(2*i) < numberoffeatures) && (s(2*i+1)<monitoringtime)
    nonzerorows(s(2*i)+1,1)=1;
    nonzercolumns(s(2*i+1)+1,1)=1;
    sampletoimage(s(2*i)+1,s(2*i+1)+1)=1;
    end
end  
maxrows=max(sum(nonzerorows),maxrows);
maxcolumns=max(sum(nonzercolumns),maxcolumns);
    t=t+1;
beginpoint=beginpoint+samplelength+1;
end
t=1;
beginpoint=1;
while beginpoint < l
nonzerorows=zeros(numberoffeatures,1);
nonzercolumns=zeros(monitoringtime,1);
s=sampleextractor(vectordataset,beginpoint);
samplelength=length(s);
for i=1:floor(samplelength/2)-1
    if (s(2*i) < numberoffeatures) && (s(2*i+1)<monitoringtime)
    nonzerorows(s(2*i)+1,1)=1;
    nonzercolumns(s(2*i+1)+1,1)=1;
    sampletoimage(s(2*i)+1,s(2*i+1)+1)=1;
    end
end  
nonzerosampletoimage=zeros(maxrows,maxcolumns);
i1=1;
for i=1:numberoffeatures
    if nonzerorows(i,1)==1
    i2=1;
    for j=1:monitoringtime
        if nonzercolumns(j,1)==1
        nonzerosampletoimage(i1,i2)=sampletoimage(i,j);
        i2=i2+1;
        end
    end
    i1=i1+1;
    end
end 
    label=strcat(num2str(s(1)),'im',num2str(t),'.png');
    imwrite(nonzerosampletoimage,label);
    t=t+1
    beginpoint=beginpoint+samplelength+1;
end

