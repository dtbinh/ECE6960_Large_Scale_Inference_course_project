%======================Project 1===========================
%=====================Xiang Zhang==========================
% To run the code, choose one test method and comment all other coded below line 11.
% The output of each test is listed in the comment area 

M=500; % # of trials
N=10^6;
alpha=0.01; %# two-sdided sig. level

z= qfuncinv(alpha/(2*N));
rjt=0;%# rejection counter
temp=0;


% % ========Bonferroni test--sparse strong effects===========
% % output: power= 0.870000000000000
% % innterpretation: works fairly well

for k=1:M
    Y=randn(N,1);
    for i=1:4
         Y(i)=Y(i)+5.45;
    end
    p_min=min(qfunc(Y));
    if p_min<= alpha/(2*N)% two-sided level
         temp=1;
         rjt=rjt+temp;
    end
end
power=rjt/M


%%========Bonferroni test-- distributed weak effects=====
%% output: power=0.004000000000000
%% interpretation: the low power shows that Bonferroni method is not good at dealing with multiple weak effects

for k=1:M
    Y=randn(N,1);
    for i=1:2400
         Y(i)=Y(i)+1.1;
    end
    p_min=min(qfunc(Y));
    if p_min<= alpha/(2*N)% two-sided level
         temp=1;
         rjt=rjt+temp;
    end
end
power=rjt/M;


% % % ========Fisher test--sparse strong effects===========
% % % output: power= 0.006000000000000
% % % innterpretation: since Fisher's method combines all the N p-values, a few (not many) strong
% % % effects(very small p-values) do not contribute much to T, which leads to the acception of H0

for k=1:M
    Y=randn(N,1);
    for i=1:4
         Y(i)=Y(i)+5.45;
    end
    T=sum(-2*log(qfunc(Y)));
    if T> chi2inv(1-alpha,2*N)% one-sided level
         temp=1;
         rjt=rjt+temp;
    end
end
power=rjt/M


% % % ========Fisher test--sparse strong effects===========
% % % output: power= 0.856000000000000
% % % innterpretation: Fisher's meethod combines all the weak effects and works fairly well
% 
for k=1:M
    Y=randn(N,1);
    for i=1:2400
         Y(i)=Y(i)+1.1;
    end
    T=sum(-2*log(qfunc(Y)));
    if T> chi2inv(1-alpha,2*N)% one-sided level
         temp=1;
         rjt=rjt+temp;
    end
end
power=rjt/M



% % % ========Chi-squared test--sparse strong effects===========
% % % output: power=  0.004000000000000
% 
for k=1:M
    Y=randn(N,1);
    for i=1:4
         Y(i)=Y(i)+5.45;
    end
    T=sum(Y.^2);
    if (T-N)/(sqrt(2*N))> qfuncinv(alpha/2)% one-sided level
         temp=1;
         rjt=rjt+temp;
    end
end
power=rjt/M;

% % % ========Chi-squared test--distributed weak effects===========
% % % output: power=0.278000000000000

for k=1:M
    Y=randn(N,1);
   for i=1:2400
         Y(i)=Y(i)+1.1;
    end
    T=sum(Y.^2);
    if (T-N)/(sqrt(2*N))> qfuncinv(alpha/2)% one-sided level
         temp=1;
         rjt=rjt+temp;
    end
end
power=rjt/M;
