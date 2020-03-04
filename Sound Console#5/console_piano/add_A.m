function output = add_A(x_A, add_f, len)
    for i = 1:length(add_f)
        idx = add_f(i)*len;
        x_A(idx) = 2000;
    end
    output = x_A;
end