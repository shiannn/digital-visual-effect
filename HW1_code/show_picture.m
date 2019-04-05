function [Z1,Z2,Z3]=show_picture(path,N,RGB_array)
    [P,Img]=get_pic(path,'jpg');
    Z1=zeros(N,P);
    Z2=zeros(N,P);
    Z3=zeros(N,P);
    [m,n,scale]=get_size(path);
    rng('default');
    %¼g¦b¤@°_
    
%     RGB_array=zeros(m,n,3,P);
%     for index=1:P
%         RGB_array(:,:,:,index)=imresize(imread(Img(index).name),scale);
%     end
    
    y1=floor(m*rand(N,1))+1;
    x1=floor(n*rand(N,1))+1;
    for index=1:P
        for i=1:N
            Z1(i,index)=RGB_array(y1(i),x1(i),1,index);
        end
    end
    
    
    y2=floor(m*rand(N,1))+1;
    x2=floor(n*rand(N,1))+1;
    for index=1:P
        for i=1:N
            Z2(i,index)=RGB_array(y2(i),x2(i),2,index);
        end
    end
    
    y3=floor(m*rand(N,1))+1;
    x3=floor(n*rand(N,1))+1;
    for index=1:P
        for i=1:N
            Z3(i,index)=RGB_array(y3(i),x3(i),3,index);
        end
    end
end