function PianoPlay(note, fs, way)
    switch(note)
        case {1}
            base_f = 525;
        case {2}
            base_f = 589;
        case {3}
            base_f = 663;
        case {4}
            base_f = 700;
        case {5}
            base_f = 786;
        case {6}
            base_f = 882;
        case {7}
            base_f = 991;
    end
    switch(way)
        case {1}
            console_piano(base_f,2000,2,10,3,10,30,1)
        case {2}
            console_piano(base_f,2000,2,5,3,10,30,1)
        case {3}
            console_piano(base_f,2000,2,2,3,10,30,1)
        case {4}
            console_piano(base_f,2000,2,10,3,50,50,1)
        case {5}
            console_piano(base_f,2000,2,10,3,100,100,1)
        case {6}
            console_piano(base_f,2000,2,10,3,200,200,1)
        case {7}
            console_piano(base_f,2000,2,3,3,10,30,2);
        case {8}
            console_piano(base_f,2000,2,10,3,10,30,3)
        case {9}
            console_piano(base_f,2000,2,10,3,50,50,3)
        case {10}
            console_piano(base_f,2000,2,5,3,100,100,5)
        case {11}
            console_piano(base_f,2000,4,10,3,10,30,5)            
    end
end