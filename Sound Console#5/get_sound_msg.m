d = daq.getDevices
dev = d(2);
s = daq.createSession('directsound'); 
s.NumberOfScans = 44100;
s.DurationInSeconds = 1; %采集1秒信息
s.Rate = 44100; %采样率44100
addAudioInputChannel(s,dev.ID,1)

%s.IsContinuous = true
%lh = addlistener(s,'DataAvailable',@Shake); 
%startBackground(s);
%pause(20)
%delete(lh)

i = 0;
while(i<10)
data = startForeground(s);
data(:,1) = data;
data(:,2) = data;
main(data)
i = i+1;
end