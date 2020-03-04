[out,Fs]=audioread('D:\Matlab\code\violin2.wav');
% out=Mix(out,Fs);
%  out=balance1(out,1);%use the second input to change model 
  out=reverb(out);
%  out=Shake(out,6);
sound(out,Fs);
%audiowrite('D:\Matlab\code\dxj_b1r.wav',out,Fs);
% 2 + 3 is suitable for human's voice
% 4 is suitable for guitar
% 1 can simulate radio voice