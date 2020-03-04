function main(data)
    %plot(event.TimeStamps,event.Data)
    %output = Shake(data,6);
    output = balance1(data,1);
    output = Mix(output,44100);
    output = reverb(output);
    sound(output,44100)
end