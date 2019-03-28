function transCR2()
    for i=627:862
        str=int2str(i);
        name=['IMG_0',str,'.CR2']
        A=imread(name);
        imshow(A);
        imwrite(A,['IMG_0',str,'.png']);
end