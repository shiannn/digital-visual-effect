function images=readImages(files,Path)
Totalnum=length(files);
name=[Path,'/',files(1).name];
information=imfinfo(name);
height=information.Height;
width=information.Width;

scale=1;
while height>1000 | width>1000
	height=height./2;
	width=width./2;
	scale=scale./2;
end

images=zeros(height,width,3,Totalnum,'uint8'); 
%picture height,picture width, RGB, number of pictures,uint8

for i=1:Totalnum
    name=[Path,'/',files(i).name];
    a=imread(name);
    images(:,:,:,i)=imresize(a,scale);
    
end
end