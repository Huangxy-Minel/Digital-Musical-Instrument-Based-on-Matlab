function song(f,t,fs) 
%f is a 1xn vector to get a series of frequncies of notes you need;
%t is the time a note should keep, often 1;
flst=0;
for j=1:length(f)
    re(flst+1:flst+fs*t(j),1:2)=test_tr(f(j),t(j),fs); 
    flst=flst+fs*t(j);
end
%audiowrite('D:\Matlab\code\tiger.wav',re,fs);
sound(re,fs);