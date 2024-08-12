function d=imagedistance(s1,s2,numberoffeatures,monitoringtime)
    samplelength1=length(s1);
    s1p=zeros(2,1);
    t1=0;
    for i=1:floor(samplelength1/2)-1
      if (s1(2*i) < numberoffeatures) && (s1(2*i+1)<monitoringtime)
          t1=t1+1;
          s1p(1,t1)=s1(2*i)+1;
          s1p(2,t1)=s1(2*i+1)+1;
      end
    end
    samplelength2=length(s2);
    s2p=zeros(2,1);
    t2=0;
    for i=1:floor(samplelength2/2)-1
      if (s2(2*i) < numberoffeatures) && (s2(2*i+1)<monitoringtime)
          t2=t2+1;
          s2p(1,t2)=s2(2*i)+1;
          s2p(2,t2)=s2(2*i+1)+1;
      end
    end
    h=zeros(2,max(max(max(s1p)),max(max(s2p))));
    for i=1:t1
        h(1,s1p(1,i))=1;
        h(2,s1p(2,i))=1;
    end
    t=numberoffeatures*monitoringtime-t1-t2;
    for i=1:t2
        if (h(1,s2p(1,i))==1)&& (h(2,s2p(2,i))==1)
            t=t+1;
        end
    end
    d=t;
end