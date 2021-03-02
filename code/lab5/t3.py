# -*- coding: utf-8 -*-

from PIL import Image

def depoint(img):

    pixdata = img.load()

    w, h = img.size

    index = 2

    for y in range(index, h-index):

        for x in range(index, w-index):

            if pixdata[x,y] == 0 or pixdata[x,y] == 255:
                count = 0
                tmp = 0
                for i in range(x-index,x+1+index):
                    for j in range(y-index,y+1+index):
                        counttmp = 0
                        if pixdata[i,j] == 0 or pixdata[i,j] == 255:
                            continue
                        else:
                            if i != x:
                                counttmp += abs(1/(i-x))
                            if j != y:
                                counttmp += abs(1/(j-y))
                            tmp += counttmp*pixdata[i,j]
                            count += counttmp
                if count == 0:
                    continue
                pixdata[x,y] = int(tmp/count)
               
    return img

if __name__ == '__main__':

    img = Image.open('output.jpg')
    w, h = img.size
    img = depoint(img)
    img.save('recovery.jpg')
