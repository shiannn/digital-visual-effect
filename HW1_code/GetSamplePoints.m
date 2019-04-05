function [Z1,Z2,Z3]=GetSamplePoints(num,img)
height=size(img,1);
width=size(img,2);
rng('default');
y1=floor(height*rand(num,1))+1;
x1=floor(width*rand(num,1))+1;
y2=floor(height*rand(num,1))+1;
x2=floor(width*rand(num,1))+1;
y3=floor(height*rand(num,1))+1;
x3=floor(width*rand(num,1))+1;

image_numbers=size(img,4);
Z1=zeros(num,image_numbers); %is the pixel values of pixel location number i in image j and color k
Z2=zeros(num,image_numbers);
Z3=zeros(num,image_numbers);

for i=1:num
    for j=1:image_numbers
            Z1(i,j)=img(y1(i),x1(i),1,j);
    end
end
for i=1:num
    for j=1:image_numbers
            Z2(i,j)=img(y2(i),x2(i),2,j);
    end
end
for i=1:num
    for j=1:image_numbers
            Z3(i,j)=img(y3(i),x3(i),3,j);
    end
end
end