function ret=weighting(Zmax,Zmin,input)
    threshold=(1/2)*(Zmax+Zmin);
    if(input>threshold)
        ret=Zmax-input;
    else
        ret=input-Zmin;
    end
end