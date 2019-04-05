function HDR=real_image2(g,Img,B,w)
HDR=zeros(size(Img,1),size(Img,2));
for i=1:size(Img,1)
    for j=1:size(Img,2)
        down=0;
        up=0;
        for k=1:size(Img,4)
            down=down+w(Img(i,j,1,k)+1);
            up=up+w(Img(i,j,1,k)+1)*(g(Img(i,j,1,k)+1)-B(k));
        end
        lnE=up/down;
        E=exp(lnE);
        HDR(i,j)=E;
    end
end
end