clear;
lena = imread('LENA.bmp');
mask = 0.0005.*ones(256,256);
figure, imshow(lena);
lena_dct= mask.*dct2(lena);
lena_Small=lena_dct(1:128/4,1:128/4);
figure, imshow(lena_Small);
lena_back = idct2(lena_Small);
figure, imshow(lena_back);
