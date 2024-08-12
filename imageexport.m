clear all;
clc;
monitoringtime=60;
numberoffeatures=482;
load('vectordataset.mat');
l=length(vectordataset);
t=1;
beginpoint=1;
while beginpoint < l
s=sampleextractor(vectordataset,beginpoint);
samplelength=length(s);
sampletoimage=zeros(numberoffeatures,monitoringtime);
for i=1:floor(samplelength/2)-1
    if (s(2*i) < numberoffeatures) && (s(2*i+1)<monitoringtime)
    sampletoimage(s(2*i)+1,s(2*i+1)+1)=1;
    end
end  
    label=strcat(num2str(s(1)),'im',num2str(t),'.png');
    imwrite(sampletoimage,label);
    t=t+1;
beginpoint=beginpoint+samplelength+1;
end

