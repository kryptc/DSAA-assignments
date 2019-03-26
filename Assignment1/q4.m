disp("nearest neighbour interpolation");
array = ["krips.png", "boat.png", "F1.jpg"];
for i = 1:3
    A=imread(array(1,i));
    %[x,y,ch] = size(A);
    sfarr = [5, 10];
    for j = 1:2
        sf=sfarr(1,j);
%         imshow(A);
        
        [ht, wd, A_ch] = size(A);
        new_ht = ht * sf;
        new_wd = wd * sf;
        B_ch = A_ch;
              
        row = ceil((1:new_ht)/sf);
        col = ceil((1:new_wd)/sf);

        B = A(row, col, B_ch);
        imshowpair(A,B,'montage');
        pause(2);
    end
end
disp("bilinear interpolation");
  for i = 1:3
     A=imread(array(1,i));
     sfarr = [5, 10];
     for j = 1:2
         sf=sfarr(1,j);
     
         [ht, wd, A_ch] = size(A);
         new_ht = ht * sf;
         new_wd = wd * sf;
         new_ch = A_ch;
         B = zeros(new_ht, new_wd, A_ch, 'double');
         for m = 1:A_ch
             for k = 1:ht
                 for l = 1:wd
                     B((sf*(k-1))+1, (sf*(l-1)+1), m) = A(k,l, m);
                 end
             end
         end

         for ch = 1:A_ch
             for k = 1:sf:new_ht
                 for l = 1:new_wd-sf
                     if mod(l-1,sf) == 0
                         start_x = l;
                         end_x = l + sf;
                     end
                     start_y = k;
                     end_y = k;
                      B(k,l,ch) = (B(start_y,start_x,ch)*(end_x -l) + (l - start_x)*(B(end_y,end_x,ch)))/sf;
%                      B(k,l,ch) = B(start_y,start_x,ch) + ...
%                          (k-start_x)/(end_x-start_x)*...
%                          (B(start_y,end_x,ch)-B(start_y,start_x,ch));
                 end
             end
         end

         for ch = 1:A_ch
             for k = 1:new_wd
                 for l = 1:new_ht -sf
                     if mod(l-1,sf) == 0
                         start_y = l;
                         end_y = l + sf;
                     end
                     start_x = k;
                     end_x = k;
%                      B(l,k,ch) = B(start_y,start_x,ch) + ...
%                          (k-start_x)/(end_x-start_x)*...
%                          (B(start_y,end_x,ch)-B(start_y,start_x,ch));
                     B(l,k,ch) = (B(start_y,start_x,ch)*(end_y-l) + (l - start_y)*(B(end_y,end_x,ch)))/sf;
                 end
             end
         end
                  
         imshowpair(A,uint8(B), 'montage');
         pause(1);
     end
end
