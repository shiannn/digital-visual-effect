function Img=photographic_toneMapping(Radiance_Map)
%Radiance_Map=hdrread(Radiance_Map);


E_max=max(max(Radiance_Map(:,:)));
E_min=min(min(Radiance_Map(:,:)));

E_norm=zeros(size(Radiance_Map));
for i=1:size(Radiance_Map,1)
	for j=1:size(Radiance_Map,2)
		for k=1:3
			E_norm(i,j,k)=(Radiance_Map(i,j,k)-E_min)/(E_max-E_min);
		end
	end
end

L_w=rgb2gray(E_norm);
%L_w=zeros(size(Radiance_Map,1),size(Radiance_Map,2));
%L_w(:,:)=(54*E_norm(:,:,1)+183*E_norm(:,:,2)+19*E_norm(:,:,3))/256;
Sum=0;
epsi=0.00001; 

N=size(L_w,1)*size(L_w,2);
for i=1:size(L_w,1)
	for j=1:size(L_w,2)
        Sum=Sum+log(L_w(i,j)+epsi);
    end
end
Sum=Sum./N;
median_L_w=exp(Sum);

a=0.9; %0.36,0.72,0.09,0.045
L=zeros(size(L_w));
for i=1:size(L_w,1)
	for j=1:size(L_w,2)
		L(i,j) = ((a./median_L_w)*L_w(i,j));
	end
end

L_d=zeros(size(L_w));

L_white=max(L(:));

for i=1:size(L_w,1)
	for j=1:size(L_w,2)
		L_d(i,j) = L(i,j)*(1+(L(i,j)/(L_white*L_white)))/(1+L(i,j));
	end
end

scale=size(L_d);
for i=1:size(L_d,1)
	for j=1:size(L_d,2)
		scale(i,j)=L_d(i,j)/L_w(i,j);
	end
end

Img=zeros(size(Radiance_Map));
for i=1:size(Radiance_Map,1)
	for j=1:size(Radiance_Map,2)
		for k=1:3
			Img(i,j,k)=scale(i,j)*E_norm(i,j,k);
		end
	end
end

%imshow(Img);
end