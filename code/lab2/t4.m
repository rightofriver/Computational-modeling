clear;
lena = imread('LENA.bmp');
mask = 0.1.*ones(256,256);%系数可调
figure, imshow(lena);
lena_dct= mask.*dct2(lena);
for i = 1:128
  for j = 1:128
    lena_dct(i,j) = 0;
   end
end
figure, imshow(lena_dct);
lena_back = idct2(lena_dct);
figure, imshow(lena_back);
