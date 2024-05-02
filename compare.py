import cv2
import difflib
import urllib.request
import numpy as np
from skimage.metrics import structural_similarity
from math import floor


def CalcImageHash(image):
    resized = cv2.resize(image, (8, 8), interpolation=cv2.INTER_AREA) 
    gray_image = cv2.cvtColor(resized, cv2.COLOR_BGR2GRAY)
    avg = gray_image.mean()  
    ret, threshold_image = cv2.threshold(gray_image, avg, 255, 0)  
    _hash = ""
    for x in range(8):
        for y in range(8):
            val = threshold_image[x, y]
            if val == 255:
                _hash = _hash + "1"
            else:
                _hash = _hash + "0"

    return _hash


def CompareHash(hash1, hash2):
    l = len(hash1)
    i = 0
    count = 0
    while i < l:
        if hash1[i] != hash2[i]:
            count = count + 1
        i = i + 1
    return count


def compare(url, country):
    urllib.request.urlretrieve(url, 'static/countries/original.png')

    # Load images
    before = cv2.imread('static/countries/original.png')
    after = cv2.imread("static/" + country)
    resized_before = cv2.resize(before, (16, 16), interpolation=cv2.INTER_AREA)
    resized_after = cv2.resize(after, (16, 16), interpolation=cv2.INTER_AREA) 

    # Convert images to grayscale
    before_gray = cv2.cvtColor(resized_before, cv2.COLOR_BGR2GRAY)
    after_gray = cv2.cvtColor(resized_after, cv2.COLOR_BGR2GRAY)

    # Compute SSIM between the two images
    (score, diff) = structural_similarity(before_gray, after_gray, full=True)
    compared = score * 100
    
    hash1 = CalcImageHash(resized_before)
    hash2 = CalcImageHash(resized_after)
    if hash2 == '0'*64:
        compared = 0
    return hash1, hash2, compared

if __name__ == "__main__":
    url = 'data:image/png;base64,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'
    hash1, hash2, compared = compare(url)
    print(hash1)
    print(hash2)
    print(compared)
