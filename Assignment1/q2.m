 fs = 44.1e3;
 bits = 24;
 input = audiorecorder(fs,bits,1);
 disp("speak now");
 recordblocking(input,2);
 disp("hold your peace");
 play(input);
% pause(4);
% 
 data = getaudiodata(input);
 audiowrite('MyRecording.wav', data, fs);
[x,y] = audioread('MyRecording.wav');
plot(data);
sound(x,y);
pause(2);

%subsample to 24, 16, 8, 4 KHz
array = [24e3, 16e3, 8e3, 4e3];
for i= 1:4
    [p,q] = rat(array(1,i)/fs);
    newsound = resample(x,p,q);
    sound(newsound,fs);
    pause(2);
end

%simulate in 3 different environments
env_arr = ["MINI CAVES E001 M2S.wav","MEDIUM METAL ROOM E001 M2S.wav","SMALL CHURCH E001 M2S.wav"];
for j=1:3
    file = env_arr(1,j);
    [p,q] = audioread(file);
    output = convn(x,p,'full');
    sound(output,fs);
    pause(1);
end


    
