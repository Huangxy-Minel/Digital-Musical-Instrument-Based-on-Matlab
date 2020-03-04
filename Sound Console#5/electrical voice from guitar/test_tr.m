function re2=test_tr(fin,t,fs)
fn=fix(fin);
[do1,~]=audioread('D:\Matlab\code\guitar\guitar do.wav'); %need a sample of "guitar's do";
re2=zeros(fs*t,2);
for k=1:length(fn)
    f=fn(k)*t;
    f1=fix(0.375*f);
    f2=fix(0.75*f);
    do_jw = fft(do1,fs);
    [~,fd]=max(do_jw(1:400));
    C_jw=zeros(fs*t,2);
    C2_JW=zeros(fs*t,2);
    C_jw(f1-5:f1+fix(0.1875*fd),1:2)=do_jw(fix(0.375*fd)-5:fix(0.375*fd)+fix(0.1875*fd),1:2);
    C_jw(f2-fix(0.1875*fd):f2+fix(0.125*fd),1:2)=do_jw(fix(0.75*fd)-fix(0.1875*fd):fix(0.75*fd)+fix(0.125*fd),1:2);
    C_jw(f-fix(0.125*fd):f+20,1:2)=do_jw(fd-fix(0.125*fd):fd+20,1:2);
    for i=2:5
        C_jw(f*i-10:f*i+10,1:2)=do_jw(fd*i-10:fd*i+10,1:2);
    end
    %plot(abs(C_jw(1:400)))
    C2_JW(fs/2+1+(t-1)*fs:fs-1+(t-1)*fs,1:2)=conj(C_jw(fliplr(1:fs/2-1),1:2));
    C2_JW=C_jw+C2_JW;
    re2=real(ifft(C2_JW,fs*t))+re2;
end
%sound(re2,44100);