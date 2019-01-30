r=2;
M=200m;
ratio=[];
for i=1:M
    q=2*r+i;
    ratio(i)=(q-r)*(2*q+r+1)/((q-r+2)*(2*q-r+1));
end
plot(ratio)
    