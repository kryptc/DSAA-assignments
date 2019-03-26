filename = "sa_re_ga_ma.mp3";
[y,fs] = audioread(filename);

x = 1:1239552;
fast = resample(y,1,2);
flen = 1:length(fast);

slow = resample(y,2,1);
slen = 1:length(slow);

f = fs*2.0;
s = fs*0.5;
plot(slen,slow, '-o',flen,fast, '-x');

%sound(slow,fs);
%sound(fast,fs);


