function [g,lE]=gsolve(~,~,lambda)%~���NZ B
    Z=show_picture();
    size(Z);
    B=[-10:5];
    B=flip(B);
    
    %Z�ON*P�x�} �C�i�Ӥ�N��pixel��0~255 P�i�Ӥ�
    %RGB 3���C�ⳣ��0~255
    %B�n���ɶ������
    %�o��g�����X�v��
    Zmax=255;
    Zmin=0;
    n=256;
    A=zeros(size(Z,1)*size(Z,2)+n+1,n+size(Z,1));
    b=zeros(size(A,1),1);
    
    k=1;
    for i=1:size(Z,1)
        for j=1:size(Z,2)
            temp=weighting(Zmax,Zmin,Z(i,j)+1);
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
    g=x(1:n);
    size(g);
    domain=[1:256];
    range=g(domain);
    plot(range,domain);
    lE=x(n+1:size(x,1));
    
    ret=real_image(g);
    art=tonemap(ret);
    image(art);
end

