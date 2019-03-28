function ret=real_image(g,color,B)
    Zmax=255;
    Zmin=0;
    %B=[-10:5];
    %B=flip(B);
    
    [P,name]=get_pic();
    RGB = imread(name(1,:));
    [m,n,q]=size(RGB);
    RGB_array=zeros(m,n,P);
    
    for index=1:P
        RGB = imread(name(index,:));
        RGB_array(:,:,index)=RGB(:,:,color);
    end
    output_hdr=zeros(m,n);
    for(i=1:m)
        for(j=1:n)
            down=0;
            up=0;
            for(k=1:P)
                down=down+weighting(Zmax,Zmin,RGB_array(i,j,k)+1);
                up=up+weighting(Zmax,Zmin,RGB_array(i,j,k)+1)*(g(RGB_array(i,j,k)+1)-B(k));
            end
            lnE=up/down;
            E=exp(lnE);
            output_hdr(i,j)=E;
        end
    end
    ret=output_hdr;
    
end