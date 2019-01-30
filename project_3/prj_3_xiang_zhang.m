% Proj #3--------JL lemma
% theoretical lb= 426.3 
% Xiang 
d=10000;% data dimension
n=100;
X=randn(d,n);%% d*n  each column correspnods to a point x
L=zeros(n,n);% original dist. matrix
L_1=zeros(n,n);% dist. after projection
for i=1:n-1
    for j=i+1:n
        L(i,j)=norm(X(:,i)-X(:,j))^2;
    end
end


err=[];% error maximum error ratio
A=zeros(n,n);
B=zeros(n,n);
K=500;
for k=20:20:K
       R=randn(k,d)/sqrt(k);
       for i=1:n-1
            for j=i+1:n
               L_1(i,j)=norm(R*X(:,i)-R*X(:,j))^2;
               A(i,j)=abs(L_1(i,j)-L(i,j));  
               B(i,j)=A(i,j)/L(i,j);% error ratio
            end
       end
       err(k/20)=max(max(B));
end
plot(20:20:K,err,'*')
hold on
thd=1/3*ones(1,length(20:20:K));
plot(20:20:K,thd,'-')


    