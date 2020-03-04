[do,~] = audioread('D:\MATLAB\R2016a\Sound Console#1\bass\bass do.wav');
[re,~] = audioread('D:\MATLAB\R2016a\Sound Console#1\piano\piano re.wav');
[mi,~] = audioread('D:\MATLAB\R2016a\Sound Console#1\piano\piano mi.wav');
[fa,~] = audioread('D:\MATLAB\R2016a\Sound Console#1\piano\piano fa.wav');
[so,~] = audioread('D:\MATLAB\R2016a\Sound Console#1\piano\piano so.wav');
[la,~] = audioread('D:\MATLAB\R2016a\Sound Console#1\piano\piano la.wav');
[xi,~] = audioread('D:\MATLAB\R2016a\Sound Console#1\piano\piano xi.wav');
[do2,~] = audioread('D:\MATLAB\R2016a\Sound Console#1\piano\piano do^.wav');

do_jw = fft(do,8192);
re_jw = fft(re,8192);
mi_jw = fft(mi,8192);
fa_jw = fft(fa,8192);
so_jw = fft(so,8192);
la_jw = fft(la,8192);
xi_jw = fft(xi,8192);
do2_jw = fft(do2,8192);

subplot(8,1,1)
plot(abs(do_jw(1:100)))
subplot(8,1,2)
plot(angle(re_jw(1:400)))
subplot(8,1,3)
plot(angle(mi_jw(1:400)))
subplot(8,1,4)
plot(angle(fa_jw(1:400)))
subplot(8,1,5)
plot(angle(so_jw(1:400)))
subplot(8,1,6)
plot(angle(la_jw(1:400)))
subplot(8,1,7)
plot(angle(xi_jw(1:400)))
subplot(8,1,8)
plot(angle(do2_jw(1:400)))