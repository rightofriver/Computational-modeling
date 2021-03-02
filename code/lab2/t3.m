clear;
lena = imread('LENA.bmp');
mask = 0.004.*ones(256,256);
figure, imshow(lena);
lena_dct= mask.*dct2(lena);
for i = 1:256
  for j = 1:256
      if (i < 128) && (j < 128)
        continue
      else
        lena_dct(i,j) = 0;
      end
   end
end
figure, imshow(lena_dct);
lena_back = idct2(lena_dct);
figure, imshow(lena_back);
