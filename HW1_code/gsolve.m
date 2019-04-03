function [g,lE]=gsolve(lambda,N,radiance,g_plot,photo)%~¨ú¥NZ B
    [P1,Img1]=get_pic('.',1);
    temp_read1=imfinfo(Img1(1).name);
    scale=[temp_read1.Height,temp_read1.Width];
    cur_path=pwd;
    cr2=fullfile(cur_path,'cr2');
    [P,Img]=get_pic(cr2,2);
    
    P
    Img(1).name
    B=zeros(P,1);
    for i=1:P
        temp_read=imfinfo(fullfile(cr2,Img(i).name));
        temp_camera=temp_read.DigitalCamera;
        B(i,1)=log(temp_camera.ExposureTime);
    end
    
    Z_sam=show_picture(N,1);
    Zmax=255;
    Zmin=0;
    w=weighting(Zmax,Zmin);
    
    n=256;
    g=zeros(n,3);
    A=zeros(size(Z_sam,1)*size(Z_sam,2)+n+1,n+size(Z_sam,1));
    b=zeros(size(A,1),1);
    
    for color=1:3
        Z=show_picture(N,color);
        k=1;
        for i=1:size(Z,1)
            for j=1:size(Z,2)
                temp=w(Z(i,j)+1);
                %0~255=>1~256
                A(k,Z(i,j)+1)=temp;
                A(k,n+i)=-temp;
                b(k,1)=temp*B(j);
                k=k+1;
            end
        end
        A(k,127)=1;
        k=k+1;
        for i=1:n-2
           A(k,i)=lambda*w(i+1);
           A(k,i+1)=-2*lambda*w(i+1);
           A(k,i+2)=lambda*w(i+1);
           k=k+1;
        end
        x=A\b;
         g(:,color)=x(1:n);
         lE=x(n+1:size(x,1));
    end
    if(g_plot==1)
            g;
        domain=[1:256];
        range=g(domain,1);
        plot(range,domain)
        hold on
        range=g(domain,2);
        plot(range,domain)
        hold on
        range=g(domain,3);
        plot(range,domain)
    end
         
    ret1=real_image(g(:,1),1,B,w); 
    ret2=real_image(g(:,2),2,B,w);
    ret3=real_image(g(:,3),3,B,w);
    
    if(radiance==1)
        imshow(ret1,[],'Colormap',jet(256));
        colorbar 
    else
        ret1=exp(ret1);
        ret2=exp(ret2);
        ret3=exp(ret3);
        
%         ret1=ret1./(ret1+1);
%         ret2=ret2./(ret2+1);
%         ret3=ret3./(ret3+1);
        
        if(photo==1)
            ret=cat(3,ret1,ret2,ret3);
            art=photographic_toneMapping(ret);
            imshow(art);
        else if(photo==2)
            ret1=ret1./(ret1+1);
            ret2=ret2./(ret2+1);
            ret3=ret3./(ret3+1);
            ret=cat(3,ret1,ret2,ret3);
            art=my_tone_mapping(ret,0.72);
            imshow(art);
        else
            art1=tonemap(ret1);
            art2=tonemap(ret2);
            art3=tonemap(ret3);
            art=cat(3,art1,art2,art3);
            imshow(art);
            imwrite(art,'output.png');
        end     
        
    end
end

