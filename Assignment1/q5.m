filename = "sa_re_ga_ma.mp3";
[y,fs] = audioread(filename);
b = smoothdata(y);
x = 1:1239552;
%sound(y,fs);

leny = 1:length(y);
plot(leny,y, x,b);

%smoothed data increased amplitude slightly compared to gaussian
%sound(b,fs);
c = smoothdata(y,'gaussian',2);
plot(leny,y,x,c);
cd = smoothdata(y,'gaussian',20);
plot(leny,y,x,cd);
d = smoothdata(y,'includenan');
plot(leny,y,x,d);
c = smoothdata(y,'movmean');
plot(leny,y,x,c);
cd = smoothdata(y,'movmedian');
plot(leny,y,x,cd);
d = smoothdata(y,'lowess');
plot(leny,y,x,d);
c = smoothdata(y,'loess');
plot(leny,y,x,c);
cd = smoothdata(y,'rlowess');
plot(leny,y,x,cd);
d = smoothdata(y,'rloess');
plot(leny,y,x,d);
d = smoothdata(y,'sgolay');
plot(leny,y,x,d);



