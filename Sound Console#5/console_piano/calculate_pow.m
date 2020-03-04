function power = calculate_pow(x_A, harmonic_f) %返回谐波对应的功率
    power = [];
    for i = 1:length(harmonic_f)
        temp = 0;
        idx = harmonic_f(i);
        for j = 1:20
            if(x_A(idx+j)) > 25
                temp = x_A(idx+j)^2 + temp;
            end
            if(x_A(idx-j)) > 25
                temp = x_A(idx-j)^2 + temp;
            end
        end
        temp = temp + x_A(idx)^2;
        power = [power, temp];
    end
end