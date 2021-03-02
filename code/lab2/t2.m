clear;
lena = imread('LENA.bmp');
mask = 0.004.*ones(256,256);
figure, imshow(lena);
lena_dct= mask.*dct2(lena);
figure, imshow(lena_dct);
lena_back = idct2(lena_dct);
figure, imshow(lena_back);
