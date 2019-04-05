function B=get_exposure(path)
    cur_path=pwd;
    path_to_cr2=fullfile(cur_path,path,'cr2');
    [P,Img]=get_pic(path_to_cr2,'cr2');
    B=zeros(P,1);
    for i=1:P
        temp_read=imfinfo(fullfile(path_to_cr2,Img(i).name));
        temp_camera=temp_read.DigitalCamera;
        temp_camera.ExposureTime;
        B(i,1)=log(temp_camera.ExposureTime);
    end
end