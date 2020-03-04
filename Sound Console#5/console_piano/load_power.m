function output = load_power(base_f)
    switch(base_f)
        case {525} 
            power = load('grand_piano_A_do_525');
        case {589}
            power = load('grand_piano_A_re_589');
        case {663}
            power = load('grand_piano_A_mi_663');
        case {700}
            power = load('grand_piano_A_fa_700');
        case {786}
            power = load('grand_piano_A_so_786');
        case {882}
            power = load('grand_piano_A_la_882');
        case {991}
            power = load('grand_piano_A_xi_991');
        case {1050}
            power = load('grand_piano_A_do_1050');
    end
    output = power.pow_harmonic;
end