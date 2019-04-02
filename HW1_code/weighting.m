function ret=weighting(Zmax,Zmin)
    threshold=(1/2)*(Zmax+Zmin);
    w=zeros(256,1);
    for i=1:256
        if(i>threshold)
            w(i)=Zmax-i;
        else
            w(i)=i-Zmin;
        end
    end
    ret=w;
end