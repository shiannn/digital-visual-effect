function ret=show_picture()
    P=16;
    N=50;
    
    pixel_value=zeros(N,P);
    for index=61:76
        str=int2str(index);
        name=['memorial00',str,'.png'];
        RGB = imread(name);
        [m,n,k]=size(RGB);
        image(RGB);
        if(index==61)
            [x,y] = ginput(N);
            x=round(x);
            y=round(y);
        end
        for i=1:N
            pixel_value(i,index-60)=RGB(y(i),x(i),1);
        end
        pixel_value;
        %choose particular pixel and get their RGB
    end
    ret=pixel_value;
end