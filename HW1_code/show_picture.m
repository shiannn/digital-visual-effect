function ret=show_picture(N)
    [P,name]=get_pic();
    pixel_value=zeros(N,P,3);
    RGB = imread(name(1,:));
    [m,n,k]=size(RGB);
    %rand¥Xxy
    x=randi([1 n],N,1);
    y=randi([1 m],N,1);
    for index=1:P
        RGB = imread(name(index,:));
%         if(index==1)
%             image(RGB);
%             [x,y] = ginput(N);
%             x=round(x);
%             y=round(y);
%         end
        for i=1:N
            pixel_value(i,index,1)=RGB(y(i),x(i),1);
            pixel_value(i,index,2)=RGB(y(i),x(i),2);
            pixel_value(i,index,3)=RGB(y(i),x(i),3);
        end
        pixel_value;
        %choose particular pixel and get their RGB
    end
    ret=pixel_value;
end