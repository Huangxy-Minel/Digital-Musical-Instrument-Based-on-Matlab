function output = x_t_correct(x_jw,len)
    x_t = ifft(x_jw,44100*len); 
    j = 10000*len;
    for i = j:44100*len
        x_t(i) = x_t(i) * 1.4^(-0.0002*(i-j));
    end
%     for i = 1:3
%         k = 44100*i+1;
%         for j = 1:44100
%             x_t(k) = x_t(k-44100) * 0.1;
%             k = k+1;
%         end
%     end
    output = x_t;
end