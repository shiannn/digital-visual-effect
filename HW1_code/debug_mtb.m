function debug_mtb(st,ed)
    P=ed-st+1;
    img_array=zeros(768,1024,3,P);
    offsets=[[10,20];[15,-30];[-20,-25];[-40,80]];
    k=1;
    for(i=st:ed)
        str=int2str(i);
        name=['img0',str,'.jpg'];
        A=imread(name);
        A=imtranslate(A, offsets(mod(i,4)+1,:));
        %figure
        %imshow(A);
        img_array(:,:,:,i-st+1)=A;
        
        %imshow(img_array(:,:,:,k)/256)
        name=int2str(k);
        name=[name,'.jpg'];
        imwrite(img_array(:,:,:,k)/256,name);
        k=k+1;
    end
    
end