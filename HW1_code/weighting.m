function w=weighting()
Zmax=256;
Zmin=0;
threshold=0.5*(Zmax+Zmin);
w=zeros(256,1);
for i=1:256
    if(i>threshold)
        w(i)=Zmax-i;
    else
        w(i)=i-Zmin;
    end
end

end