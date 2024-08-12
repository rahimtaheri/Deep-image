clear all;
clc;
maliciouslevels=10;
resultmatrix=zeros(maliciouslevels,maliciouslevels);
monitoringtime=60;
numberoffeatures=482;
load('dataset.mat');
load('vectordataset.mat')
meanerror=0;
meanerrormatrix=zeros(1,1);
for j=1:length(testmatrix)
    mostsimilarity=0;
    similarsamplelabel=0;
    s1=sampleextractor(vectordataset,testmatrix(1,j));
    for k=1:length(trainmatrix)
     s2=sampleextractor(vectordataset,trainmatrix(1,k));
     similarity=imagedistance(s1,s2,numberoffeatures,monitoringtime);
      if similarity > mostsimilarity
        mostsimilarity=similarity;
        similarsamplelabel=s2(1);
      end
    end
     meanerror=meanerror+abs(s1(1)-s2(1));
     meanerrormatrix(1,j)=meanerror/j;
     r1=floor(maliciouslevels*s1(1)+1);
     r2=floor(maliciouslevels*similarsamplelabel+1);
     if r1>maliciouslevels
         r1=r1-1;
     end
     if r2>maliciouslevels
         r2=r2-1;
     end
     resultmatrix(r1,r2)=resultmatrix(r1,r2)+1;
end

