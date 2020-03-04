function output = add_down_task(x_A2, down_way, base_f, harmonic_num, left_x, right_x, num)
    for i = 1:harmonic_num %开始衰减
        idx = base_f *i + fix(right_x/num);
        left_down_a = log(x_A2(idx))/log(down_way)/left_x;  %计算左衰减系数和右衰减系数
        right_down_a = log(x_A2(idx))/log(down_way)/right_x;
        for j = 1:left_x
            x_A2(idx-j) = down_way^(left_down_a*(left_x-j));
        end
        for j = 1:right_x
            x_A2(idx+j) = down_way^(right_down_a*(right_x-j));
        end
        output = x_A2;
    end