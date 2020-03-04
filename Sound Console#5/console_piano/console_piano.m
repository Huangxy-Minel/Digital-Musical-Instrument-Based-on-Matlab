function console_piano(basef, base_A, len, harmonic_num, down_way, left_x, right_x, way)
    %len = 3; %输入最终合成长度，为44100整数倍
    base_f = fix(basef*len); %用户输入基波频率
    %base_A %用户输入基波幅值
    %harmonic_num = 4; %用户输入谐波个数，决定声音明亮程度
    %down_way = 3; %用户输入衰减方式，指数衰减，值为底数
    Fs = 44100; %采样率
    x_jw = zeros(44100*len,1); %初始化x_jw，长度44100，双声道
    %x_A = zeros(44100,1);  %初始化x_A，长度44100
    %left_x = 10;
    %right_x = 20;
    x_phase = zeros(44100*len,1); %自定义相位与幅值
    x_power = load_power(basef);
    %x_power(4) = 1; 
    %x_power = [90,100,10,10,5,5,1,1,1,1,1,1,1,1,1];
    %x_phase = load('grand_piano_phase');%从文件读取相位何幅值
    %x_power = load('grand_piano_A_do_525');
    %x_phase = x_phase.do_phase; %原声钢琴相位
    %x_power = x_power.pow_harmonic; %原声钢琴幅值变换

    %重塑x_A
    x_A = correct_A(base_f,base_A,harmonic_num,x_power,len);
    if(way == 2)
        x_A = add_A(x_A, 663, len);
        x_A = add_A(x_A, 786, len);
    end
    x_A = down_task(x_A, down_way, base_f, harmonic_num, left_x, right_x, way);
    if(way == 5)
        for i = 2:5
            x_A2 = add_correct_A(x_A,base_f,base_A*i/5,harmonic_num,x_power, right_x, i);
            x_A2 = add_down_task(x_A2, down_way, base_f, harmonic_num, left_x, right_x, i);
            x_A = x_A + x_A2;
        end
    end
    subplot(1,2,1)
    plot(x_A(1:5000*len))

    %重塑x_jw
    x_jw = correct_x_jw(x_jw, x_A, x_phase,len);
    %反fft得到得到时域xt
    x_t = x_t_correct(x_jw,len);
    subplot(1,2,2)
    plot(x_t)
    sound(x_t, 44100)
    filename = ('piano_do_525_6.wav'); %给文件取名    
    audiowrite(filename,x_t,Fs) %存储.wav音频文件，在这里文件名为test.wav
    
    