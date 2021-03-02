# -*- coding: utf-8 -*-

from PIL import Image

from pylab import *

from numpy import *

#读取图片,灰度化，并转为数组
img = array(Image.open('original.jpg').convert('L'))

#信噪比
SNR = 0.95

#计算总像素数目 SP， 得到要加噪的像素数目 NP = SP * (1-SNR)
noiseNum=int((1- SNR)*img.shape[0]*img.shape[1])

#于随机位置将像素值随机指定为0或者255
for i in range(noiseNum):

    randX=random.random_integers(0,img.shape[0]-1)  

    randY=random.random_integers(0,img.shape[1]-1)  

    if random.random_integers(0,1)==0:  

        img[randX,randY]=0  

    else:  

        img[randX,randY]=255   

#显示图像
gray()

im = Image.fromarray(img)
im.save('output.jpg')
