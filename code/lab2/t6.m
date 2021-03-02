clear;
lena = imread('LENA.bmp');
mask = 0.015*ones(256,256);
figure, imshow(lena);
lena_dct= mask.*dct2(lena);
lena_Big= zeros(1024,1024);
for i = 1:256
  for j = 1:256
    lena_Big(i,j) = lena_dct(i,j);
   end
end
figure, imshow(lena_Big);
lena_back = idct2(lena_Big);
figure, imshow(lena_back);
