#! python2

from PIL import Image
from numpy import *

img = array(Image.open('original.jpg').convert('L'))
im = Image.fromarray(img)
im.save('gray.jpg')
