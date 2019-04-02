function [P,Img]=get_pic(path,a)
    if(a==1)
        path_to_pictures=fullfile(path,'*.jpg');
        Img=dir(path_to_pictures);
        P=size(Img,1);
    elseif(a==2)
        path_to_pictures=fullfile(path,'*.cr2');
        Img=dir(path_to_pictures);
        P=size(Img,1);
    end
end