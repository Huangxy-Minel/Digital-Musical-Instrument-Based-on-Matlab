function output=Shake(input,f) %use 'f' to adjust the shaking level 
gain = 1.2;
n=2^f;
dc=0.2;
len = length(input(:,1));
t = (1:len)';
w = abs(0.5*sin(2*pi*n/len*t))+dc;
output = input*gain.*w;