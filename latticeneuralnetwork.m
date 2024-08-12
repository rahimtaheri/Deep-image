clear all;
clc;
monitoringtime=60;
numberoffeatures=482;
load('vectordataset.mat');
l=length(vectordataset);
beginpoint=1;
trainmatrix=zeros(numberoffeatures,monitoringtime);
while beginpoint < l
s=sampleextractor(vectordataset,beginpoint);
samplelength=length(s);
sampletoimage=zeros(numberoffeatures,monitoringtime);
for i=1:floor(samplelength/2)-1
    if (s(2*i) < numberoffeatures) && (s(2*i+1)<monitoringtime)
    sampletoimage(s(2*i)+1,s(2*i+1)+1)=1;
    end
end
t=s(1)-sampletoimage;
    for j=1:numberoffeatures
        for k=1:monitoringtime
            trainmatrix(j,k)=max(trainmatrix(j,k),t(j,k));
        end
    end
beginpoint=beginpoint+samplelength+1;
end

