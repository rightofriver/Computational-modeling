clear;
lena = imread('LENA.bmp');
mask = 0.004.*ones(256,256);
figure, imshow(lena);
lena_dct= mask.*dct2(lena);
fid=fopen('8*8.txt','wt');%写入文件路径
for i=1:8
  for j=1:8
    if j==8
      fprintf(fid,'%g\n',lena_dct(i,j));
    else
      fprintf(fid,'%g\t',lena_dct(i,j));
    end
  end
end
fclose(fid);
fid=fopen('4*4.txt','wt');%写入文件路径
for i=1:4
  for j=1:4
    if j==4
      fprintf(fid,'%g\n',lena_dct(i,j));
    else
      fprintf(fid,'%g\t',lena_dct(i,j));
    end
  end
end
fclose(fid);
