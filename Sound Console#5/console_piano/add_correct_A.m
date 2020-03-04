function output = add_correct_A(x_A,base_f,base_A,harmonic_num,x_power, right_x, num)
    idx = base_f+fix(right_x/num);
    x_A(idx) = base_A; %������ֵ
    for i = 2:harmonic_num %г����ֵ
       idx = base_f * i+fix(right_x/num);
       x_A(idx) = base_A * (x_power(i) / x_power(1))^(1/2);
    end
    output = x_A;
end