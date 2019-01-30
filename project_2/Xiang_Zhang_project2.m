%=================project 2: Xiang Zhang===================
%OUTPUT: BH procedure: 141 rejections
%        Bonferroni's : 0 rejections
N=3226;
m=15;
M=zeros(N,m);% each row represents the 15 (7+8) expression levels
%read data
% ex.txt: delete all the strings 'BRCA1','BRCA2','Sporadics' and the gene
% indices from hedenfalk.txt
fileID = fopen('hedenfalk_d.txt','r');
[A,count] = fscanf(fileID, ['%f'  char(32) ]);
fclose(fileID);

for k=1:m
    M(:,k)=A(((k-1)*N+1):(k*N),1);
end

% M_1=[]; % sorted data
% for i=1:N
%     M_1(i,:)=sort(M(i,:));
% end

P=zeros(N,1);% p-values
for i=1:N
    P(i)=ranksum(M(i,1:7),M(i,8:15));
end

%===========BH procedure==============
%output: # of rejections : 141
q=0.1;
P_1=sort(P);% increasing order
for i=0:N-1
    if P_1(N-i)<=(N-i)*q/N
        break;
    end
end
    if i==N-1
        rejection_1=0
    else
rejection_1=N-i
    end

%===========Bonferroni's================
%output: # of rejections : 0
% since alpha/N is very small, we will almost reject nothing
alpha=0.05;
for j=1:N
    if P_1(j)>alpha/N
        break;
    end
end
rejection_2=j-1


    
