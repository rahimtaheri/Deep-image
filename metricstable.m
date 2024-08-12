l=10;
tablematrix=zeros(l+2,5);
r1234=sum(sum(resultmatrix));
r7=0;
r5=0;
    r6=0;
for i=1:l
    r1=resultmatrix(i,i);
    r2=0;
    r3=0;
    r4=0;
    r7=r7+(resultmatrix(i,i)/r1234);
    for c=1:l
          if c~= i
            r2=r2+resultmatrix(i,c);
            r3=r3+resultmatrix(c,i);
          end
    end
    for r=1:l
           if (r>i)
            r5=r5+resultmatrix(i,r);
           end 
           if (r<i)
            r6=r6+resultmatrix(i,r);
           end 
        for c=1:l
           if (c~= i)&&(r~=i)
            r4=r4+resultmatrix(r,c);
           end
        end
    end
    tablematrix(i,1)=((r1+r4)/(r1+r2+r3+r4));
       tablematrix(i,2)=1-tablematrix(i,1);
       tablematrix(i,3)=((r1)/(r1+r3));
       tablematrix(i,4)=((r1)/(r1+r4));
       tablematrix(i,5)=((2*r1)/(2*r1+r3+r4));
       tablematrix(11,1)=r5/r6;
end
tablematrix(12,1)=r7;