function ret=real_image(g)
    Zmax=255;
    Zmin=0;
    B=[-10:5];
    B=flip(B);
    
    P=16;
    RGB = imread('memorial0061.png');
    [m,n,q]=size(RGB);
    RGB_array=zeros(m,n,3,P);
    
    for index=61:76
        str=int2str(index);
        name=['memorial00',str,'.png'];
        RGB = imread(name);
        %image(RGB);
        RGB_array(:,:,1,index-60)=RGB(:,:,1);
        RGB_array(:,:,2,index-60)=RGB(:,:,2);
        RGB_array(:,:,3,index-60)=RGB(:,:,3);
    end
    output_hdr=zeros(m,n,3);
    for(i=1:m)
        for(j=1:n)
            down=0;
            up=0;
            for(k=1:P)
                down=down+weighting(Zmax,Zmin,RGB_array(i,j,1,k)+1);
                up=up+weighting(Zmax,Zmin,RGB_array(i,j,1,k)+1)*(g(RGB_array(i,j,1,k)+1)-B(k));
            end
            lnE=up/down;
            E=exp(lnE);
            output_hdr(i,j,1)=E;
            
            
            
            down=0;
            up=0;
            for(k=1:P)
                down=down+weighting(Zmax,Zmin,RGB_array(i,j,2,k)+1);
                up=up+weighting(Zmax,Zmin,RGB_array(i,j,2,k)+1)*(g(RGB_array(i,j,2,k)+1)-B(k));
            end
            lnE=up/down;
            E=exp(lnE);
            output_hdr(i,j,2)=E;
            
            down=0;
            up=0;
            for(k=1:P)
                down=down+weighting(Zmax,Zmin,RGB_array(i,j,3,k)+1);
                up=up+weighting(Zmax,Zmin,RGB_array(i,j,3,k)+1)*(g(RGB_array(i,j,3,k)+1)-B(k));
            end
            lnE=up/down;
            E=exp(lnE);
            output_hdr(i,j,3)=E;
        end
    end
    ret=output_hdr;
    
end