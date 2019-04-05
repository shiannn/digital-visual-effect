function LDR=my_tone_mapping(radiance_map,a)
    %radiance_map m*n*3
    [m n q]=size(radiance_map);
%     mymax=zeros(3,1);
%     mymin=zeros(3,1);
%     mymax(1)=max(max(radiance_map(:,:,1)));
%     mymax(2)=max(max(radiance_map(:,:,2)));
%     mymax(3)=max(max(radiance_map(:,:,3)));
%     mymin(1)=min(min(radiance_map(:,:,1)));
%     mymin(2)=min(min(radiance_map(:,:,2)));
%     mymin(3)=min(min(radiance_map(:,:,3)));
    mymax=max(max(max(radiance_map)));
    mymin=min(min(min(radiance_map)));
    Enorm=zeros(m,n,q);
    for(i=1:m)
        for(j=1:n)
            for(k=1:q)
                Enorm(i,j,k)=(radiance_map(i,j,k)-mymin)/(mymax-mymin);
            end
        end
    end
    L=zeros(m,n);
    L=rgb2gray(Enorm);
%     L=(54*Enorm(:,:,1)+183*Enorm(:,:,2)+19*Enorm(:,:,3))/256;
    
    delta=0.00001;
    logspace=log(L+delta);
    Lavg=exp(mean(mean(logspace)));
    
    T=a*(L/Lavg);
    
    white=max(max(T));
    if(white>255)
        white=255;
    end
    Ltone=(T.*(1+(T/(white^2))))./(1+T);
    M=Ltone./L;
    
    %use Enorm?
%     Rnew=M.*radiance_map(:,:,1);
%     Gnew=M.*radiance_map(:,:,2);
%     Bnew=M.*radiance_map(:,:,3);
    Rnew=M.*Enorm(:,:,1);
    Gnew=M.*Enorm(:,:,2);
    Bnew=M.*Enorm(:,:,3);
    
    LDR=cat(3,Rnew,Gnew,Bnew);
end