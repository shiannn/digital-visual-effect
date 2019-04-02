function ret=show_picture(N,color)
    [P,Img]=get_pic('.',1);
    pixel_value=zeros(N,P);
    RGB = imread(Img(1).name);
    [m,n,k]=size(RGB);
    %rand¥Xxy
%     x=randi([1 n],N,1);
%     y=randi([1 m],N,1);
    rng(0,'twister');
    y=floor(m*rand(N,1));
    x=floor(n*rand(N,1));
    for index=1:P
        RGB = imread(Img(index).name);
        for i=1:N
            pixel_value(i,index)=RGB(y(i),x(i),color);
%             pixel_value(i,index,2)=RGB(y(i),x(i),2);
%             pixel_value(i,index,3)=RGB(y(i),x(i),3);
        end
        pixel_value;
        %choose particular pixel and get their RGB
    end
    ret=pixel_value;
end