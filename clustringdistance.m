clear all;
clc;
numberofclusters=10;
resultmatrix=zeros(numberofclusters,numberofclusters);
monitoringtime=60;
numberoffeatures=482;
clustermatrix=zeros(numberoffeatures,monitoringtime*numberofclusters);
clusterslabel=zeros(1,numberofclusters);
clusterssize=zeros(1,numberofclusters);
load('dataset.mat');
load('vectordataset.mat');
for k=1:length(trainmatrix)
     s2=sampleextractor(vectordataset,trainmatrix(1,k));
     samplelength2=size(s2);
     c=floor(numberofclusters*s2(1))+1;
     if c>numberofclusters
         c=c-1;
     end
    for i=1:floor(samplelength2/2)-1
      if (s2(2*i) < numberoffeatures) && (s2(2*i+1)<monitoringtime)
          clustermatrix(s2(2*i)+1,(c-1)*monitoringtime+s2(2*i+1)+1)=1;
      end
    end
     clusterslabel(1,c)=clusterslabel(1,c)+s2(1);
     clusterssize(1,c)=clusterssize(1,c)+1;
end
for k=1:numberofclusters
    clusterslabel(1,k)=clusterslabel(1,k)/clusterssize(1,k);
end
meanerror=0;
meanerrormatrix=zeros(1,1);
for j=1:length(testmatrix)
    mostsimilarity=0;
    similarsamplelabel=0;
    s1=sampleextractor(vectordataset,testmatrix(1,j));
    s1p=zeros(numberoffeatures,monitoringtime);
    samplelength1=size(s1);
    for i=1:floor(samplelength1/2)-1
      if (s1(2*i) < numberoffeatures) && (s1(2*i+1)<monitoringtime)
          s1p(s1(2*i)+1,s1(2*i+1)+1)=1;
      end
    end 
    for k=1:numberofclusters
           similarity=0;
     for k1=1:numberoffeatures
         for k2=1:monitoringtime
            if (s1p(k1,k2)==clustermatrix(k1,(k-1)*monitoringtime+k2))
                similarity=similarity+1;
            end
         end
     end
      if similarity > mostsimilarity
        mostsimilarity=similarity;
        similarsamplelabel=k;
      end
    end
%     disp(j);
     meanerror=meanerror+abs(s1(1)-clusterslabel(1,similarsamplelabel));
     meanerrormatrix(1,j)=meanerror/j;
     r1=floor(numberofclusters*s1(1)+1);
     if r1>numberofclusters
         r1=r1-1;
     end
     resultmatrix(r1,similarsamplelabel)=resultmatrix(r1,similarsamplelabel)+1;
end

