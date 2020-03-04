function base = find_base(x_A, m) %返回基波及谐波角标，m为谐波次数
    max_f = 22050;
    [~,base] = max(x_A);
    while(1)
        if m *base > max_f
            m = m-1;
        else
            break
        end
    end
    area = fix(base/4);
    for i = 2:m
        idx = base(1) * i;
        [~,temp] = max(x_A(idx-area:idx+area,1));
        base = [base,temp+idx-area-1];
    end
end