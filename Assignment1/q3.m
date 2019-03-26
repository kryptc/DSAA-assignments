img = imread("Faces.jpg");
sub_img = imread("F1.jpg");
noise_img = imread("F2.jpg");

img = rgb2gray(img);
sub_img = rgb2gray(sub_img);
noise_img = rgb2gray(noise_img);

%new_img = xcorr2(sub_img, img);
new_img = normxcorr2( sub_img(:,:,1), img(:,:,1));
new_img2 = normxcorr2( noise_img(:,:,1), img(:,:,1));

[ax, ay, ach] = size(sub_img);
[bx, by, bch] = size(img);
[cx, cy, cch] = size(noise_img);

[val,p] = max(new_img(:));
[val2,p2] = max(new_img2(:));

x = floor(p/size(new_img,1));
x2 = floor(p2/size(new_img2,1));

y = p - x*size(new_img,1);
y2 = p2 - x2*size(new_img2,1);

imshow(new_img);
hold on;

imshow(img);
hold on;
rectangle('Position',[x - size(sub_img,1),y - size(sub_img,2),size(sub_img,1),size(sub_img,2)],...
          'Curvature',[0.8,0.4], 'LineWidth',2,'LineStyle','-','EdgeColor','r')
      
pause(3);
hold off;
disp("noisy image");
imshow(new_img2);
hold on;
      
imshow(img);
hold on;
rectangle('Position',[x - size(sub_img,1),y - size(sub_img,2),size(sub_img,1),size(sub_img,2)],...
          'Curvature',[0.8,0.4], 'LineWidth',2,'LineStyle','--','EdgeColor','w')