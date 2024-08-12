function s=sampleextractor(dataset,initialpoint)
i=initialpoint;
while dataset(i)~=-1
    i=i+1;
end
s=dataset(initialpoint:i-1);
end