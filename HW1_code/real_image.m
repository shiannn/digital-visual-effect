function ret=real_image(g,color,B,w)
    [P,Img]=get_pic('.',1);
    RGB = imread(Img(1).name);
    [m,n,q]=size(RGB);
    RGB_array=zeros(m,n,q,P,'uint8');
    
    for index=1:P
        RGB = imread(Img(index).name);
        RGB_array(:,:,:,index)=RGB(:,:,:);
    end
    
    output_hdr=zeros(m,n);
    for(i=1:m)
        for(j=1:n)
            down=0;
            up=0;
            for(k=1:P)
                down=down+w(RGB_array(i,j,color,k)+1);
                up=up+w(RGB_array(i,j,color,k)+1)*(g(RGB_array(i,j,color,k)+1)-B(k));
            end
            lnE=up/down;
            output_hdr(i,j)=lnE;
        end
    end
    ret=output_hdr;
end