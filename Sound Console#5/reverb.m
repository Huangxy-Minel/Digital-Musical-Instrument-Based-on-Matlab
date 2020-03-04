function output=reverb(input)
origin=input;
n=length(origin);
y=zeros(n,2);
pic=[];
k=5000;
for i=1:n/k
    pic(:,2*i-1:2*i)=origin((i-1)*k+1:i*k,:);   %把歌曲分为n/k块,每一段长k个单位
end
j=5;
while j<n/k
    y((j-1)*k+1:j*k,1:2)=pic(:,2*j-9:2*j-8)*0.1+pic(:,2*j-7:2*j-6)*0.2;
    y((j-1)*k+1:j*k,1:2)=y((j-1)*k+1:j*k,1:2)+pic(:,2*j-5:2*j-4)*0.2+pic(:,2*j-3:2*j-2)*0.4+pic(:,2*j-1:2*j)*0.8;
    j=j+1;
end
%sound(y(981451:1981451,:),fs)
output=y;