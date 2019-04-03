function png2jpg()
    A=dir('./*.png')
    for(i=1:size(A,1))
        P=imread(A(i).name);
        Name=[A(i).name(1:end-4),'.jpg'];
        imwrite(P,Name);
    end
end