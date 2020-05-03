function [Xf,Yf]=rotation(Xi,Yi,R)

I=size(Xi,1);
J=size(Xi,2);

Xf=zeros(I,J);
Yf=zeros(I,J);

for ii=1:I
    for jj=1:J
        vector=[Xi(ii,jj);Yi(ii,jj)];
        vector=R*vector;
            Xf(ii,jj)=vector(1);
            Yf(ii,jj)=vector(2);
    end
end