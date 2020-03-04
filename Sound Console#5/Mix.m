function output=Mix(input,FS)
gain = 3;
tone = 0;%use tone to gain low frequency by 0 or high by 1 
output=input*gain;
%output(:,1)=input*gain;
%output(:,2)=output(:,1);
output1=gtrdist(output(:,1),gain,tone,FS);
output2=gtrdist(output(:,2),gain,tone,FS);
output=[output1,output2];
% output1=[zeros(n,1);output(1:length(output)-n)];
% output2=[output(n+1:length(output));zeros(n,1)];
% output3=[output(2*n+1:length(output));zeros(2*n,1)];
% output4=[output(3*n+1:length(output));zeros(3*n,1)];
% output=output+output2+output3+output4;

end