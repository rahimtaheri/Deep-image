function l=labletomatrix(malwarelable,malwareimage,trainmatrix,minmax)
n=malwarelable;
s=size(malwareimage);
m=zeros(43,s(1)*s(2));
    for i=1:43
    n=n*2;
     if n>=1
        b=1;
        n=n-1;
     else
        b=0;
     end
         for j=1:s(1)
           for k=1:s(2)
               if minmax==1
                 m(i,(j-1)*s(2)+k)=max(b-malwareimage(j,k),trainmatrix(i,(j-1)*s(2)+k));
               else
                  m(i,(j-1)*s(2)+k)=min(b-malwareimage(j,k),trainmatrix(i,(j-1)*s(2)+k)); 
               end
           end
         end
    end
    l=m;
end