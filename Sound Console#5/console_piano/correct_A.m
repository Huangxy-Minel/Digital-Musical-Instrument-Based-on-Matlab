function x_A = correct_A(base_f,base_A,harmonic_num,x_power,len)
    idx = base_f;
    x_A = zeros(44100*len,1);
    x_A(idx) = base_A; %»ù²¨¸³Öµ
    for i = 2:harmonic_num %Ð³²¨¸³Öµ
       idx = base_f * i;
       x_A(idx) = base_A * (x_power(i) / x_power(1))^(1/2);
    end
end