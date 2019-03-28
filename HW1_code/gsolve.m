function [g,lE]=gsolve(~,~,lambda,N,scale)%~取代Z B
    Z=show_picture(N);
    size(Z);
    %Z(i,j,k) 第i個選點 在第j張照片 第k種顏色
    %B=flip([-10:5]);
    %B=flip([-4:8]);
    %B=[1:5];
    B=[-7:5];
    
    %Z是N*P矩陣 每張照片N個pixel的0~255 P張照片
    %RGB 3個顏色都有0~255
    %B曝光時間取對數
    %得到g之後輸出影像
    Zmax=255;
    Zmin=0;
    n=256;
    g=zeros(n,3);
    A=zeros(size(Z,1)*size(Z,2)+n+1,n+size(Z,1));
    b=zeros(size(A,1),1);
    
    for color=1:3
        k=1;
        for i=1:size(Z,1)
            for j=1:size(Z,2)
                temp=weighting(Zmax,Zmin,Z(i,j,color)+1);
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
           A(k,i)=lambda*weighting(Zmax,Zmin,i+1);
           A(k,i+1)=-2*lambda*weighting(Zmax,Zmin,i+1);
           A(k,i+2)=lambda*weighting(Zmax,Zmin,i+1);
           k=k+1;
        end
        x=A\b;
         g(:,color)=x(1:n);
         lE=x(n+1:size(x,1));
    end
    
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
         
    ret1=real_image(g(:,1),1,B,scale);
    ret1=ret1./(ret1+1);
    art1=tonemap(ret1);
    
    ret2=real_image(g(:,2),2,B,scale);
    ret2=ret2./(ret2+1);
    art2=tonemap(ret2);
    
    ret3=real_image(g(:,3),3,B,scale);
    ret3=ret3./(ret3+1);
    art3=tonemap(ret3);
    
    art=cat(3,art1,art2,art3);
    %imshow(art);
    
end

