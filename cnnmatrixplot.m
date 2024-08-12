resultmatrix=zeros(10,10);
for i=1:21570
    resultmatrix(cnnresults(i,1)+1,cnnresults(i,2)+1)=resultmatrix(cnnresults(i,1)+1,cnnresults(i,2)+1)+1;
end
heatmap(resultmatrix);
meanerrorlowlabel=0;
meanerrormidlelabel=0;
meanerrorhighlabel=0;
meanclustererror=0;
clusterlabels=[0.0426089264560410,0.159290145451317,0.256358018564582,0.354046078574119,0.446453408352163,0.548734053117399,0.653027994693492,0.750181299299653,0.846895629664104,0.916540489356444];
meanerrormatrix=zeros(4,21570);
for i=1:21570
    meanerrorlowlabel=meanerrorlowlabel+abs(cnntestnumbers(i,1)-cnnresults(i,2)*0.1);
    meanerrormidlelabel=meanerrormidlelabel+abs(cnntestnumbers(i,1)-(cnnresults(i,2)+0.5)*0.1);
    meanerrorhighlabel=meanerrorhighlabel+abs(cnntestnumbers(i,1)-(cnnresults(i,2)+1)*0.1);
    meanclustererror=meanclustererror+abs(floor(10000*cnntestnumbers(i,1))/10000-clusterlabels(cnnresults(i,2)+1));
    meanerrormatrix(1,i)=meanerrorlowlabel/i;
    meanerrormatrix(2,i)=meanerrormidlelabel/i;
    meanerrormatrix(3,i)=meanerrorhighlabel/i;
    meanerrormatrix(4,i)=meanclustererror/i;
end
plot(meanerrormatrix(4,:)')