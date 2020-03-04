function console_piano(basef, base_A, len, harmonic_num, down_way, left_x, right_x, way)
    %len = 3; %�������պϳɳ��ȣ�Ϊ44100������
    base_f = fix(basef*len); %�û��������Ƶ��
    %base_A %�û����������ֵ
    %harmonic_num = 4; %�û�����г���������������������̶�
    %down_way = 3; %�û�����˥����ʽ��ָ��˥����ֵΪ����
    Fs = 44100; %������
    x_jw = zeros(44100*len,1); %��ʼ��x_jw������44100��˫����
    %x_A = zeros(44100,1);  %��ʼ��x_A������44100
    %left_x = 10;
    %right_x = 20;
    x_phase = zeros(44100*len,1); %�Զ�����λ���ֵ
    x_power = load_power(basef);
    %x_power(4) = 1; 
    %x_power = [90,100,10,10,5,5,1,1,1,1,1,1,1,1,1];
    %x_phase = load('grand_piano_phase');%���ļ���ȡ��λ�η�ֵ
    %x_power = load('grand_piano_A_do_525');
    %x_phase = x_phase.do_phase; %ԭ��������λ
    %x_power = x_power.pow_harmonic; %ԭ�����ٷ�ֵ�任

    %����x_A
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

    %����x_jw
    x_jw = correct_x_jw(x_jw, x_A, x_phase,len);
    %��fft�õ��õ�ʱ��xt
    x_t = x_t_correct(x_jw,len);
    subplot(1,2,2)
    plot(x_t)
    sound(x_t, 44100)
    filename = ('piano_do_525_6.wav'); %���ļ�ȡ��    
    audiowrite(filename,x_t,Fs) %�洢.wav��Ƶ�ļ����������ļ���Ϊtest.wav
    
    