function output = correct_x_jw(x_jw, x_A, x_phase,len)
    for i = 1:22050*len
        x_jw(i) = x_A(i) * exp(complex(0,x_phase(i)));
    end
    %¹²éî¶Ô³Æ
    for i = 2:22050*len
        idx = 44100*len - i +2;
        x_jw(idx) = conj(x_jw(i));
    end
    output = x_jw;
end