function [myHeight,myWidth,scale]=get_size(path)
    [P,Img]=get_pic(path,'jpg');
    temp_read1=imfinfo([path,'/',Img(1).name]);
    myHeight=temp_read1.Height;
    myWidth=temp_read1.Width;
    scale=1;
    while(myHeight>1000 | myWidth>1000)
        myHeight=myHeight/2;
        myWidth=myWidth/2;
        scale=scale/2;
    end
end