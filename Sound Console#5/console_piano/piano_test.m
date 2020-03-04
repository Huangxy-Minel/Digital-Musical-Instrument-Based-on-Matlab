[do,~] = audioread('D:\MATLAB\R2016a\Sound Console#1\piano\piano do.wav');
do = do(1:44100,1);
do_jw = fft(do,44100);
do_jw_correct = do_jw(:,1);
harmonic_f_do = [];
pow_harmonic = [];
left_x = 10;
right_x = 30;
m = 10; %输入参数，谐波个数，决定音色明亮程度

do_A_correct = [];

do_A = abs(do_jw(:,1));
do_phase = angle(do_jw(:,1));


harmonic_f_do = find_base(do_A,m);
pow_harmonic = calculate_pow(do_A,harmonic_f_do);
%save('grand_piano_A_do_c5','pow_harmonic')
%save('grand_piano_phase','do_phase')

do_A_correct = do_A;
for i = 1:length(harmonic_f_do)-1
    do_A_correct(harmonic_f_do(i+1)) = do_A_correct(harmonic_f_do(i)) * (pow_harmonic(i+1) / pow_harmonic(i))^(1/2);
end

for i = 1:(harmonic_f_do(1) - left_x)
    do_A_correct(i) = 0;
end
for j = 1:3
    for i = (harmonic_f_do(j) + right_x):(harmonic_f_do(j+1) - left_x)
        do_A_correct(i) = 0;
    end
end
for i = (harmonic_f_do(4) + right_x):length(do_A_correct)
    do_A_correct(i) = 0;
end

for i = 1:4
    idx = harmonic_f_do(i);
    left_down_a = log(do_A_correct(idx))/left_x;
    right_down_a = log(do_A_correct(idx))/right_x;
    for j = 1:left_x
        do_A_correct(idx-j) = exp(left_down_a*(left_x-j));
    end
    for j = 1:right_x
        do_A_correct(idx+j) = exp(right_down_a*(right_x-j));
    end
end

for i = 1:length(do_A_correct)
    do_jw_correct(i) = do_A_correct(i)*exp(complex(0,do_phase(i)));
end

do_correct = ifft(do_jw_correct,44100);
do_correct = real(do_correct);
do_correct(:,2) = do_correct(:,1);

subplot(1,2,1)
plot(do_A(1:4000))
title('do')

subplot(1,2,2)
%plot(unwrap(do_phase(1:400)))
% subplot(1,2,2)
%plot(do_A_correct(1:4000))
plot(do)
    
    
    
    
    