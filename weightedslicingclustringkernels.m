clear all;
clc;
numberofclusters=10;
resultmatrix=zeros(numberofclusters,numberofclusters);
monitoringtime=60;
numberoffeatures=482;
load('dataset.mat');
load('vectordataset.mat');
meanerror=0;
meanerrormatrix=zeros(1,10000);
i=9828;
    meanerror=0;
for j=1:length(testmatrix)
    s1=sampleextractor(vectordataset,testmatrix(1,j));
     meanerror=meanerror+abs(s1(1)-i/10000);
end
     meanerrormatrix(1,i)=meanerror/length(testmatrix);
plot(meanerrormatrix)





