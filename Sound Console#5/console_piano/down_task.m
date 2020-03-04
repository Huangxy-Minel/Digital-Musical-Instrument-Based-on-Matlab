function output = down_task(x_A, down_way, base_f, harmonic_num, left_x, right_x, way)
    switch(way)
        case {1,2,5}
            for i = 1:harmonic_num %开始衰减
                idx = base_f *i;
                left_down_a = log(x_A(idx))/log(down_way)/left_x;  %计算左衰减系数和右衰减系数
                right_down_a = log(x_A(idx))/log(down_way)/right_x;
                for j = 1:left_x
                    x_A(idx-j) = down_way^(left_down_a*(left_x-j));
                end
                for j = 1:right_x
                    x_A(idx+j) = down_way^(right_down_a*(right_x-j));
                end
            end
        case{3}
            for i = 1:harmonic_num
                idx = base_f * i;
                left_down_a = x_A(idx)/(left_x^(down_way));
                right_down_a = x_A(idx)/(right_x^(down_way));
                for j = 1:left_x
                    x_A(idx-j) = x_A(idx) - left_down_a * j^down_way;
                end
                for j = 1:right_x
                    x_A(idx+j) = x_A(idx) - right_down_a * j^down_way;
                end
            end
        case{4}
            for i = 1:harmonic_num %开始衰减
                idx = base_f *i;
                left_down_a = log(x_A(idx))/log(down_way)/left_x;  %计算左衰减系数和右衰减系数
                right_down_a = log(x_A(idx))/log(down_way)/right_x;
                for j = 1:left_x
                    x_A(idx-j) = x_A(idx) - down_way^(left_down_a*j);
                end
                for j = 1:right_x
                    x_A(idx+j) = x_A(idx) - down_way^(right_down_a*j);
                end
            end
    end
    output = x_A;
end