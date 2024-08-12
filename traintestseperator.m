clear all;
clc;
load('vectordataset.mat');
l=length(vectordataset);
beginpoint=1;
beginpointmatrix=zeros(1,1);
trainmatrix=zeros(1,1);
testmatrix=zeros(1,1);
trainsize=0;
testsize=0;
totalsize=0;
while beginpoint < l
totalsize=totalsize+1;
beginpointmatrix(1,totalsize)=beginpoint;
s=sampleextractor(vectordataset,beginpoint);
samplelength=length(s);
beginpoint=beginpoint+samplelength+1;
end
while testsize <= 0.2*totalsize
    r=1+floor((totalsize*rand(1)));
    if (r >totalsize)
        r=r-1;
    end
    if beginpointmatrix(1,r)~=0
        testsize=testsize+1;
        testmatrix(1,testsize)=beginpointmatrix(1,r);
        beginpointmatrix(1,r)=0;
    end
end
for i=1:totalsize
    if beginpointmatrix(1,i)~=0
        trainsize=trainsize+1;
        trainmatrix(1,trainsize)=beginpointmatrix(1,i);
        beginpointmatrix(1,i)=0;
    end
end
