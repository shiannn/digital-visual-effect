function [P,Img]=get_pic(path,a)
    if(sum(a=='jpg')==3)
        path_to_pictures=fullfile(path,'*.jpg');
        Img=dir(path_to_pictures);
        P=size(Img,1);
    elseif(sum(a=='cr2')==3)
        path_to_pictures=fullfile(path,'*.cr2');
        Img=dir(path_to_pictures);
        P=size(Img,1);
    end
end