clear;
lena = imread('LENA.bmp');
mask = ones(256,256);
% mask
figure(1), imshow(real(lena));
lena_fft= mask.*fftshift(fft2(lena));
% fft2(lena)
% figure(2),imshow(real(lena_fft));
figure(2), imshow(log(abs(lena_fft)),[]);
figure(3), imshow(angle(lena_fft),[]);
lena_back= ifft2(ifftshift(lena_fft));
figure(4), imshow(real(lena_back));
